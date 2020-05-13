import pandas as pd
import numpy as np
from sklearn.preprocessing import StandardScaler

# CUST_DATA 카테고리 원 핫 인코딩
def one_hot(cust):
    category = ['SEX', 'RESI_TYPE_CODE', 'CTPR', 'OCCP_GRP_1', 'WEDD_YN', 'MATE_OCCP_GRP_1']
    cust = pd.get_dummies(cust, columns=category)
    return cust

## CLAIM_DATA 파생변수 생성

# 각 고객별 평균 입원일수
def hosp_days(claim, cust):
    claim_df = claim.pivot_table(index='CUST_ID', values='VLID_HOSP_OTDA', aggfunc='mean')
    claim_df.reset_index(inplace=True)
    cust = pd.merge(cust, claim_df, how='left', on="CUST_ID")
    cust.rename(columns={'VLID_HOSP_OTDA':'HOSP_DAYS'}, inplace=True)
    return cust

# 각 고객별 유의병원 출입여부
def heed_hosp(claim, cust):
    id_heed = claim[claim['HEED_HOSP_YN']=='Y']['CUST_ID'].unique()
    cust['HEED_HOSP'] = np.nan
    cust['HEED_HOSP'][cust['CUST_ID'].isin(id_heed)] = 1
    cust['HEED_HOSP'].fillna(0, inplace=True)
    return cust

# 각 고객별 청구횟수
def claim_count(claim, cust):
    청구횟수 = claim.pivot_table(index='CUST_ID', values='POLY_NO', aggfunc='count').reset_index()
    청구횟수.columns = ['CUST_ID', 'CLAIM_COUNT']
    cust = pd.merge(cust, 청구횟수, on='CUST_ID', how='left')
    return cust

# 의사별 사기비율
def doc_siu_ratio(claim, cust):
    data = pd.merge(claim, cust[['CUST_ID', 'SIU_CUST_YN']], how='left', on='CUST_ID')
    의사별전체 = data.pivot_table(index=['CHME_LICE_NO'], values='POLY_NO', aggfunc='count').reset_index()
    의사별_YN = data.pivot_table(index=['CHME_LICE_NO', 'SIU_CUST_YN'], values='POLY_NO', aggfunc='count').reset_index()
    의사별_YN = 의사별_YN[의사별_YN['SIU_CUST_YN']=='Y']
    의사별전체 = pd.merge(의사별전체, 의사별_YN, how='left', on='CHME_LICE_NO')
    의사별전체['DOC_SIU_RATIO'] = 의사별전체['POLY_NO_y']/의사별전체['POLY_NO_x']
    의사별전체.fillna(0, inplace=True)
    의사별사기비율 = 의사별전체[['CHME_LICE_NO', 'DOC_SIU_RATIO']]
    df_lice = claim.pivot_table(index=['CUST_ID', 'CHME_LICE_NO'], values='POLY_NO', aggfunc='count').reset_index()
    df_lice = pd.merge(data, 의사별사기비율, how='left', on='CHME_LICE_NO')
    idlice_ratio = df_lice.pivot_table(index='CUST_ID', values='DOC_SIU_RATIO', aggfunc='max').reset_index()
    cust = pd.merge(cust, idlice_ratio, how='left', on='CUST_ID')
    return cust

# 병원별 사기비율
def hosp_siu_ratio(claim, cust):
    data = pd.merge(claim, cust[['CUST_ID', 'SIU_CUST_YN']], how='left', on='CUST_ID')
    병원별전체 = data.pivot_table(index=['HOSP_CODE'], values='POLY_NO', aggfunc='count').reset_index()
    병원별_YN = data.pivot_table(index=['HOSP_CODE', 'SIU_CUST_YN'], values='POLY_NO', aggfunc='count').reset_index()
    병원별_YN = 병원별_YN[병원별_YN['SIU_CUST_YN']=='Y']
    병원별전체 = pd.merge(병원별전체, 병원별_YN, how='left', on='HOSP_CODE')
    병원별전체['HOSP_SIU_RATIO'] = 병원별전체['POLY_NO_y']/병원별전체['POLY_NO_x']
    병원별전체.fillna(0, inplace=True)
    병원사기비율 = 병원별전체[['HOSP_CODE', 'HOSP_SIU_RATIO']]
    df_hosp = claim.pivot_table(index=['CUST_ID', 'HOSP_CODE'], values='POLY_NO', aggfunc='count').reset_index()
    df_hosp = pd.merge(data, 병원사기비율, how='left', on='HOSP_CODE')
    idhosp_ratio = df_hosp.pivot_table(index='CUST_ID', values='HOSP_SIU_RATIO', aggfunc='max').reset_index()
    cust = pd.merge(cust, idhosp_ratio, how='left', on='CUST_ID')
    return cust

