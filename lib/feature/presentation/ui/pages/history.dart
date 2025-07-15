import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/di/service.dart';
import 'package:docs_helper/feature/presentation/bloc/document/document_bloc.dart';
import 'package:docs_helper/feature/presentation/bloc/document/document_event.dart';
import 'package:docs_helper/feature/presentation/bloc/document/document_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppConstants.deaultElementBorderRadius,
        color: Theme.of(context).colorScheme.surface,
      ),
      child: BlocProvider(
        create: (context) =>
            service<DocumentBloc>()..add(const GetAllDocuments()),
        child: BlocBuilder<DocumentBloc, DocumentState>(
          builder: (context, state) {
            if (state is DocumentLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DocumentLoaded) {
              final documents = state.documents ?? [];
              if (documents.isEmpty) {
                return const Center(child: Text('No documents found'));
              } else {
                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(documents[index].name),
                    subtitle: Text(documents[index].exportPath),
                    trailing: Text(documents[index].totalFiles.toString()),
                  ),
                );
              }
            } else {
              return Center(child: Text(state.error ?? ''));
            }
          },
        ),
      ),
    );
  }
}
