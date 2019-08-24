import 'package:openfacevault_mobile/services/persons_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonsRepository {
  final _personsService = PersonsService();

  Future<List> getPersons() async {

    final _prefs = await SharedPreferences.getInstance();
    final endpoint = (_prefs.getString('endpoint') ?? '');
    final token = (_prefs.getString('token') ?? '');

    final response = await _personsService.getPersons(token, endpoint);

    return response.persons;
  }
}