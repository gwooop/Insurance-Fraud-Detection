from django.http import HttpResponse
from . import data_processing, cust_prediction
import pandas as pd
import pymysql.cursors
import time, random, json, joblib

def ins(request, cust_id):
    start = time.time()

    connection = pymysql.connect(host='localhost', port=3306, user='root',
                                 password='1234', db='ins',
                                 charset='utf8', autocommit=True,
                                 cursorclass=pymysql.cursors.DictCursor)

    cursor = connection.cursor()
    sql = "select * from ins.cust_data"
    cursor.execute(sql)
    result = cursor.fetchall()
    cust = pd.DataFrame(result)

    # cust 아이디만 등록을 했을 떄 사용 하기 위함
    first_claim_sql = "select * from claim_data where cust_id ={}".format(cust_id)
    cursor.execute(first_claim_sql)
    first_claim_sql_result = cursor.fetchall()
    print("커스터 데이터 값만 넣었을 떄 오는 값:", first_claim_sql_result)
    print(type(first_claim_sql_result))
    if(first_claim_sql_result == ()):


        sql = "select * from claim_data"
        cursor.execute(sql)
        result = cursor.fetchall()
        claim = pd.DataFrame(result)
        append_claim = pd.DataFrame([[cust_id, 112790, 3, 3, 1, 1, 1, "N", 119024]],
                             columns=["CUST_ID", "POLY_NO", "ACCI_DVSN", "DMND_RESN_CODE", "VLID_HOSP_OTDA",
                                      "HOSP_CODE", "CHME_LICE_NO", "HEED_HOSP_YN","id"])
        claim = pd.concat([claim, append_claim]).reset_index(drop=True)
        print("잘 들어 간지 확인하기:", claim[claim["CUST_ID"] == cust_id])
    else:
        sql = "select * from claim_data"
        cursor.execute(sql)
        result = cursor.fetchall()
        claim = pd.DataFrame(result)

    print(len(claim))

    cust = data_processing.standardization(cust, claim)
    voting_model = cust_prediction.pickle_load_voting()
    mlp_model = cust_prediction.pickle_load_mlp()
    rf_model = cust_prediction.pickle_load_rf()
    xgb_model = cust_prediction.pickle_load_xgb()
    voting_result = cust_prediction.cust_predict(cust, cust_id, voting_model)
    print("voting_model :", voting_result)
    mlp_result = cust_prediction.cust_predict(cust, cust_id, mlp_model)
    print("mlp_result :", mlp_result)
    xgb_result = cust_prediction.cust_predict(cust, cust_id, xgb_model)
    print("xgb_result3 :", xgb_result)
    rf_result = cust_prediction.cust_predict(cust, cust_id, rf_model)
    print("rf_result3 :", rf_result)


    resultList = []
    resultList.append(voting_result)
    resultList.append(mlp_result)
    resultList.append(xgb_result)
    resultList.append(rf_result)
    resultList = json.dumps(resultList)

    print(resultList)
    # result = result.to_json(orient='records')
    return HttpResponse(resultList)


