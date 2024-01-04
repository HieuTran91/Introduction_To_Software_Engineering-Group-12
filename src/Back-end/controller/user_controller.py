from lib import app
from model.user_model import user_model
from flask import request, render_template, session, redirect
import hashlib
import secrets
from flask_session import Session
id_user = '00001'

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
    return 'HOME PAGE'

@app.route("/signup", methods = ["POST"])
def signup():
    result = obj.signup_model(request.form)
    if result.status_code == 201:
        session['user'] = result.get_data('accountID')
        session['type'] = result.get_data('isCarOwner')
    return result.get_data()

@app.route("/login", methods = ["POST","GET"])
def login():
    # response_dict = obj.login_model(request.form)
    # result = response_dict.json()
    # print(result)
    
    # print(response_dict)
    # if response_dict.get_data() == 200:

        # session["accountID"] = obj['accountID']
        # The line `session["type"] = obj['isCarOwner']` is assigning the value of the `isCarOwner`
        # attribute from the `obj` object to the `type` key in the `session` dictionary. This allows
        # the application to store and access the user's type (whether they are a car owner or not)
        # throughout their session.
        # session["type"] = obj['isCarOwner']
        # return "Hehe"
    return obj.login_model(request.form)
    # if obj.login_model(request.form) == 401:
        # redirect("/login")
    # else:
        # session["user"] = obj['accountID']
        # session["type"] = obj['isCarOwner']
        # redirect("/homepage")
    # return obj.login_model(request.form)

@app.route("/logout")
def logout():
    session["user"] = None
    session["type"] = None
    return redirect("/")

@app.route("/user_id/<user_id>/car/<id>", methods = ["POST", "GET"])
def getCar(id):
    return obj.get_car_model(id)

@app.route("/user/<user_id>/editcar/<id>", methods = ["POST", "GET"])
def editCar(car_id):
    return 'edit car information'

@app.route("/user/<user_id>/car/<id>/rentalcar", methods = ["POST", "GET"])
def rentalCar(car_id):
    return 'edit car information'

@app.route("/user/<user_id>/car/<id>/payment", methods = ["POST", "GET"])
def payment(car_id):
    return 'edit car information'

@app.route("/user/<id>/currentTrip", methods = ["POST", "GET"])
def currentTrip():
    return 'current trip'

@app.route("/user/<id>/currentRentalTripList", methods = ["POST", "GET"])
def currentRentalTripList():
    return 'current trip'

@app.route("/user/<id>/rentalHistory", methods = ["POST", "GET"])
def rentalHistory():
    return 'Rent car'

@app.route("/user/<id>/tripHistory", methods = ["POST", "GET"])
def tripHistory():
    return 'Rent car'