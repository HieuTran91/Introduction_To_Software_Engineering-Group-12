from flask import make_response
from lib import app
import mysql.connector
import jsonify
import hashlib
import json
import pandas as pd
# from flask import jsonify

def hash_password(password):
    hash_object = hashlib.sha256()
    hash_object.update(password.encode("utf-8"))
    return hash_object.hexdigest()

class user_model():
    def __init__(self):
        try:
            self.mydb = mysql.connector.connect(
	        host="localhost",
	        user = "root",
        	password="Hieu0504@",
	        database="VIVUAPP")
            self.mydb.autocommit = True
            self.cur = self.mydb.cursor(dictionary=True)
            print("Connect successful")
        except:
            print("ERROR!!!")
    
    # đăng ký
    def signup_model(self, data):
        try:
            password = hash_password(data['passwordAccount'])
            self.cur.execute(f"CALL CreateAccount('{data['phoneNumber']}', '{password}', '{data['fullName']}', '{data['address']}', '{data['email']}', '{data['birthday']}', '{data['isCarOwner']}')")
            result = self.cur.fetchall()
            if len(result)>0:
                #return make_response({"payload": result}, 201)
                result = {"data":result, "status_code": 201}
                return json.dumps(result)
        except Exception as e:
            result = {"data":str(e), "status_code": 400}
            return json.dumps(result)
  

    #đăng nhập 
    def login_model(self, data):
        try:
            password = hash_password(data['passwordAccount'])
            self.cur.execute(f"CALL Login('{data['phoneNumber']}','{password}');")
            result = self.cur.fetchall()
            if len(result) > 0:
                # return make_response({"payload": result}, 200)
                result = {"data":result, "status_code": 200}
                return json.dumps(result)
                # return result
        except Exception as e:
            result = {"data":str(e), "status_code": 400}
            return json.dumps(result)
            # return make_response({"message": "Failed: " + str(e)}, 401)
 
