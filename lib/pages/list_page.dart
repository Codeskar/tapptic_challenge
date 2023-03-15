import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapptic_challenge/bloc/list_cubit.dart';

import '../bloc/list_state.dart';
import '../model/number_model.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider<ListCubit>(
          create: (context) => ListCubit()..init(),
          child: const _ContactListWidget(),
        ),
      ),
    );
  }
}

class _ContactListWidget extends StatelessWidget {
  const _ContactListWidget({super.key});

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
          return _ErrorWidget(
            error: state.error!,
          );
        }
        if (state.numbers.isNotEmpty) {
          return ListView.builder(
              itemCount: state.numbers.length,
              itemBuilder: (BuildContext context, int index) {
                return _ContactListItem(contact: state.numbers[index]);
              });
        }
        return Container();
      },
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String error;

  const _ErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 64,
        ),
        const Icon(
          Icons.error_outlined,
          size: 64,
          color: Colors.red,
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
            child: Text(
          error,
          style: const TextStyle(fontSize: 16),
        )),
      ],
    );
  }
}

class _ContactListItem extends StatelessWidget {
  final NumberModel contact;

  const _ContactListItem({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(contact.image),
      title: Text(contact.name),
      onTap: () {
        // context.pushRoute(
        //   PdfRoute(
        //     path: document.path,
        //     title: document.fileName,
        //   ),
        // );
      },
      tileColor: Colors.white,
    );
  }
}
