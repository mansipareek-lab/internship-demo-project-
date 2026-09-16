import '../models/traveller.dart';
import 'mock_traveller_api.dart';

/// The REPOSITORY.
///
/// Its job is to hide *where* data comes from. The rest of the app asks the
/// repository for travellers; it does not know or care whether they came from
/// a mock list, an HTTP API, or a local cache.
///
/// It is also where deserialization happens: raw JSON goes in, typed
/// `Traveller` objects come out.
class TravellerRepository {
  final MockTravellerApi _api;

  TravellerRepository(this._api);

  Future<List<Traveller>> getTravellers() async {
    final rawList = await _api.fetchTravellers();
    return rawList.map(Traveller.fromJson).toList();
  }

  Future<void> sendConnectRequest(String travellerId) {
    return _api.sendConnectRequest(travellerId);
  }
}
