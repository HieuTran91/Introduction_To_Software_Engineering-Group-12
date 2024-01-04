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
    re_py = json.loads(result)
    if re_py['status_code'] == 201:
        session['user'] = re_py['data'][0]['accountID']
        session['type'] = re_py['data'][0]['isCarOwner']
    return json.dumps(re_py['data'])

@app.route("/login", methods = ["POST","GET"])
def login():
    result = obj.login_model(request.form)
    re_py = json.loads(result)
    if re_py['status_code'] == 200:
        session['user'] = re_py['data'][0]['accountID']
        session['type'] = re_py['data'][0]['isCarOwner']
    return json.dumps(re_py['data'])
 
@app.route("/logout")
def logout():
    session["user"] = None
    session["type"] = None
    return redirect("/")

@app.route("/car", methods = ["POST", "GET"])
def getCar():
    result = obj.get_detail_car_model(request.form)
    re_py = json.loads(result)
    if re_py['status_code'] == 200:
        session['car'] = result.get_data('carID')
    return json.dumps(re_py['data'])

@app.route("/editcar", methods = ["POST", "GET"])
def editCar():
    result = obj.edit_car_model(request.form, session['car'])
    re_py = json.loads(result)
    return json.dumps(re_py['data'])

@app.route("/rentalcar", methods = ["POST", "GET"])
def rentalCar():
    result = obj.add_rental_model(request.form, session["user"], session['car'])
    re_py = json.loads(result)
    return json.dumps(re_py['data'])

# @app.route("/payment", methods = ["POST", "GET"])
# def payment(car_id):
#     return 'edit car information'

@app.route("/currentTrip", methods = ["POST", "GET"])
def currentTrip():
    result = obj.current_trip_model(session["user"])
    re_py = json.loads(result)
    return json.dumps(re_py['data'])

@app.route("/currentRentalTripList", methods = ["POST", "GET"])
def currentRentalTripList():
    result = obj.current_rental_trip_list_model(session["user"])
    re_py = json.loads(result)
    return json.dumps(re_py['data'])

@app.route("/rentalHistory", methods = ["POST", "GET"])
def rentalHistory():
    result = obj.rental_history_model(session["user"])
    re_py = json.loads(result)
    return json.dumps(re_py['data'])

@app.route("/tripHistory", methods = ["POST", "GET"])
def tripHistory():
    result = obj.trip_history_model(session["user"])
    re_py = json.loads(result)
    return json.dumps(re_py['data'])