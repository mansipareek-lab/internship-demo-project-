import 'traveller.dart';

const kDestinations = <String>[
  'Manali',
  'Spiti Valley',
  'Goa',
  'Ladakh',
  'Rishikesh',
];

const kTravellerTypes = <String>[
  'Explorer',
  'Backpacker',
  'Social Traveller',
  'Adventurer',
  'Slow Traveller',
];

const kDiets = <String>[
  'Vegetarian',
  'Non-Vegetarian',
  'Vegan',
  'Jain',
];

class TravellerFilter {
  final String? destination;
  final String? travellerType;
  final String? diet;
  final int? maxBudget;

  const TravellerFilter({
    this.destination,
    this.travellerType,
    this.diet,
    this.maxBudget,
  });

  int get activeCount {
    var count = 0;
    if (destination != null) count++;
    if (travellerType != null) count++;
    if (diet != null) count++;
    if (maxBudget != null) count++;
    return count;
  }

  bool get isEmpty => activeCount == 0;

  bool matches(Traveller traveller) {
    if (destination != null && traveller.destination != destination) {
      return false;
    }
    if (travellerType != null && traveller.travellerType != travellerType) {
      return false;
    }
    if (diet != null && traveller.diet != diet) {
      return false;
    }
    if (maxBudget != null && traveller.budget > maxBudget!) {
      return false;
    }
    return true;
  }
}
