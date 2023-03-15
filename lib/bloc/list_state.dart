import 'package:equatable/equatable.dart';
import 'package:tapptic_challenge/model/number_model.dart';

class ListState extends Equatable {
  const ListState({
    required this.loading,
    required this.error,
    required this.numbers,
  });

  const ListState.initial()
      : loading = false,
        error = null,
        numbers = const [];

  final bool loading;
  final List<NumberModel> numbers;
  final String? error;

  @override
  List<Object?> get props => [
        loading,
        numbers,
        error,
      ];
}
