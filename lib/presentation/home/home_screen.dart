import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: (value) {},
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.purpleAccent,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          TextField(
            onChanged: (value) {},
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.purpleAccent,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
