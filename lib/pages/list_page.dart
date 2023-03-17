import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapptic_challenge/bloc/list_cubit.dart';
import 'package:tapptic_challenge/widgets/error_widget.dart';

import '../bloc/list_state.dart';
import '../model/number_model.dart';
import '../widgets/number_details.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListCubit>(
      create: (context) => ListCubit()..init(),
      child: Scaffold(
        endDrawer: endDrawer(context),
        appBar: AppBar(
          title: const Text('List Page'),
          actions: <Widget>[Container()],
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: _NumberListWidget(),
        ),
      ),
    );
  }

  Widget? endDrawer(BuildContext context) =>
      BlocSelector<ListCubit, ListState, NumberModel?>(
        selector: (state) => state.selectedNumber,
        builder: (context, number) =>
            number != null ? NumberDetails(number: number) : Container(),
      );
}

class _NumberListWidget extends StatelessWidget {
  const _NumberListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(
      builder: (context, state) {
        if (state.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.error?.isNotEmpty == true) {
          return AppErrorWidget(
            error: state.error!,
          );
        }
        if (state.numbers.isNotEmpty) {
          return ListView.builder(
              itemCount: state.numbers.length,
              itemBuilder: (BuildContext context, int index) {
                return _NumberListItem(number: state.numbers[index]);
              });
        }
        return Container();
      },
    );
  }
}

class _NumberListItem extends StatelessWidget {
  final NumberModel number;

  const _NumberListItem({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ListCubit, ListState, NumberModel?>(
      selector: (state) => state.selectedNumber,
      builder: (context, selectedNumber) => ListTile(
        leading: Image.network(number.image),
        title: Text(number.name),
        selected: selectedNumber == number,
        selectedTileColor: Colors.blueAccent.shade700,
        onTap: () {
          context.read<ListCubit>().selectNumber(number);
          Scaffold.of(context).openEndDrawer();
        },
        tileColor: Colors.white,
      ),
    );
  }
}
