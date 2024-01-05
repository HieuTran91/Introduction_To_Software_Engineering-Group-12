from lib import app
from model.user_model import user_model
from flask import request, render_template, session, redirect
import hashlib
import secrets
from flask_session import Session
import json

def hash_password(password):
    hash_object = hashlib.sha256()
    hash_object.update(password.encode("utf-8"))
    return hash_object.hexdigest()

obj = user_model()

@app.route('/')
def welcome():
    return 'WELCOME TO VIVU APP'

@app.route('/homepage')
def homepage():
    return obj.get_car_model()
    # result = obj.get_car_model()
    # if result == None:
    #     return json.dumps({"msg": "Not found data"})
    # re_py = json.loads(result)
    # return json.dumps(re_py['data'])

@app.route("/signup", methods = ["POST", "GET"])
def signup():
    result = obj.signup_model(request.json)
    if result == None:
        return json.dumps({"msg": "Not found data", "status_code": 400})
    re_py = json.loads(result)
    if re_py['status_code'] == 201:
        session['user'] = re_py['data'][0]['accountID']
        session['type'] = re_py['data'][0]['isCarOwner']
    return result

@app.route("/login", methods = ["POST"])
def login():
    result = obj.login_model(request.json)
    if result == None:
        return json.dumps({"msg": "Not found data", "status_code": 400})
    re_py = json.loads(result)
    if re_py['status_code'] == 200:
        session['user'] = re_py['data'][0]['accountID']
        session['type'] = re_py['data'][0]['isCarOwner']
    return result
 
@app.route("/logout")
def logout():
    session["user"] = None
    session["type"] = None
    session['car'] = None
    return redirect("/")

@app.route("/car", methods = ["POST", "GET"])
def getCar():
    result = obj.get_detail_car_model(request.json)
    if result == None:
        return json.dumps({"msg": "Not found data", "status_code": 400})
    re_py = json.loads(result)
    if re_py['status_code'] == 200:
        session['car'] = re_py['data'][0]['carID']
    return result
 
@app.route("/editcar", methods = ["POST", "GET"])
def editCar():
    result = obj.edit_car_model(request.json, session['car'])
    if result == None:
        return json.dumps({"msg": "Not found data"})
    re_py = json.loads(result)
    # if re_py['status_code'] == 201:
    #     return json.dumps(re_py['data'])
    return result
 
 
@app.route("/rentalcar", methods = ["POST", "GET"])
def rentalCar():
    result = obj.add_rental_model(request.json, session["user"], session['car'])
    if result == None:
        return json.dumps({"msg": "Not found data", "status_code": 400})
    re_py = json.loads(result)
    # if re_py['status_code'] == 200:
    #     return json.dumps(re_py['data'])
    return result

# @app.route("/payment", methods = ["POST", "GET"])
# def payment(car_id):
#     return 'edit car information'

@app.route("/currentTrip", methods = ["POST", "GET"])
def currentTrip():
    result = obj.current_trip_model(session["user"])
    if result == None:
        return json.dumps({"msg": "Not found data", "status_code": 400})
    re_py = json.loads(result)
    # if re_py['status_code'] == 200:
    #     return json.dumps(re_py['data'])
    return result

@app.route("/currentRentalTripList", methods = ["POST", "GET"])
def currentRentalTripList():
    result = obj.current_rental_trip_list_model(session["user"])
    if result == None:
        return json.dumps({"msg": "Not found data", "status_code": 400})
    re_py = json.loads(result)
    # if re_py['status_code'] == 200:
    #     return json.dumps(re_py['data'])
    return result

@app.route("/rentalHistory", methods = ["POST", "GET"])
def rentalHistory():
    result = obj.rental_history_model(session["user"])
    if result == None:
        return json.dumps({"msg": "Not found data", "status_code": 400})
    re_py = json.loads(result)
    # if re_py['status_code'] == 200:
    #     return json.dumps(re_py['data'])
    return result
  
@app.route("/tripHistory", methods = ["POST", "GET"])
def tripHistory():
    result = obj.trip_history_model(session['user'])
    if result == None:
        return json.dumps({"msg": "Not found data", "status_code": 400})
    re_py = json.loads(result)
    # if re_py['status_code'] == 200:
    #     return json.dumps(re_py['data'])
    return result
    # print(result)
    # if result is not None:
    #     re_py = json.loads(result)
    #     if re_py['status_code'] == 200:
    #         return json.dumps(re_py['data'])
    #     return json.dumps(re_py['data']) 
    # return json.dumps({"msg": "Not found data"}) 