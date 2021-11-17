part of 'sentence_cubit.dart';

@immutable
abstract class SentenceState {}

class SentenceInitial extends SentenceState {
  final String textInput;
  SentenceInitial({
    this.textInput = "",
  });
}

class Success extends SentenceState {
  final String okay;
  final bool success;
  Success({
    required this.okay,
    required this.success,
  });
}

class Failed extends SentenceState {
  final String notOkay;
  final bool failure;
  Failed({
    required this.notOkay,
    required this.failure,
  });
}
