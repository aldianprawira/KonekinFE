import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomeView'),
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          const SizedBox(height: 31),
          Container(
            width: 384,
            height: 774 / 2,
            color: Colors.red,
          ),
          Container(
            width: 384,
            height: 774 / 2,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
