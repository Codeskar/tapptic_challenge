import 'package:equatable/equatable.dart';
import 'package:tapptic_challenge/model/number_model.dart';

class NumberDetailsState extends Equatable {
  const NumberDetailsState({
    required this.loading,
    required this.number,
    this.error,
  });

  const NumberDetailsState.initial()
      : loading = false,
        error = null,
        number = null;

  final bool loading;
  final NumberModel? number;
  final String? error;

  @override
  List<Object?> get props => [
        loading,
        error,
        number,
      ];
}
