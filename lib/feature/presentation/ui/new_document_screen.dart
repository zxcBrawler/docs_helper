import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:docs_helper/core/custom_widgets/basic_icon_button.dart';
import 'package:docs_helper/core/routes/app_router.dart';
import 'package:docs_helper/di/service.dart';
import 'package:docs_helper/feature/presentation/bloc/export/export_bloc.dart';
import 'package:docs_helper/feature/presentation/bloc/export/export_state.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => service<FileBloc>(),
        ),
        BlocProvider(
          create: (context) => service<ExportBloc>(),
        ),
      ],
      child: const _NewDocumentView(),
    );
  }
}

class _NewDocumentView extends StatelessWidget {
  const _NewDocumentView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                BlocSelector<ExportBloc, ExportState, bool>(
                  selector: (state) => state is ExportInProgress,
                  builder: (context, isExporting) {
                    return BlocSelector<FileBloc, FileState, bool>(
                      selector: (state) => state is FileLoading,
                      builder: (context, isLoading) {
                        return ElevatedButton(
                          onPressed: (isLoading || isExporting)
                              ? null
                              : () => context
                                  .read<FileBloc>()
                                  .add(const PickFolderEvent()),
                          child: const Text('Pick Folder'),
                        );
                      },
                    );
                  },
                )
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
                            strokeWidth: 5,
                          ));
                        case DirectoryTreeBuildDone _:
                          return buildMainContentArea(state, context);
                        case FileError _:
                          return const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                LucideIcons.xCircle,
                                color: AppColors.accentRed,
                                size: 100,
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Folder is not picked',
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          );
                        default:
                          return const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                spacing: 10,
                                children: [
                                  Icon(
                                    LucideIcons.folderClosed,
                                    color: AppColors.mainAccentColor,
                                    size: 60,
                                  ),
                                  Icon(
                                    LucideIcons.moveRight,
                                    size: 60,
                                  ),
                                  Icon(
                                    LucideIcons.fileText,
                                    size: 60,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text('Select a folder to export to PDF',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                            ],
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