# command = '''
#   insert into Movie (title,release_date,rating ,overview ,length ,country ,backdrop_path ,poster_path ,isSeries ,video_link)
#   values {0}
#   '''
# temp = shit.format(title,movie_data['first_air_date'],int(movie_data['vote_average']),overview,runtime, country, backdrop, poster)
    # sửa thông tin xe
    def edit_car_model(self, data, carID):
        try:
            # query = f"CALL editCar('{carID}', '{data['carCompany']}', '{data['model']}', {int(data['seats'])}, '{data['transmission']}', '{data['fuelType']}', {int(data['yearRelease'])}, {float(data['price'])});"
            # print(query)
            self.cur.execute(f"CALL editCar('{carID}', '{data['carCompany']}', '{data['model']}', {int(data['seats'])}, '{data['transmission']}', '{data['fuelType']}', {int(data['yearRelease'])}, {float(data['price'])});")
            result = self.cur.fetchall()
            if len(result)>0:
                result = {"data":result, "status_code": 201}
                return json.dumps(result)
        except Exception as e: 
            result = {"data":str(e), "status_code": 202}
            return json.dumps(result)
 
    # def add_new_car_model(self, data, cusID):
    #     try:
    #         self.cur.execute(f"CALL addNewCar('{data['carCompany']}', '{data['model']}', '{data['seats']}', '{data['transmission']}', '{data['fuelType']}', '{data['yearRelease']}', '{data['price']}', '{cusID}')")
    #         result = self.cur.fetchall()
    #         if len(result)>0:
    #             #return make_response({"payload": result}, 201)
    #             result = {"data":result, "status_code": 201}
    #             return json.dumps(result)
    #     except Exception as e:
    #         # return make_response({"message": "Failed: " + str(e)}, 400)
    #         result = {"data":str(e), "status_code": 400}
    #         return json.dumps(result)

    # xem thông tin xe 'oki'
    def get_car_model(self):
        try:
            self.cur.execute(f"Select * from Car")
            result = self.cur.fetchall()
            if len(result)>0:
                #return make_response({"payload": result}, 200)
                result = {"data":result, "status_code": 200}
                return json.dumps(result)
        except Exception as e:
            #return make_response({"message": "Failed: " + str(e)}, 204)
            result = {"data":str(e), "status_code": 204}
            return json.dumps(result)
        
    # xem thông tin chi tiết của xe
    def get_detail_car_model(self, data):
        try:
            self.cur.execute(f"CALL GetCarInfo('{data['carID']}')")
            result = self.cur.fetchall()
            if len(result)>0:
                #return make_response({"payload": result}, 200)
                result = {"data":result, "status_code": 200}
                return json.dumps(result)
        except Exception as e:
            #return make_response({"message": "Failed: " + str(e)}, 204)
            result = {"data":str(e), "status_code": 204}
            return json.dumps(result)
 
    #thêm thuê xe 
    def add_rental_model(self, data, cusID, carID):
        try:
            self.cur.execute(f"CALL InsertRental('{cusID}', '{carID}', '{pd.to_datetime(data['pickupTime'])}', '{pd.to_datetime(data['returnTime'])}')")
            result = self.cur.fetchall()
            if len(result)>0:
                #return make_response({"payload": result}, 201)
                result = {"data":result, "status_code": 201}
                return json.dumps(result)
        except Exception as e:
            #return make_response({"message": "Failed: " + str(e)}, 400)
            result = {"data":str(e), "status_code": 400}
            return json.dumps(result)

    #thêm thanh toán
    def add_payment_model(self, data):
        try:
            # print(data)
            self.cur.execute(f"CALL AddPayment('{data['carID']}', '{data['paymentMethod']}', '{data['paymentDate']}', '{data['discountCode']}')")
            result = self.cur.fetchall()
            if len(result)>0:
                #return make_response({"payload": result}, 201)
                result = {"data":result, "status_code": 201}
                return json.dumps(result)
        except Exception as e:
            #return make_response({"message": "Failed: " + str(e)}, 400)
            result = {"data":str(e), "status_code": 400}
            return json.dumps(result)
    
    # xem thông tin chuyến đi hiện tại
    def current_trip_model(self, cusID):
        try:
            self.cur.execute(f"CALL GetCurrentTrip('{cusID}')")
            result = self.cur.fetchall()
            if len(result)>0:
                for i in range(len(result)):
                    print(result[i]['pickupTime']) 
                    result[i]['pickupTime'] = str(result[0]['pickupTime'])
                    result[i]['returnTime'] = str(result[0]['returnTime'])
                #return make_response({"payload": result}, 200)
                result = {"data":result, "status_code": 200}
                return json.dumps(result)
        except Exception as e:
            # return make_response({"message": "Failed: " + str(e)}, 204)
            result = {"data":str(e), "status_code": 204}
            return json.dumps(result)

    def current_rental_trip_list_model(self, cusID):
        try:    
            self.cur.execute(f"CALL GetCurrentRentalCarList('{cusID}')")
            result = self.cur.fetchall()
            if len(result)>0:
                for i in range(len(result)):
                    print(result[i]['pickupTime']) 
                    result[i]['pickupTime'] = str(result[0]['pickupTime'])
                    result[i]['returnTime'] = str(result[0]['returnTime'])
                #return make_response({"payload": result}, 200)
                result = {"data":result, "status_code": 200}
                return json.dumps(result)
        except Exception as e:
            # return make_response({"message": "Failed: " + str(e)}, 204)
            result = {"data":str(e), "status_code": 204}
            return json.dumps(result)
        
    # xem lịch sử thuê xe
    def rental_history_model(self, cusID):
        try:
            self.cur.execute(f"CALL GetRentalHistory('{cusID}')")
            result = self.cur.fetchall()
            if len(result)>0:
                #return make_response({"payload": result}, 200)
                for i in range(len(result)):
                    print(result[i]['pickupTime']) 
                    result[i]['pickupTime'] = str(result[0]['pickupTime'])
                    result[i]['returnTime'] = str(result[0]['returnTime'])
                result = {"data":result, "status_code": 200}
                return json.dumps(result)
        except Exception as e:
            #return make_response({"message": "Failed: " + str(e)}, 204)
            result = {"data":str(e), "status_code": 204}
            return json.dumps(result)

    def trip_history_model(self, cusID):
        try:
            self.cur.execute(f"CALL GetTripHistory('{cusID}')")
            result = self.cur.fetchall()
            if len(result)>0:
                #return make_response({"payload": result}, 200)
                # print(len(result))
                for i in range(len(result)):
                    print(result[i]['pickupTime']) 
                    result[i]['pickupTime'] = str(result[0]['pickupTime'])
                    result[i]['returnTime'] = str(result[0]['returnTime'])
                result = {"data":result, "status_code": 200}
                return json.dumps(result)
        except Exception as e:
            # return make_response({"message": "Failed: " + str(e)}, 204)
            result = {"data":str(e), "status_code": 204}
            return json.dumps(result)


    # def delete_car_model(self, id):
    #     self.cur.execute(f"CALL deleteCar('{id}')")
    #     result = self.cur.fetchall()
    #     if len(result)>0:    
    #         return make_response({"message":"Delete successfully"}, 201)
    #     else:
    #         return make_response({"message":"Delete unsuccessfully"}, 202)

    # def check_account_model(self, data):
    #     phone = data['phoneNumber']
    #     self.cur.execute("Select * from AccountCar where phoneNumber=?",phone)
    #     result = self.cur.fetchone()
    #     print('\n\n\n\n\n\n')
    #     print(result)
    #     return (result == None)

    # def get_account_model(self, data):
    #     self.cur.execute(f"CALL GetAccount ('{data['phoneNumber']}') ")
    #     result = self.cur.fetchall()
    #     if len(result) > 0:
    #         return make_response({"payload":result}, 200)
    #     else:
    #         return make_response({"message":"Data not found"}, 204)


    # def edit_account_model(self, data):
    #     self.cur.execute(f"CALL EditAccount ('{data['phoneNumber']}', '{data['fullName']}', '{data['gender']}', '{data['address']}', '{data['email']}', '{data['birthday']}', '{data['citizenIdentityCard']}'))")
    #     result = self.cur.fetchall()
    #     if result == "Successful":    
    #         return make_response({"message":"Update successfully"}, 201)
    #     else:
    #         return make_response({"message":"Update failed"}, 202)

    # def statistics_model(self, id):
    #     self.cur.execute(f"CALL GetRentalByOwner('{id}')")
    #     result = self.cur.fetchall()
    #     if len(result)>0:
    #         return make_response({"payload": result}, 200)
    #     else: 
    #         return make_response({"message":"No data found"}, 204)
        
    # def get_car_owner_model(self, id):
    #     self.cur.execute(f"CALL SearchCarByOwner('{id}')")
    #     result = self.cur.fetchall()
    #     if len(result)>0:
    #         return make_response({"payload": result}, 200)
    #     else: 
    #         return make_response({"message":"No data found"}, 204)
        
    # def delete_car_model(self, id):
    #     self.cur.execute(f"call deleteCar('{id}')")
    #     if self.cur.rowcount > 0:
    #         return make_response({"message":"Delete successfully"}, 200)
    #     else:
    #         return make_response({"message":"Nothing to delete"}, 202)
        
    # def forget_password_model(self, data):
    #     password = hash_password(data['passwordAccount'])
    #     self.cur.execute(f"Call EditPasswordAccount ('{data['phoneNumber']}', '{password}')")
    #     result = self.cur.fetchall()
    #     if result == "Successful":    
    #         return make_response({"message":"Update successfully"}, 201)
    #     else:
    #         return make_response({"message":"Update failed"}, 202)
