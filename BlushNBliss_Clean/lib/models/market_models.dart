import 'core_models.dart';

class StylistModel {
  final String id;
  final String name;
  final String specialty;
  final int experienceYears;
  final double rating;
  final int reviewCount;
  final String profileImageUrl;
  final List<String> serviceIds;
  final List<String> portfolioImages;

  StylistModel({
    required this.id,
    required this.name,
    required this.specialty,
    required this.experienceYears,
    required this.rating,
    required this.reviewCount,
    required this.profileImageUrl,
    required this.serviceIds,
    required this.portfolioImages,
  });
}

class BookingModel {
  final String id;
  final String userId;
  final String serviceId;
  final String stylistId;
  final DateTime dateTime;
  final String location; // 'salon' or 'home'
  final String address;
  final String specialInstructions;
  final double totalPrice;
  final String status; // 'upcoming', 'completed', 'cancelled'

  BookingModel({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.stylistId,
    required this.dateTime,
    required this.location,
    required this.address,
    required this.specialInstructions,
    required this.totalPrice,
    required this.status,
  });
}
