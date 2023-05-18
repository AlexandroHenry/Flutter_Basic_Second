import 'package:flutter/material.dart';
import 'package:second_app/animalPage.dart';

import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  static List<String> animalName = [
    'Bear',
    'Camel',
    'Deer',
    'Fox',
    'Kangaroo',
    'Koala',
    'Lion',
    'Tiger',
  ];

  static List<String> animalImagePath = [
    'assets/images/bear.png',
    'assets/images/camel.png',
    'assets/images/deer.png',
    'assets/images/fox.png',
    'assets/images/kangaroo.png',
    'assets/images/koala.png',
    'assets/images/lion.png',
    'assets/images/tiger.png',
  ];

  static List<String> animalLocation = [
    'forest and mountain',
    'dessert',
    'forest',
    'snow mountain',
    'Austrailia',
    'Austrailia',
    'Africa',
    'Korea',
  ];

  final List<Animal> animalData = List.generate(
    animalLocation.length,
    (index) => Animal(
      animalName[index],
      animalLocation[index],
      animalImagePath[index],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView.builder(
        itemCount: animalData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                animalData[index].name,
              ),
              leading: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(animalData[index].imgPath),
              ),
              onTap: () {
                debugPrint(animalData[index].name);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AnimalPage(
                      animal: animalData[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
