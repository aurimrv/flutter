import 'package:flutter/material.dart';

class EmAlta extends StatefulWidget {
  const EmAlta({super.key});

  @override
  State<EmAlta> createState() => _EmAltaState();
}

class _EmAltaState extends State<EmAlta> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        "Em Alta",
        style: TextStyle(
            fontSize: 25
        ),),
    );
  }
}
