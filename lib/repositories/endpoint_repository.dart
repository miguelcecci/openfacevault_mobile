import 'package:shared_preferences/shared_preferences.dart';

class EndpointRepository{

  Future<String> getRepository() async {
    final _prefs = await SharedPreferences.getInstance();
    final endpoint = (_prefs.getString('endpoint') ?? '');
  }
}