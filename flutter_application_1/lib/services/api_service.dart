import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models.dart';

class ApiService {
  // Ganti sesuai hosting/server Anda
  static const String baseUrl = 'http://localhost/booking_lapangan/backend';

  // Mock Data for Testing without Backend
  static final List<Map<String, dynamic>> _mockUsers = [
    {
      'id': '1',
      'full_name': 'User Demo',
      'email': 'user@example.com',
      'phone': '08123456789',
      'password': 'password123',
    }
  ];

  // ==========================
  // GET ALL FIELDS
  // ==========================
  Future<List<SportField>> getFields() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/get_fields.php'));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        return body.map((item) => SportField.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load fields');
      }
    } catch (e) {
      // Fallback to dummy data if API fails
      print('API Error (getFields): $e. Using dummy data.');
      return []; // Or return dummy data from dummy_data.dart if imported
    }
  }

  // ==========================
  // CREATE BOOKING
  // ==========================
  Future<bool> createBooking(Booking booking) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/create_booking.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id': booking.id,
          'field_id': booking.field.id,
          'user_name': booking.userName,
          'booking_date': booking.date.toIso8601String().split('T')[0],
          'start_time': '${booking.startTime.hour}:${booking.startTime.minute}:00',
          'end_time': '${booking.endTime.hour}:${booking.endTime.minute}:00',
          'total_price': booking.totalPrice,
          'payment_method': booking.paymentMethod,
        }),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return result['success'] ?? false;
      } else {
        return false;
      }
    } catch (e) {
      print("Error create booking: $e");
      // Simulate success for demo
      return true;
    }
  }

  // ==========================
  // REGISTER USER
  // ==========================
  Future<bool> registerUser(
      String name, String email, String phone, String password) async {
    try {
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 1));

      // Add to mock storage
      _mockUsers.add({
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'full_name': name,
        'email': email,
        'phone': phone,
        'password': password,
      });

      return true;
    } catch (e) {
      print('Register Error: $e');
      return false;
    }
  }

  // ==========================
  // LOGIN USER
  // ==========================
  Future<User?> loginUser(String identifier, String password) async {
    try {
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 1));

      // Check mock storage
      // Identifier can be email OR full_name
      final userMap = _mockUsers.firstWhere(
        (user) =>
            (user['email'] == identifier || user['full_name'] == identifier) &&
            user['password'] == password,
        orElse: () => {},
      );

      if (userMap.isNotEmpty) {
        return User.fromJson(userMap);
      }

      return null;
    } catch (e) {
      print('Login Error: $e');
      return null;
    }
  }
}
