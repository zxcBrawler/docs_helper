import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:docs_helper/core/custom_widgets/basic_icon_button.dart';
import 'package:docs_helper/core/routes/app_router.dart';
import 'package:docs_helper/di/service.dart';
import 'package:docs_helper/feature/presentation/bloc/file/file_bloc.dart';
import 'package:docs_helper/feature/presentation/bloc/file/file_event.dart';
import 'package:docs_helper/feature/presentation/bloc/file/file_state.dart';
import 'package:docs_helper/feature/presentation/widget/new_document_screen/main_content_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NewDocumentScreen extends StatelessWidget {
  const NewDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => service<FileBloc>(),
      child: const _NewDocumentView(),
    );
  }
}

class _NewDocumentView extends StatelessWidget {
  const _NewDocumentView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackground,
      body: Padding(
        padding: AppConstants.defaultOuterPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BasicIconButton(
                  icon: const Icon(LucideIcons.chevronLeft),
                  onPressed: () => router.pop(),
                ),
                BlocBuilder<FileBloc, FileState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<FileBloc>().add(const PickFolderEvent());
                      },
                      child: const Text(
                        'Pick Folder',
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocConsumer<FileBloc, FileState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      switch (state) {
                        case FileLoading _:
                          return const Center(
                              child: CircularProgressIndicator(
                            color: AppColor.mainAccentColor,
                          ));
                        case DirectoryTreeBuildDone _:
                          return buildMainContentArea(state, context);
                        case FileError _:
                          return const Center(
                            child: Text('Folder is not picked',
                                style: TextStyle(fontSize: 20)),
                          );
                        default:
                          return const Center(
                            child: Text('Select a folder to export to Word',
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                          );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