def hosp_doc_siu(cust):
    cust['HOSP_DOC_SIU'] = cust['DOC_SIU_RATIO'] * cust['HOSP_SIU_RATIO']
    return cust

def acci_ratio_n(claim, cust):
    acci_claim = claim.pivot_table(index=['CUST_ID', 'ACCI_DVSN'], values='POLY_NO', aggfunc='count').unstack(1).reset_index()
    acci_claim = acci_claim.values
    acci_claim = pd.DataFrame(acci_claim)
    acci_claim.fillna(0, inplace=True)
    acci_claim.columns = ['CUST_ID', 'ACCI_RATIO_1', 'ACCI_RATIO_2', 'ACCI_RATIO_3']
    cust = pd.merge(cust, acci_claim, on='CUST_ID', how='left')
    cust['ACCI_RATIO_1'] = cust['ACCI_RATIO_1'] / cust['CLAIM_COUNT']
    cust['ACCI_RATIO_2'] = cust['ACCI_RATIO_2'] / cust['CLAIM_COUNT']
    cust['ACCI_RATIO_3'] = cust['ACCI_RATIO_3'] / cust['CLAIM_COUNT']
    return cust

def acci_dmnd(claim, cust):
    claim_acci = claim.loc[:, ['CUST_ID', 'ACCI_DVSN', 'DMND_RESN_CODE']]
    claim_acci['value'] = 1
    cust_claim_df = claim_acci.pivot_table(index=['CUST_ID'], columns=['ACCI_DVSN', 'DMND_RESN_CODE'], values=['value'],
                                           aggfunc='count', fill_value=0)
    cust_claim_df = cust_claim_df.reset_index(level=['CUST_ID'], col_level=1)
    cust_claim_df.columns = cust_claim_df.columns.droplevel(level=0)
    cust_claim_df.columns = ['_'.join([str(col) for col in cols]) for cols in cust_claim_df.columns]
    cust_claim_df = cust_claim_df.rename(columns={'CUST_ID_': 'CUST_ID'})
    cust = pd.merge(cust, cust_claim_df, how='left', on='CUST_ID')
    return cust

# 표준화
def standardization(cust, claim):
    cust = one_hot(cust)
    cust = hosp_days(claim, cust)
    cust = heed_hosp(claim, cust)
    cust = claim_count(claim, cust)
    cust = doc_siu_ratio(claim, cust)
    cust = hosp_siu_ratio(claim, cust)
    cust = hosp_doc_siu(cust)
    cust = acci_ratio_n(claim, cust)
    cust = acci_dmnd(claim, cust)

    scaling_features = cust[['RESI_COST', 'TOTALPREM', 'MAX_PRM', 'CUST_INCM', 'RCBASE_HSHD_INCM', 'JPBASE_HSHD_INCM']]
    scaler = StandardScaler()
    scaled_nd = scaler.fit_transform(scaling_features)
    scaled_df = pd.DataFrame(scaled_nd, columns=scaling_features.columns)
    cust.drop(['RESI_COST', 'TOTALPREM', 'MAX_PRM', 'CUST_INCM', 'RCBASE_HSHD_INCM', 'JPBASE_HSHD_INCM'], axis=1, inplace=True)
    cust = pd.concat([cust, scaled_df], axis=1)
    def yn2_10(x):
        if x == 'Y':
            return 1
        elif x == 'N':
            return 0
        else:
            pass
    cust['SIU_CUST_YN'] = cust['SIU_CUST_YN'].apply(yn2_10)
    return cust

# 데이터셋 나누기
def divided_data(cust):
    train = cust[cust['DIVIDED_SET']==1].reset_index(drop=True)
    test = cust[cust['DIVIDED_SET']==2].reset_index(drop=True)#.sample(n=10)
    train.drop('DIVIDED_SET', axis=1, inplace=True)
    test.drop('DIVIDED_SET', axis=1, inplace=True)
    train_X = train.drop(['CUST_ID', 'SIU_CUST_YN'], axis=1)
    train_y = train['SIU_CUST_YN']
    test_X =test.drop(['CUST_ID', 'SIU_CUST_YN'], axis=1)
    return train_X, train_y, test_X, test

