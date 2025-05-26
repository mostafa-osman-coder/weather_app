import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '/model/current_weather_data.dart';
import '/model/five_days_data.dart';
import '/service/weather_service.dart';

class HomeController extends GetxController {
  String? city;
  String? searchText;

  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];

  HomeController({required this.city});

  @override
  void onInit() {
    initState();
    getTopFiveCities();
    super.onInit();
  }

  void updateWeather() {
    initState();
  }

  void initState() {
    getCurrentWeatherData();
    getFiveDaysData();
  }

  void getCurrentWeatherData() {
    WeatherService(city: '$city').getCurrentWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
          update();
        },
        onError: (error) => {
          // ignore: avoid_print
          print(error),
          update(),
        });
  }

  void getTopFiveCities() {
    List<String> cities = [
      'zagazig',
      'cairo',
      'alexandria',
      'ismailia',
      'fayoum'
    ];
    // ignore: avoid_function_literals_in_foreach_calls
    cities.forEach((c) {
      // ignore: unnecessary_string_interpolations
      WeatherService(city: '$c').getCurrentWeatherData(onSuccess: (data) {
        dataList.add(data);
        update();
      }, onError: (error) {
        // ignore: avoid_print
        print(error);
        update();
      });
    });
  }

  void getFiveDaysData() {
    WeatherService(city: '$city').getFiveDaysThreeHoursForcastData(
        onSuccess: (data) {
          fiveDaysData = data;
          update();
        }, onError: (error) {
      // ignore: avoid_print
      print(error);
      update();
    });
  }
}