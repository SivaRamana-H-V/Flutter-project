import 'package:http/http.dart' as http;

class ApiService {
  // Function to fetch listings based on pagination
  static Future<http.Response> getListings() async {
    final url = Uri.https('dev2be.oruphones.com', '/api/v1/global/assignment/getListings', {'page': '1', 'limit': '10'});
    return await http.get(url);
  }
  Future<void> fetchListings(int page, int limit) async {
    final url =
        Uri.parse('https://dev2be.oruphones.com/api/v1/global/assignment/getListings?page=$page&limit=$limit');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // Successfully fetched listings, you can parse the JSON response here
      // Example: final data = jsonDecode(response.body);
      print('Fetched listings: ${response.body}');
    } else {
      // Handle error
      print('Failed to fetch listings: ${response.statusCode}');
    }
  }

  // Function to fetch filters for phone listings
  Future<void> fetchFilters(bool isLimited) async {
    final url =
        Uri.parse('https://dev2be.oruphones.com/api/v1/global/assignment/getFilters?isLimited=$isLimited');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // Successfully fetched filters, you can parse the JSON response here
      // Example: final data = jsonDecode(response.body);
      print('Fetched filters: ${response.body}');
    } else {
      // Handle error
      print('Failed to fetch filters: ${response.statusCode}');
    }
  }

  // Function to search for phone models
  Future<void> searchModel(String modelName) async {
    final url = Uri.parse('https://dev2be.oruphones.com/api/v1/global/assignment/searchModel');
    final response = await http.post(url, body: {'searchModel': modelName});
    if (response.statusCode == 200) {
      // Successfully searched for phone models, you can parse the JSON response here
      // Example: final data = jsonDecode(response.body);
      print('Searched phone models: ${response.body}');
    } else {
      // Handle error
      print('Failed to search for phone models: ${response.statusCode}');
    }
  }
}
