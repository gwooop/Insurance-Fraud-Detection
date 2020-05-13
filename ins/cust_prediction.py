from . import data_processing
import joblib


# 머신러닝 피클 모델 불러오기
def pickle_load_voting():

    file_name = 'voting_model.pkl'
    voting_model = joblib.load(file_name)
    return voting_model
#
def pickle_load_mlp():

    file_name = 'mlp_model.pkl'
    voting_model = joblib.load(file_name)
    return voting_model

def pickle_load_rf():

    file_name = 'rf_model.pkl'
    voting_model = joblib.load(file_name)
    return voting_model

def pickle_load_xgb():

    file_name = 'xgb_model.pkl'
    voting_model = joblib.load(file_name)
    return voting_model

# 고객 입력 데이터 예측하기
def cust_predict(cust, cust_id, voting_model):
    test = cust[cust['CUST_ID'] == cust_id]
    test.drop('DIVIDED_SET', axis=1, inplace=True)
    result = data_processing.prediction(test, voting_model, cust_id)
    return result
