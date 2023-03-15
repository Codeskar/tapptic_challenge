import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapptic_challenge/bloc/number_details_state.dart';
import 'package:tapptic_challenge/model/number_model.dart';
import 'package:http/http.dart' as http;

class NumberDetailsCubit extends Cubit<NumberDetailsState> {
  NumberDetailsCubit(this._number) : super(const NumberDetailsState.initial());

  NumberModel _number;
  bool _loading = false;
  String? _error;

  void init() {
    _getNumberDetails();
  }

  void _getNumberDetails() {
    _updateState(loading: true);
    _fetchNumberDetails(http.Client(), _number.name).then(
      (value) {
        _updateState(
          loading: false,
          number: value,
        );
      },
      onError: (_) => _updateState(
        loading: false,
        error: 'Failed to load number',
      ),
    );
  }

  Future<NumberModel> _fetchNumberDetails(
      http.Client client, String name) async {
    final response = await client
        .get(Uri.parse('http://dev.tapptic.com/test/json.php?name=${name}'));

    return _parseNumberDetails(response.body);
  }

  NumberModel _parseNumberDetails(String responseBody) {
    final parsed = jsonDecode(responseBody);

    return NumberModel.fromJson(parsed);
  }

  void _updateState({
    bool? loading,
    NumberModel? number,
    String? error,
  }) {
    _loading = loading ?? _loading;
    _error = error ?? _error;
    _number = number ?? _number;

    emit(
      NumberDetailsState(
        loading: _loading,
        error: _error,
        number: _number,
      ),
    );
  }
}
