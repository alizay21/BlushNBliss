import 'package:flutter/material.dart';
import '../models/core_models.dart';

class AppAuthProvider with ChangeNotifier {
  UserModel? _currentUser;
  bool _isLoading = false;

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _currentUser != null;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    
    // Dummy login success
    _currentUser = UserModel(
      uid: 'dummy_uid_123',
      email: email,
      name: 'Customer XYZ',
      phone: '+92 300 1234567',
    );
    
    _isLoading = false;
    notifyListeners();
  }

  Future<void> signup(String name, String phone, String email, String password) async {
    _isLoading = true;
    notifyListeners();
    
    await Future.delayed(const Duration(seconds: 2));
    
    _currentUser = UserModel(
      uid: 'dummy_uid_124',
      email: email,
      name: name,
      phone: phone,
    );
    
    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    _currentUser = null;
    notifyListeners();
  }
}
