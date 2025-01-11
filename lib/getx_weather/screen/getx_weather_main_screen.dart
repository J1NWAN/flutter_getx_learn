import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/getx_weather/service/getx_weather_service.dart';
import 'package:get/get.dart';

class GetxWeatherMainScreen extends StatelessWidget {
  GetxWeatherMainScreen({super.key});

  final GetxWeatherService weatherService = Get.put(GetxWeatherService());
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 화면이 처음 빌드될 때 한 번만 호출
    WidgetsBinding.instance.addPostFrameCallback((_) {
      weatherService.fetchWeather('Daejeon', '');
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('날씨 앱'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: cityController,
                decoration: InputDecoration(
                  hintText: '도시 이름을 입력하세요',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search, color: Colors.grey),
                    onPressed: () {
                      if (cityController.text.isNotEmpty) {
                        weatherService.fetchWeather(
                          cityController.text,
                          '',
                        );
                      }
                    },
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    weatherService.fetchWeather(
                      value,
                      '',
                    );
                  }
                },
              ),
            ),
            Obx(() {
              return weatherService.isLoading.value ? const CircularProgressIndicator() : const SizedBox.shrink();
            }),
            Obx(() {
              return weatherService.error.value.isNotEmpty ? Text(weatherService.error.value) : const SizedBox.shrink();
            }),
            Obx(() {
              if (weatherService.weather.value.isEmpty) {
                return const SizedBox.shrink();
              }

              return Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: weatherService.weather.value['list']?.length ?? 0,
                      itemBuilder: (context, index) {
                        final forecast = weatherService.weather.value['list'][index];
                        return ListTile(
                          leading: Image.network(weatherService.getWeatherIcon(forecast['weather'][0]['icon'])),
                          title: Text('${weatherService.weather.value['city']['name']}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${forecast['dt_txt']}'),
                              Text('${forecast['weather'][0]['description']}'),
                            ],
                          ),
                          trailing: Text(
                            '${forecast['main']['temp']}°C',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
