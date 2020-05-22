from django.http import HttpResponse
from . import data_processing, cust_prediction
import pandas as pd
import pymysql.cursors
import time, json, joblib

def ins(request, cust_id):
    start = time.time()

    connection = pymysql.connect(host='localhost', port=3306, user='root',
                                 password='1234', db='insurance_data',
                                 charset='utf8', autocommit=True,
                                 cursorclass=pymysql.cursors.DictCursor)

    cursor = connection.cursor()
    sql = "select * from cust_data"
    cursor.execute(sql)
    result = cursor.fetchall()
    cust = pd.DataFrame(result)

    # cust 아이디만 등록을 했을 떄 사용 하기 위함
    first_claim_sql = "select * from claim_data where cust_id ={}".format(cust_id)
    cursor.execute(first_claim_sql)
    first_claim_sql_result = cursor.fetchall()
    if(first_claim_sql_result == ()):
        sql = "select * from claim_data"
        cursor.execute(sql)
        result = cursor.fetchall()
        claim = pd.DataFrame(result)
        append_claim = pd.DataFrame([[cust_id, 112790, 3, 3, 1, 1, 1, "N", 119024]],
                             columns=["CUST_ID", "POLY_NO", "ACCI_DVSN", "DMND_RESN_CODE", "VLID_HOSP_OTDA", "HOSP_CODE", "CHME_LICE_NO", "HEED_HOSP_YN","id"])
        claim = pd.concat([claim, append_claim]).reset_index(drop=True)
    else:
        sql = "select * from claim_data"
        cursor.execute(sql)
        result = cursor.fetchall()
        claim = pd.DataFrame(result)

    # 데이터 정규화
    cust = data_processing.standardization(cust, claim)
    # test = cust[cust['DIVIDED_SET']==2].reset_index(drop=True)#.sample(n=10)
    # test.drop('DIVIDED_SET', axis=1, inplace=True)
    # test_X =test.drop(['CUST_ID', 'SIU_CUST_YN'], axis=1)
    # testtest = test_X.iloc[-1:,:]
    # print(test.tail())
    # print(testtest)
    
    # 모델별 피클 파일 저장
    voting_model = cust_prediction.pickle_load_voting()
    svm_model = cust_prediction.pickle_load_svm()
    rf_model = cust_prediction.pickle_load_rf()
    xgb_model = cust_prediction.pickle_load_xgb()

    # # 변수 중요도 확인
    # data_processing.importance(testtest, rf_model)
    
    # 모델 결과 예측
    voting_result = cust_prediction.cust_predict(cust, cust_id, voting_model)
    svm_result = cust_prediction.cust_predict(cust, cust_id, svm_model)
    xgb_result = cust_prediction.cust_predict(cust, cust_id, xgb_model)
    rf_result = cust_prediction.cust_predict(cust, cust_id, rf_model)

    # Restful 넘기는 모델 값 저장
    resultList = []
    resultList.append(voting_result)
    resultList.append(svm_result)
    resultList.append(xgb_result)
    resultList.append(rf_result)
    resultList = json.dumps(resultList)
    # result = result.to_json(orient='records')
    return HttpResponse(resultList)


