import 'package:flutter/material.dart';

class ServiceState with ChangeNotifier {
  String selectedService = '';

  void setService(String value) {
    selectedService = value;
    notifyListeners();
  }

  void resetService() {
    selectedService = '';
    notifyListeners();
  }

  void setSelectedService(String value) {
    selectedService = value;
    notifyListeners();
  }

  String getServiceName(String serviceValue) {
    switch (serviceValue) {
      case 'drain_cleaning':
        return 'Drain Cleaning';
      case 'bathroom_repair':
        return 'Bathroom Repair';
      case 'kitchen_plumbing':
        return 'Kitchen Plumbing';
      case 'emergency_service':
        return 'Emergency Service';
      case 'bathroom_renovation':
        return 'Bathroom Renovation';
      case 'maintenance_service':
        return 'Maintenance Service';
      default:
        return serviceValue;
    }
  }
}
