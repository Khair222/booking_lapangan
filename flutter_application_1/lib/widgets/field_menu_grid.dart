import 'package:flutter/material.dart';
import '../models.dart';
import '../services/api_service.dart';
import 'field_card.dart';

class FieldMenuGrid extends StatefulWidget {
  const FieldMenuGrid({super.key});

  @override
  State<FieldMenuGrid> createState() => _FieldMenuGridState();
}

class _FieldMenuGridState extends State<FieldMenuGrid> {
  late Future<List<SportField>> _fieldsFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _fieldsFuture = _apiService.getFields();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SportField>>(
      future: _fieldsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text('Error: ${snapshot.error}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _fieldsFuture = _apiService.getFields();
                    });
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No fields available.'));
        }

        final fields = snapshot.data!;

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: fields.length,
          itemBuilder: (context, index) {
            return FieldCard(
              field: fields[index],
              onTap: () {
                // Navigate to booking detail or show modal
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected: ${fields[index].name}')),
                );
                // TODO: Navigate to booking screen
              },
            );
          },
        );
      },
    );
  }
}
