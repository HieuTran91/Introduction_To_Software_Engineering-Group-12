from lib import app
from model.user_model import user_model
from flask import request, render_template, session, redirect, jsonify, g
import hashlib
import secrets
from flask_session import Session
import json
import numpy as np

def hash_password(password):
    hash_object = hashlib.sha256()
    hash_object.update(password.encode("utf-8"))
    return hash_object.hexdigest()

app.secret_key = secrets.token_urlsafe(32)
app.config["SESSION_PERMANENT"] = True
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

def get_user_model():
    if 'user_model' not in g:
        g.user_model = user_model()
    return g.user_model

@app.before_request
def before_request():
    g.user_model = get_user_model()

@app.route('/')
def welcome():
    return 'WELCOME TO VIVU APP'

@app.route('/listcar', methods = ["GET"])
def listcar():
    result = g.user_model.get_car_model()
    return jsonify(result)

@app.route('/mycar', methods = ["POST"])
def mycar():
    result = g.user_model.my_car_model(request.json) 
    print(result)
    return jsonify(result)

@app.route("/signup", methods = ["POST", "GET"])
def signup():
    result = g.user_model.signup_model(request.json)
    # if len(result) > 0:
    #     session['user'] = result[0]['accountID']
    #     session['type'] = result[0]['isCarOwner']
    return jsonify(result)

@app.route("/login", methods = ["POST", "GET"])
def login():
    result = g.user_model.login_model(request.json)
    # if len(result) > 0:
        # if session['user']
        # if(session is None):
        #     session["user"] = result[0]['accountID']
        #     session['type'] = result[0]['isCarOwner']
    return jsonify(result)
 
@app.route("/logout")
def logout():
    # session["user"] = None
    # session["type"] = None
    # session['car'] = None
    return redirect("/login")

@app.route("/car", methods = ["GET","POST"])
def getCar():
    result = g.user_model.get_detail_car_model(request.json)
    # if len(result) > 0:
    #     session['car'] = result[0]['carID']
    return result
 
@app.route("/editcar", methods = ["POST", "GET"])
def editCar():
    result = g.user_model.edit_car_model(request.json)
    return jsonify(result)
 
 
@app.route("/rentalcar", methods = ["POST", "GET"])
def rentalCar():
    result = g.user_model.add_rental_model(request.json)
    return jsonify(result)

@app.route("/currentTrip", methods = ["POST", "GET"])
def currentTrip():
    result = g.user_model.current_trip_model(request.json)
    return jsonify(result)

@app.route("/currentRentalTripList", methods = ["POST", "GET"])
def currentRentalTripList():
    result = g.user_model.current_rental_trip_list_model(request.json)
    return jsonify(result)

@app.route("/rentalHistory", methods = ["POST", "GET"])
def rentalHistory():
    result = g.user_model.rental_history_model(request.json)
    return jsonify(result)
  
@app.route("/tripHistory", methods = ["POST", "GET"])
def tripHistory():
    result = g.user_model.trip_history_model(request.json)
    return jsonify(result)