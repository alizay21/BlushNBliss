import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/core_models.dart';
import '../models/market_models.dart';
import '../constants/dummy_data.dart';

class AppStateProvider with ChangeNotifier {
  List<ServiceModel> _services = DummyData.services;
  List<StylistModel> _stylists = DummyData.stylists;
  List<BookingModel> _bookings = [];
  List<String> _favoriteStylistIds = [];

  AppStateProvider() {
    _loadFavorites();
  }

  List<ServiceModel> get services => _services;
  List<StylistModel> get stylists => _stylists;
  List<BookingModel> get bookings => _bookings;
  List<String> get favoriteStylistIds => _favoriteStylistIds;

  List<StylistModel> get favoriteStylists {
    return _stylists.where((s) => _favoriteStylistIds.contains(s.id)).toList();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList('favoriteStylists');
    if (favList != null) {
      _favoriteStylistIds = favList;
      notifyListeners();
    }
  }

  Future<void> toggleFavorite(String stylistId) async {
    if (_favoriteStylistIds.contains(stylistId)) {
      _favoriteStylistIds.remove(stylistId);
    } else {
      _favoriteStylistIds.add(stylistId);
    }
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favoriteStylists', _favoriteStylistIds);
    notifyListeners();
  }

  void addBooking(BookingModel booking) {
    _bookings.add(booking);
    notifyListeners();
  }

  void cancelBooking(String bookingId) {
    final index = _bookings.indexWhere((b) => b.id == bookingId);
    if (index != -1) {
      final old = _bookings[index];
      _bookings[index] = BookingModel(
        id: old.id,
        userId: old.userId,
        serviceId: old.serviceId,
        stylistId: old.stylistId,
        dateTime: old.dateTime,
        location: old.location,
        address: old.address,
        specialInstructions: old.specialInstructions,
        totalPrice: old.totalPrice,
        status: 'cancelled',
      );
      notifyListeners();
    }
  }

  List<StylistModel> getStylistsForService(String serviceId) {
    return _stylists.where((s) => s.serviceIds.contains(serviceId)).toList();
  }
}
