import 'package:flutter/material.dart';
import '../models.dart';

class BookingListItem extends StatelessWidget {
  final Booking booking;

  const BookingListItem({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final dateStr =
        '${booking.date.day}/${booking.date.month}/${booking.date.year}';
    final start =
        '${booking.startTime.hour.toString().padLeft(2, '0')}:${booking.startTime.minute.toString().padLeft(2, '0')}';
    final end =
        '${booking.endTime.hour.toString().padLeft(2, '0')}:${booking.endTime.minute.toString().padLeft(2, '0')}';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: ListTile(
        leading: const Icon(Icons.sports_soccer, color: Color(0xff0A3A67)),
        title: Text(booking.field.name),
        subtitle: Text(
          'Nama: ${booking.userName}\n'
          'Tanggal: $dateStr\n'
          'Jam: $start - $end\n'
          'Metode: ${booking.paymentMethod}',
        ),
        trailing: Text(
          'Rp ${booking.totalPrice.toStringAsFixed(0)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff0A3A67),
          ),
        ),
      ),
    );
  }
}
