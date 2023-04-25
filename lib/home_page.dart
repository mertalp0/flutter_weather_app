import 'package:flutter/material.dart';
import 'package:flutter_havadurumu/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'all_methods.dart';
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var weatherList = ref.watch(myprovider);
    var city = ref.watch(getAdress);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 20, 117, 196),
        child: weatherList.when(
          data: (((data) {
            
            return city.when(
              data: ((city) {
               
                return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        opacity: 0.3,
                        image: NetworkImage(data[0].icon),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 25,
                          ),
                          padding: const EdgeInsets.all(10),
                          color: const Color.fromARGB(33, 255, 255, 255),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data[0].day,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              const Text(
                                "Bugün",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15, bottom: 8),
                          child:  Text(
                            sehir.administrativeArea.toString(),
                            style:const  TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 60),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 30),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(data[0].icon),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 2,
                                height: 78,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                "${degree(data[0].degree)}°",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 55),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  20), // 20 piksel yarıçaplı köşeler
                              color: const Color.fromARGB(118, 1, 10, 19),
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            10,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nem : ${data[0].humidity}%",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                            "Minimum Sıcaklık : ${degree(data[0].min)}°C",
                                            style: const TextStyle(
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Gece : ${degree(data[0].night)}°C",
                                            style: const TextStyle(
                                                color: Colors.white)),
                                        Text(
                                            "Maksimum Sıcaklık : ${degree(data[0].max)}°C",
                                            style: const TextStyle(
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Container(
                          height: 370,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20), // 20 piksel yarıçaplı köşeler
                            color: const Color.fromARGB(190, 18, 102, 170),
                          ),
                          child: ListView.builder(
                            itemCount: data.length - 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(0.5),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 90,
                                        child: Text(
                                          data[index + 1].day,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        data[index + 1].icon),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                data[index + 1].description,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ]),
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: Text(
                                          "${degree(data[index + 1].min)}/${degree(data[index + 1].max)}°C",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ));
              }),
              error: ((error, stackTrace) {
                return Text(error.toString());
              }),
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
            );
            return null;
          })),
          error: ((error, stackTrace) {
            return Text(error.toString());
          }),
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }


}
