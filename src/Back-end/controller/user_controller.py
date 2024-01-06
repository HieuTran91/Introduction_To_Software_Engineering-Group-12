from lib import app
from model.user_model import user_model
from flask import request, render_template, session, redirect, jsonify
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
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

obj = user_model()

@app.route('/')
def welcome():
    return 'WELCOME TO VIVU APP'

@app.route('/listcar', methods = ['GET'])
def listcar():
    return obj.get_car_model()

@app.route("/signup", methods = ["POST", "GET"])
def signup():
    result = obj.signup_model(request.json)
    if len(result) > 0:
        session['user'] = result[0]['accountID']
        session['type'] = result[0]['isCarOwner']
    return jsonify(result)

@app.route("/login", methods = ["POST", "GET"])
def login():
    result = obj.login_model(request.json)
    print(result)
    if len(result) > 0:
        # if session['user']
        session['user'] = result[0]['accountID']
        session['type'] = result[0]['isCarOwner']
    return jsonify(result)
 
@app.route("/logout")
def logout():
    session["user"] = None
    session["type"] = None
    session['car'] = None
    return redirect("/login")

@app.route("/car", methods = ["POST", "GET"])
def getCar():
    result = obj.get_detail_car_model(request.json)
    if len(result) > 0:
        session['car'] = result[0]['carID']
    return result
 
@app.route("/editcar", methods = ["POST", "GET"])
def editCar():
    result = obj.edit_car_model(request.json, session['car'])
    return jsonify(result)
 
 
@app.route("/rentalcar", methods = ["POST", "GET"])
def rentalCar():
    result = obj.add_rental_model(request.json, session["user"], session['car'])
    return jsonify(result)

@app.route("/currentTrip", methods = ["POST", "GET"])
def currentTrip():
    result = obj.current_trip_model(session["user"])
    return jsonify(result)

@app.route("/currentRentalTripList", methods = ["POST", "GET"])
def currentRentalTripList():
    result = obj.current_rental_trip_list_model(session["user"])
    return jsonify(result)

@app.route("/rentalHistory", methods = ["POST", "GET"])
def rentalHistory():
    result = obj.rental_history_model(session["user"])
    return jsonify(result)
  
@app.route("/tripHistory", methods = ["POST", "GET"])
def tripHistory():
    result = obj.trip_history_model(session['user'])
    return jsonify(result)