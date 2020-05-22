from . import data_processing
import joblib


# 머신러닝 피클 모델 불러오기
def pickle_load_voting():

    file_name = 'voting_model.pkl'
    model = joblib.load(file_name)
    return model
#
def pickle_load_svm():

    file_name = 'svm_model.pkl'
    model = joblib.load(file_name)
    return model

def pickle_load_rf():

    file_name = 'rf_model.pkl'
    model = joblib.load(file_name)
    return model

def pickle_load_xgb():

    file_name = 'xgb_model.pkl'
    model = joblib.load(file_name)
    return model

# 고객 입력 데이터 예측하기
def cust_predict(cust, cust_id, model):
    test = cust[cust['CUST_ID'] == cust_id]
    test.drop('DIVIDED_SET', axis=1, inplace=True)
    result = data_processing.prediction(test, model, cust_id)
    return result
