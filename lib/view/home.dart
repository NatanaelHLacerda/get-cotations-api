import 'package:crypto/controller/home_controller.dart';
import 'package:crypto/view/home_view_data.dart';
import 'package:crypto/view/home_view_loading.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contation"),
      ),
      body: FutureBuilder(
          future: homeController.getCotation(),
          builder: (context, snapShot) {
            if (snapShot.hasData) { 
              return HomeViewData(snapShot: snapShot.data!);
            }  
            else {
              return const HomeViewLoading();
            }
          }),
    );
  }
}
