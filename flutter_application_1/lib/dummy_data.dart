import 'models.dart';

final List<SportField> dummyFields = [
  SportField(
    id: 'f1',
    name: 'Lapangan Futsal Indoor A',
    sportType: 'Futsal',
    location: 'Jl. Sport Center No. 1',
    facilities: 'Rumput sintetis, kamar ganti, parkir luas',
    pricePerHour: 150000,
    imagePath: 'assets/futsal.jpg',
  ),
  SportField(
    id: 'f2',
    name: 'Lapangan Basket Outdoor B',
    sportType: 'Basket',
    location: 'Jl. Merdeka No. 12',
    facilities: 'Lampu malam, toilet, kantin',
    pricePerHour: 120000,
    imagePath: 'assets/basket.png',
  ),
  SportField(
    id: 'f3',
    name: 'Lapangan Badminton C',
    sportType: 'Badminton',
    location: 'Gor Anggrek',
    facilities: 'AC, kursi penonton, kantin',
    pricePerHour: 80000,
    imagePath: 'assets/badminton.jpg',
  ),

  SportField(
    id: 'f4',
    name: 'Lapangan Futsal D',
    sportType: 'Futsal',
    location: 'Jl. Olahraga No. 5',
    facilities: 'Lampu malam, toilet, parkir',
    pricePerHour: 200000,
    imagePath: 'assets/futsal.jpg',
  ),
];


final List<String> sportCategories = [
  'Semua',
  'Futsal',
  'Basket',
  'Badminton',
  'Tenis',
  'Voli',
];
