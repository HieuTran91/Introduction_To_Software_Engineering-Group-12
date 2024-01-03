from lib import app
from model.user_model import user_model
from flask import request, render_template, session, redirect
import hashlib

id_user = '00001'

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
    return 'HOME PAGE'

@app.route("/signup", methods = ["POST"])
def signup():
    hash_passwordAccount = hash_password(request.form.get("passwordAccount"))
    data = request.form.to_dict()
    data['password'] = hash_passwordAccount
    return obj.signup_model(request.form)
    
@app.route("/login", methods = ["POST","GET"])
def login():
    if obj.login_model(request.form) == 401:
        redirect("/login")
    else:
        redirect("/homepage")
    # return obj.login_model(request.form)

@app.route("/logout")
def logout():
    session["name"] = None
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