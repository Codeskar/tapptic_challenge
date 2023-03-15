import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapptic_challenge/model/number_model.dart';
import 'package:http/http.dart' as http;

import 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(const ListState.initial());

  bool _loading = false;
  String? _error;
  final List<NumberModel> _numberList = [];

  void init() {
    _getContactList();
  }

  void _getContactList() {
    _updateState(loading: true);
    _fetchContactList(http.Client()).then(
      (value) {
        if (value.isEmpty) {
          _updateState(
            loading: false,
            error: 'No contacts found',
          );
        } else {
          _updateState(
            loading: false,
            numberList: value,
          );
        }
      },
      onError: (_) => _updateState(
        loading: false,
        error: 'Failed to load contact list',
      ),
    );
  }

  Future<List<NumberModel>> _fetchContactList(http.Client client) async {
    final response =
        await client.get(Uri.parse('http://dev.tapptic.com/test/json.php'));

    return _parseContacts(response.body);
  }

  List<NumberModel> _parseContacts(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<NumberModel>((json) => NumberModel.fromJson(json))
        .toList();
  }

  void _updateState({
    bool? loading,
    List<NumberModel>? numberList,
    String? error,
  }) {
    _loading = loading ?? _loading;
    _error = error ?? _error;

    if (numberList != null) {
      _numberList
        ..clear()
        ..addAll(numberList);
    }

    emit(
      ListState(
        loading: _loading,
        error: _error,
        numbers: [..._numberList],
      ),
    );
  }
}
