// ===============================
// MODEL SPORT FIELD
// ===============================
class SportField {
  final String id;
  final String name;
  final String sportType;
  final String location;
  final String facilities;
  final double pricePerHour;
  final String imagePath;

  SportField({
    required this.id,
    required this.name,
    required this.sportType,
    required this.location,
    required this.facilities,
    required this.pricePerHour,
    required this.imagePath,
  });

  factory SportField.fromJson(Map<String, dynamic> json) {
    return SportField(
      id: json['id'],
      name: json['name'],
      sportType: json['sport_type'],
      location: json['location'],
      facilities: json['facilities'] ?? '',
      pricePerHour: double.parse(json['price_per_hour'].toString()),
      imagePath: json['image_path'],
    );
  }
}

// ===============================
// MODEL BOOKING
// ===============================
class Booking {
  final String id;
  final SportField field;
  final String userName;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final double totalPrice;
  final String paymentMethod;

  Booking({
    required this.id,
    required this.field,
    required this.userName,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.totalPrice,
    required this.paymentMethod,
  });
}

// ===============================
// MODEL USER — WAJIB UNTUK LOGIN
// ===============================
class User {
  final String id;
  final String fullName;
  final String email;
  final String phone;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
