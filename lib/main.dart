import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

List<String> list = [
  "Great Hand",
  "ChurchEdge",
  "DutchWhole",
  "MessTent",
  "ScriptGrade",
  'Saturday',
  'Sunday',
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday"
];
List<String> add = [];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: "Startup Name Setup".text.black.bold.make(),
          centerTitle: true,
          elevation: 2,
          backgroundColor: Vx.warmGray50,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Favorite()));
                },
                icon: Icon(
                  Icons.menu_open,
                  color: Colors.black,
                ))
          ],
        ),
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: list[index].text.xl2.bold.make(),
                  trailing: GestureDetector(
                      onTap: () {
                        if (add.contains(list[index])) {
                          add.remove(list[index]);
                        } else {
                          add.add(list[index]);
                        }

                        setState(() {});
                      },
                      child: add.contains(list[index])
                          ? Icon(
                              Icons.favorite_outlined,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: Colors.red,
                            )),
                ),
              );
            }));
  }
}

class NewCard extends StatelessWidget {
  NewCard({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: title.text.xl2.bold.make(),
      ),
    );
  }
}

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: "Favorite".text.bold.xl2.black.make(),
          centerTitle: true,
          backgroundColor: Vx.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Vx.black,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: add.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: add[index].text.black.bold.xl2.make(),
                ),
              );
            }),
      ),
    );
  }
}
