import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String error;

  const AppErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 64,
        ),
        const Icon(
          Icons.error_outlined,
          size: 64,
          color: Colors.red,
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
            child: Text(
          error,
          style: const TextStyle(fontSize: 16),
        )),
      ],
    );
  }
}
