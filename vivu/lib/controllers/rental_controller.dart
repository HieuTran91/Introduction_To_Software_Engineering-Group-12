import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/models/rental_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RentalController {
  List<Rental> currentTrip = [];
  List<Rental> tripHistory = [];
  List<Rental> currentRental = [];
  List<Rental> rentalHistory = [];
  Future<bool> addRental(String carID, String pickupTime, String returnTime) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.229:5000/rentalcar'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'carID': carID,
          'pickupTime': pickupTime,
          'returnTime': returnTime,
        }),
      );

      if (response.statusCode == 200) {
        Rental rental = Rental.fromMap(jsonDecode(response.body));
        currentTrip.add(rental);
        return true;
      } else {
        throw Exception('Failed to add rental');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to add rental');
    }
  }

  Future<bool> fetchCurrentTrip() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.229:5000/currentTrip'));

      if (response.statusCode == 200) {
        List<dynamic> decodedData = jsonDecode(response.body) as List<dynamic>;
        currentTrip = decodedData.map((rentalMap) => Rental.fromMap(rentalMap)).toList();
        return true;
      } else {
        throw Exception('Failed to fetch current trip');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch current trip');
    }
  }

  Future<bool> fetchCurrentRentalTripList() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.229:5000/currentRentalTripList'));

      if (response.statusCode == 200) {
        List<dynamic> decodedData = jsonDecode(response.body) as List<dynamic>;
        currentRental = decodedData.map((rentalMap) => Rental.fromMap(rentalMap)).toList();
        return true;
      } else {
        throw Exception('Failed to fetch current rental trip list');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch current rental trip list');
    }
  }

  Future<bool> fetchRentalHistory() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.229:5000/rentalHistory'));

      if (response.statusCode == 200) {
        List<dynamic> decodedData = jsonDecode(response.body) as List<dynamic>;
        rentalHistory = decodedData.map((rentalMap) => Rental.fromMap(rentalMap)).toList();
        return true;
      } else {
        throw Exception('Failed to fetch rental history');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch rental history');
    }
  }

  Future<bool> fetchTripHistory() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.229:5000/tripHistory'));

      if (response.statusCode == 200) {
        List<dynamic> decodedData = jsonDecode(response.body) as List<dynamic>;
       tripHistory = decodedData.map((rentalMap) => Rental.fromMap(rentalMap)).toList();
        return true;
      } else {
        throw Exception('Failed to fetch trip history');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch trip history');
    }
  }
}