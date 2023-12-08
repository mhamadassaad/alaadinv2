import 'package:flutter/material.dart';
import '../../utils/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyles.appBackgroundColor,
        body: Container(
          child: Center(
            child: Text('Home Page Screen'),
          ),
        ),
      ),
    );
  }
}
