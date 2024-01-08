import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/models/car_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CarService {
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

  Future<List<Car>> getListCarByOwner() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.155:5000/mycar'));
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
  List<Car> carsByOwner = [];
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

  Future<bool> fetchListCarByOwner() async {
    try {
      List<Car> ownerCars = await carService.getListCarByOwner();
      carsByOwner = ownerCars;
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}