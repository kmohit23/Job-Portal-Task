import 'package:flutter/material.dart';
import 'package:ar_job_portal/screens/home/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('HomeScreen')),
        body: SafeArea(child: Text('HomeScreenController')));
  }
}
