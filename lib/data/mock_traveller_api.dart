class MockTravellerApi {
  bool failNextRequest = false;

  Future<List<Map<String, dynamic>>> fetchTravellers() async {
    await Future<void>.delayed(const Duration(milliseconds: 1500));

    if (failNextRequest) {
      failNextRequest = false;
      throw Exception('Could not reach the server. Check your connection.');
    }

    return _travellersJson;
  }

  Future<void> sendConnectRequest(String travellerId) async {
    await Future<void>.delayed(const Duration(milliseconds: 900));
  }
}

const _travellersJson = <Map<String, dynamic>>[
  {
    'id': 't1',
    'name': 'Aditi Sharma',
    'age': 26,
    'gender': 'Female',
    'profession': 'Product Designer',
    'homeCity': 'Delhi',
    'destination': 'Manali',
    'travellerType': 'Explorer',
    'pace': 'Relaxed',
    'diet': 'Vegetarian',
    'budget': 18000,
    'bio':
        'Looking for two or three people to share a slow week in the mountains. '
            'I like early mornings, long walks and not planning every hour.',
    'interests': ['Hiking', 'Photography', 'Cafes', 'Journaling'],
  },
  {
    'id': 't2',
    'name': 'Rohan Mehta',
    'age': 29,
    'gender': 'Male',
    'profession': 'Software Engineer',
    'homeCity': 'Bengaluru',
    'destination': 'Spiti Valley',
    'travellerType': 'Backpacker',
    'pace': 'Fast-paced',
    'diet': 'Non-Vegetarian',
    'budget': 25000,
    'bio':
        'Doing Spiti on a bike in June. Want a riding partner who is fine with '
            'long days and basic stays. No fixed itinerary beyond the route.',
    'interests': ['Motorcycling', 'Camping', 'Astronomy'],
  },
  {
    'id': 't3',
    'name': 'Kavya Nair',
    'age': 24,
    'gender': 'Female',
    'profession': 'Student',
    'homeCity': 'Kochi',
    'destination': 'Goa',
    'travellerType': 'Social Traveller',
    'pace': 'Moderate',
    'diet': 'Vegan',
    'budget': 12000,
    'bio':
        'First proper solo trip. Tight budget, hostel stays, and happy to meet '
            'people along the way rather than plan everything in advance.',
    'interests': ['Music', 'Beaches', 'Street food', 'Swimming'],
  },
  {
    'id': 't4',
    'name': 'Imran Qureshi',
    'age': 31,
    'gender': 'Male',
    'profession': 'Content Creator',
    'homeCity': 'Mumbai',
    'destination': 'Ladakh',
    'travellerType': 'Adventurer',
    'pace': 'Fast-paced',
    'diet': 'Non-Vegetarian',
    'budget': 40000,
    'bio': 'Shooting a short film across Ladakh. Need someone comfortable with '
        'altitude, early call times and carrying gear.',
    'interests': ['Filmmaking', 'Trekking', 'Drones', 'Editing'],
  },
  {
    'id': 't5',
    'name': 'Sneha Iyer',
    'age': 27,
    'gender': 'Female',
    'profession': 'Doctor',
    'homeCity': 'Pune',
    'destination': 'Rishikesh',
    'travellerType': 'Slow Traveller',
    'pace': 'Relaxed',
    'diet': 'Jain',
    'budget': 15000,
    'bio':
        'Ten days off after a long rotation. Yoga in the mornings, the river in '
            'the evenings, and nothing scheduled in between.',
    'interests': ['Yoga', 'Reading', 'River rafting'],
  },
];
