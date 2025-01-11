import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class GetxWeatherService extends GetxService {
  final String domain = 'https://api.openweathermap.org';

  final weather = {}.obs;
  final isLoading = false.obs;
  final error = ''.obs;

  Future<Map<String, dynamic>> fetchWeather(String city, String apiKey) async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('$domain/data/2.5/forecast?q=$city&appid=$apiKey&units=metric&lang=kr'));

      if (response.statusCode == 200) {
        weather.value = convert.json.decode(response.body);
        error.value = '';

        return weather.value as Map<String, dynamic>;
      } else {
        error.value = '날씨 정보를 가져오는데 실패했습니다.';
        return {};
      }
    } catch (e) {
      error.value = '오류가 발생했습니다: $e';
      return {};
    } finally {
      isLoading.value = false;
    }
  }

  String getWeatherIcon(String iconCode) {
    return 'https://openweathermap.org/img/wn/$iconCode@2x.png';
  }

  String getToday() {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day).toString().split(' ')[0];
    return date;
  }
}