# 모델링
def over_sampling(train_X, train_y):
    from imblearn.over_sampling import SMOTE
    sm = SMOTE()
    X_resampled, y_resampled = sm.fit_sample(train_X, train_y)
    from sklearn.model_selection import train_test_split
    X_train, X_val, y_train, y_val = train_test_split(X_resampled, y_resampled, test_size=0.3, shuffle=True, random_state=42)
    return X_train, X_val, y_train, y_val, X_resampled, y_resampled


def modeling(X_train, X_val, y_train, y_val, X_resampled, y_resampled):
    from sklearn.externals import joblib
    from imblearn.over_sampling import SMOTE
    sm = SMOTE()

    # Random Forest
    from sklearn.ensemble import RandomForestClassifier
    rf_model = RandomForestClassifier(n_estimators=100, max_features=16, random_state=42)
    rf_model.fit(X_train, y_train)

    # 객체를 pickled binary file 형태로 저장한다
    file_name = 'rf_model.pkl'
    joblib.dump(rf_model, file_name)

    #인공신경망
    from sklearn.model_selection import train_test_split
    def model_fit_assessment(X, y, model):
        X_resampled, y_resampled = sm.fit_sample(X, y)
        X_train, X_val, y_train, y_val = train_test_split(X_resampled, y_resampled, test_size=0.3, shuffle=True, random_state=42)
        model.fit(X_train, y_train)
        pred = model.predict(X)

    from sklearn.neural_network import MLPClassifier
    mlp_model = MLPClassifier(hidden_layer_sizes=(30, 30, 20, 20))
    mlp_model.fit(X_train, y_train)
    # model_fit_assessment(X_resampled, y_resampled, mlp_model)

    # 객체를 pickled binary file 형태로 저장한다
    file_name = 'mlp_model.pkl'
    joblib.dump(mlp_model, file_name)

    # XGBOOST
    from xgboost import XGBClassifier
    xgb_model = XGBClassifier(max_depth=10, learning_rate=0.01, n_estimators=100, random_state=42)
    xgb_model.fit(X_train, y_train)

    # 객체를 pickled binary file 형태로 저장한다
    file_name = 'xgb_model.pkl'
    joblib.dump(xgb_model, file_name)

    return rf_model, mlp_model, xgb_model

# Ensemble
def ensemble(rf_model, xgb_model, mlp_model, X_train, y_train):
    from sklearn.ensemble import VotingClassifier
    voting_model = VotingClassifier(estimators=[('rf', rf_model), ('xgb', xgb_model), ('mip', mlp_model)], voting='soft')
    voting_model.fit(X_train, y_train)
    return voting_model

def ensemble_pickle(voting_model):
    from sklearn.externals import joblib
    # 객체를 pickled binary file 형태로 저장한다
    file_name = 'voting_model.pkl'
    dump_type = joblib.dump(voting_model, file_name)

    # pickled binary file 형태로 저장된 객체를 로딩한다
    voting_test = joblib.load(file_name)
    return voting_test

def prediction(test, voting_test, cust_id):
    import pandas as pd
    import json

    # prediction with Ensemble Model
    X_test = test.drop(['CUST_ID', 'SIU_CUST_YN'], axis=1)
    predict_answer = voting_test.predict(X_test)
    predict_answer = pd.DataFrame(predict_answer)
    predict_result = predict_answer.iloc[0,0]
    print(predict_result)

    predict_proba = voting_test.predict_proba(X_test)
    predict_proba = pd.DataFrame(predict_proba)
    predict_proba_no = round(predict_proba.iloc[0,0]*100, 2)
    predict_proba_yes = round(predict_proba.iloc[0,1]*100, 2)
    print(predict_proba_no)
    print(predict_proba_yes)

    # predict = {
    #     'CUST_ID' : cust_id,
    #     'SIU_CUST_YN' : predict_result,
    #     'SIU_CUST_PROBA' : [
    #         {
    #             'NO' : predict_proba_no,
    #             'YES' : predict_proba_yes
    #         }
    #     ]
    # }

    predict = pd.DataFrame([[cust_id, predict_result, predict_proba_no, predict_proba_yes]],
                               columns=["CUST_ID", "SIU_CUST_YN", "NO", "YES"])

    predict_siu = predict.to_json(orient='records')
    return predict_siu






