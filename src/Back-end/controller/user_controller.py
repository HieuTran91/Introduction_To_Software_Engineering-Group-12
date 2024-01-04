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

app.secret_key = secrets.token_urlsafe(32)
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

# session['car'] = '00015'
# session['user'] = '00002'
obj = user_model()

@app.route('/')
def welcome():
    return 'WELCOME TO VIVU APP'

@app.route('/homepage')
def homepage():
    result = obj.get_car_model()
    return result.get_data()

@app.route("/signup", methods = ["POST", "GET"])
def signup():
    result = obj.signup_model(request.form)
    if result.status_code == 201:
        session['user'] = result.data['accountID']
        session['type'] = result.get_data('isCarOwner')
    return result.get_data()

@app.route("/login", methods = ["POST","GET"])
def login():
    result = obj.login_model(request.form)
    # print()
    print(result)
    json_re = json.loads(result)
    print(json_re['data'][0]['accountID'])
    print(type(json_re['data']))
    # re = json_re['data'][0]
    # if result.status_code == 200:
        # payload_dict = json.loads(result.get_data('payload'))
        # accountID = result.get_data('payload')['accountID']
        # session['user'] = accountID
        # print(payload_dict[0])
        # print(result.get_data())
        # session['type'] = result.get_data('isCarOwner')
    # return result.get_data()
    return result
 
@app.route("/logout")
def logout():
    session["user"] = None
    session["type"] = None
    return redirect("/")

@app.route("/car", methods = ["POST", "GET"])
def getCar():
    result = obj.get_detail_car_model(request.form)
    if result.status_code == 200:
        session['car'] = result.get_data('carID')
    return result.get_data()

@app.route("/editcar", methods = ["POST", "GET"])
def editCar():
    result = obj.edit_car_model(request.form, session['car'])
    return result.get_data()

@app.route("/rentalcar", methods = ["POST", "GET"])
def rentalCar():
    result = obj.add_rental_model(request.form, session["user"], session['car'])
    return result.get_data()

# @app.route("/payment", methods = ["POST", "GET"])
# def payment(car_id):
#     return 'edit car information'

@app.route("/currentTrip", methods = ["POST", "GET"])
def currentTrip():
    result = obj.current_trip_model(session["user"])
    return result.get_data()

@app.route("/currentRentalTripList", methods = ["POST", "GET"])
def currentRentalTripList():
    result = obj.current_rental_trip_list_model(session["user"])
    return result.get_data()

@app.route("/rentalHistory", methods = ["POST", "GET"])
def rentalHistory():
    result = obj.rental_history_model(session["user"])
    return result.get_data()

@app.route("/tripHistory", methods = ["POST", "GET"])
def tripHistory():
    user = session["user"]
    print(user)
    result = obj.trip_history_model(user)
    return result.get_data()