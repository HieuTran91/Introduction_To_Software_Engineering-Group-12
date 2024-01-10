import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/models/car_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CarService {
  Future<Car> getCarById(String carID) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.155:5000/car'), // Replace with your API endpoint for fetching a car by ID
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'carID': carID,
        }),
      );

      if (response.statusCode == 200) {
        return Car.fromMap(jsonDecode(response.body));
      } else {
        throw Exception('Failed to get car by ID');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to get car by ID');
    }
  }
  Future<bool> editCar(String carID, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.155:5000/editcar'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'carID': carID,
          'carCompany': data['carCompany'],
          'model': data['model'],
          'seats': data['seats'],
          'transmission': data['transmission'],
          'fuelType': data['fuelType'],
          'yearRelease': data['yearRelease'],
          'price': data['price'],
        }),
      );

      if (response.statusCode == 200) {
        // Assuming your API returns a success status or updated car details
        // You can handle the response accordingly
        return true;
      } else {
        throw Exception('Failed to edit car');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to edit car');
    }
  }
  Future<List<Car>> getListCar() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.155:5000/listcar'));
      if (response.statusCode == 200) {
        List<dynamic> decodedData = jsonDecode(response.body) as List<dynamic>;
        return decodedData.map((carMap) {
          return Car.fromMap(carMap);
        }).toList();
      } else {
        throw Exception('Invalid credentials');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to get cars');
    }
  }

  Future<List<Car>> getListCarByOwner(String carOwnerID) async {
    try {
      final response = await http.post(Uri.parse('http://192.168.1.155:5000/mycar'),
        headers: {"Content-Type": "application/json"}, 
        body: jsonEncode({
        'carOwnerID': carOwnerID
        })
      );
      if (response.statusCode == 200) {
        List<dynamic> decodedData = jsonDecode(response.body) as List<dynamic>;
        return decodedData.map((carMap) {
          return Car.fromMap(carMap); 
        }).toList();
      } else {
        throw Exception('Invalid credentials');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to get cars');
    }
  }
}

class CarController {
  final CarService carService = CarService();
  List<Car> cars = [];
  Car currentCar = Car();
  Future<bool> fetchCarById(String carID) async {
    try {
      Car car = await carService.getCarById(carID);
      currentCar = car;
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
  Future<bool> fetchListCar() async {
    try {
      List<Car> fetchedCars = await carService.getListCar();
      cars = fetchedCars;
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<bool> fetchListCarByOwner(String carOwnerID) async {
    try {
      List<Car> ownerCars = await carService.getListCarByOwner(carOwnerID);
      cars = ownerCars;
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}