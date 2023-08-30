import 'package:flutter/material.dart';

class HomeViewLoading extends StatefulWidget {
  const HomeViewLoading({super.key});

  @override
  State<HomeViewLoading> createState() => _HomeViewLoadingState();
}

class _HomeViewLoadingState extends State<HomeViewLoading> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
