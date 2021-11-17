import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafia_unscramble_demo/cubit/sentence_cubit.dart';

import 'package:rafia_unscramble_demo/ui/screens/scrambled_unscramble.dart';

class TextInputScreen extends StatelessWidget {
  final _controller = TextEditingController();

  TextInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unscramble'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: TextField(
              controller: _controller,
              onChanged: (String text) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Please, enter a grammatically correct sentence.',
                labelText: 'Input',
                labelStyle: TextStyle(
                  fontSize: 24,
                  color: Colors.blue[900],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print(
                _controller.text,
              );

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ScrambledUnscrambled(
                    userInputFromFirstTextField: _controller.text,
                  ),
                ),
              );
            },
            child: const Text(
              'Submit',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
