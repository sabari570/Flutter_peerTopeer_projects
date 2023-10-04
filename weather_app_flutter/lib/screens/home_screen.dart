import 'package:flutter/material.dart';
import 'package:weather_app_flutter/models/weather_model.dart';
import 'package:weather_app_flutter/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel weatherResult = WeatherModel(
    id: -1,
    main: "",
    description: "",
    icon: "",
  );

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final APIServices apiServices = APIServices();
    TextEditingController cityNameTextEditingController =
        TextEditingController();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Weather App",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      controller: cityNameTextEditingController,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        hintText: "Enter city name",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (cityNameTextEditingController.text.isNotEmpty) {
                          setState(() {
                            isLoading = true;
                          });
                          debugPrint(
                              "City name: ${cityNameTextEditingController.text}");
                          var weatherModel = await apiServices.getDataFromApi(
                              cityNameTextEditingController.text);
                          setState(() {
                            isLoading = false;
                          });
                          if (weatherModel != null) {
                            debugPrint("Result in here: ${weatherModel.main}");
                            setState(() {
                              weatherResult = weatherModel;
                            });
                          }
                          cityNameTextEditingController.text = "";
                        }
                      },
                      child: const Text("Fetch Request"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Results:",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Weather: ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${weatherResult.main}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Description: ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${weatherResult.description}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ));
  }
}
