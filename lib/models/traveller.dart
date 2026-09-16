class Traveller {
  final String id;
  final String name;
  final int age;
  final String gender;
  final String profession;
  final String homeCity;
  final String destination;
  final String travellerType;
  final String pace;
  final String diet;
  final int budget;
  final String bio;
  final List<String> interests;

  const Traveller({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.profession,
    required this.homeCity,
    required this.destination,
    required this.travellerType,
    required this.pace,
    required this.diet,
    required this.budget,
    required this.bio,
    required this.interests,
  });

  factory Traveller.fromJson(Map<String, dynamic> json) {
    return Traveller(
      id: json['id'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      profession: json['profession'] as String,
      homeCity: json['homeCity'] as String,
      destination: json['destination'] as String,
      travellerType: json['travellerType'] as String,
      pace: json['pace'] as String,
      diet: json['diet'] as String,
      budget: json['budget'] as int,
      bio: json['bio'] as String,
      interests: (json['interests'] as List<dynamic>).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'profession': profession,
      'homeCity': homeCity,
      'destination': destination,
      'travellerType': travellerType,
      'pace': pace,
      'diet': diet,
      'budget': budget,
      'bio': bio,
      'interests': interests,
    };
  }

  String get initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.isEmpty ? '?' : name[0].toUpperCase();
  }

  String get budgetLabel => '₹${budget ~/ 1000}k';
}
