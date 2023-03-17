import 'package:equatable/equatable.dart';
import 'package:tapptic_challenge/model/number_model.dart';

class ListState extends Equatable {
  const ListState({
    required this.loading,
    required this.error,
    required this.numbers,
    required this.selectedNumber,
  });

  const ListState.initial()
      : loading = false,
        error = null,
        numbers = const [],
        selectedNumber = null;

  final bool loading;
  final String? error;
  final List<NumberModel> numbers;
  final NumberModel? selectedNumber;

  @override
  List<Object?> get props => [
        loading,
        error,
        numbers,
        selectedNumber,
      ];
}
