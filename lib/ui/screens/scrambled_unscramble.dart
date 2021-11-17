import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rafia_unscramble_demo/cubit/sentence_cubit.dart';

class ScrambledUnscrambled extends StatefulWidget {
  //stateful widget because TextField controller needs to be updated by setState()

  final String?
      userInputFromFirstTextField; //This is for the input from First Screen

  const ScrambledUnscrambled({
    Key? key,
    required this.userInputFromFirstTextField,
  }) : super(key: key);

  @override
  State<ScrambledUnscrambled> createState() => _ScrambledUnscrambledState();
}

class _ScrambledUnscrambledState extends State<ScrambledUnscrambled> {
  String str =
      'Nothing'; //a variable for checking FirstSCreen input against SecondScreen input
  final mycontroller = TextEditingController(); // to hold TextField input

  @override
  Widget build(BuildContext context) {
    String myFirstText = widget
        .userInputFromFirstTextField!; // Stores TextField input from FirstScreen

    List<String> inputs = widget.userInputFromFirstTextField!.split(" ");

    // In order to use shuffle(), the string value needed to be split into List

    //This String type function is responsible for shuffling the List called inputs and then converting it back to a String type data.
    String shuffledWords(List<String> input) {
      input.shuffle();
      // print(input);
      return input.join(" ");
    }

    return BlocProvider<SentenceCubit>(
      //BlocProvider wrapped around Scaffold is used to supply context to widgets that are interested in it down the tree
      create: (context) => SentenceCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Unscramble'),
        ),
        body:
            // the body begins with a Column and displays the Scrambled version of the input from TextField from FirstScreen
            Column(
          children: [
            Card(
              margin: const EdgeInsets.only(top: 50),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 100,
                color: Colors.blueAccent,
                padding: const EdgeInsets.all(15),
                child: Text(
                  shuffledWords(inputs),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            //SizedBox to create space. Absolutely, costmetic concerns!
            const SizedBox(
              width: 20,
            ),

            //Second TextField is created using this widget
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: TextField(
                controller: mycontroller,
                onChanged: (String text) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Please, enter a grammatically correct sentence.',
                  labelText: 'Rearrange The Words Above',
                  labelStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.blue[900],
                  ),
                ),
              ),
            ),

            //controller argumnet value is stored in the previously created String str. Now str previously stored "Nothing".
            //Now setState updates str value with that of the SecondScreen TextField controller value
            ElevatedButton(
              onPressed: () {
                setState(() {
                  str = mycontroller.text;
                  //print(str);
                });
              },
              child: const Text("Submit"),
            ),

            //This widget is only shown when str value stores SecondScreen TextField value,
            //Otherwise, it is not displayed

            if (str == mycontroller.text)
              Container(
                  color: Colors.blueAccent,
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 100,
                  child: Center(
                    //BlocBuilder is used to wrap specifically Text() widget
                    //Because only this Text() widget needs to be rebuild when str gets updated
                    //in order to make the Text() display whatever on screen, SentenceCubit does the heavy work

                    child: BlocBuilder<SentenceCubit, SentenceState>(
                      builder: (context, state) {
                        //print(str);
                        return Text(
                          BlocProvider.of<SentenceCubit>(
                                  context) //this is used to access SentenceCubit methods and properties with SentenceCubit Context
                              .checkForError(str, myFirstText),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
