import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/models/house_models.dart';
import 'package:frontend_kontrakan/services/house_services.dart'; // Import the service

class HouseProvider extends ChangeNotifier {
  List<HouseModels> _houses = []; // List of HouseModels instead of Data
  bool _isLoading = false;
  String _errorMessage = '';

  List<HouseModels> get houses =>
      _houses; // Adjusting the getter to reflect the new list type
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;



  // Method to fetch houses
  Future<void> fetchHouses(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      List<HouseModels> fetchedHouses =
          await HouseServices().fetchHouses(context);
      _houses = fetchedHouses; // Update the houses list with the fetched data
    } catch (error) {
      _errorMessage = error.toString(); // Store the error message
    }

    _isLoading = false;
    notifyListeners(); // Notify listeners to update the UI
  }
}
