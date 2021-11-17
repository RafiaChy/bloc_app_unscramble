import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sentence_state.dart';

class SentenceCubit extends Cubit<SentenceState> {
  SentenceCubit() : super(SentenceInitial());

  String checkForError(String getSecondText, String getFirstString) {
    // getSecondText = secondString;
    final okay = Success(okay: "Okay", success: false);
    final notOkay = Failed(notOkay: "Not Okay", failure: false);

    if (getSecondText == getFirstString) {
      return okay.okay;
    } else {
      return notOkay.notOkay;
    }
  }
}
