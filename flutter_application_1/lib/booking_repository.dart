import 'models.dart';

class BookingRepository {
  BookingRepository._();

  static final List<Booking> _bookings = [];
  static double _balance = 0;

  static List<Booking> getAllBookings() => List.unmodifiable(_bookings);

  static void addBooking(Booking booking) {
    _bookings.add(booking);
  }

  static double get balance => _balance;

  static void topUp(double amount) {
    _balance += amount;
  }

  static bool payWithBalance(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
      return true;
    }
    return false;
  }

  static List<Booking> getBookingsForFieldAndDate(String fieldId, DateTime date) {
    return _bookings.where((b) {
      return b.field.id == fieldId &&
          b.date.year == date.year &&
          b.date.month == date.month &&
          b.date.day == date.day;
    }).toList();
  }

  static bool isTimeSlotAvailable({
    required String fieldId,
    required DateTime date,
    required DateTime start,
    required DateTime end,
  }) {
    final sameDayBookings = getBookingsForFieldAndDate(fieldId, date);
    for (final b in sameDayBookings) {
      final overlap = start.isBefore(b.endTime) && end.isAfter(b.startTime);
      if (overlap) return false;
    }
    return true;
  }
}
