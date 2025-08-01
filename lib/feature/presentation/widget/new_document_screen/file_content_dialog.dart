import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/di/service.dart';
import 'package:docs_helper/feature/presentation/bloc/clipboard/clipboard_bloc.dart';
import 'package:docs_helper/feature/presentation/bloc/clipboard/clipboard_event.dart';
import 'package:docs_helper/feature/presentation/bloc/clipboard/clipboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FileContentDialog extends StatelessWidget {
  final String fileName;
  final String content;
  final String extension;
  const FileContentDialog(
      {super.key,
      required this.fileName,
      required this.content,
      required this.extension});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => service<ClipboardBloc>(),
      child: AlertDialog(
        title: Text(
          fileName,
        ),
        content: ClipRRect(
          borderRadius: AppConstants.deaultElementBorderRadius,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            child: SingleChildScrollView(
              child: HighlightView(
                content,
                language: AppConstants.getLanguageFromExtension(extension),
                theme: Theme.of(context).brightness == Brightness.dark
                    ? atomOneDarkTheme
                    : atomOneLightTheme,
                padding: const EdgeInsets.all(12),
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'RobotoMono',
                ),
              ),
            ),
          ),
        ),
        actions: [
          BlocConsumer<ClipboardBloc, ClipboardState>(
            listener: (context, state) {},
            builder: (context, state) {
              return SizedBox(
                height: 40,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: state is ClipboardCopied
                      ? Text(
                          'Copied to clipboard!',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontSize: 16,
                          ),
                        )
                      : IconButton(
                          icon: const Icon(LucideIcons.copy),
                          onPressed: () {
                            context.read<ClipboardBloc>().add(
                                  CopyToClipboard(content),
                                );
                          },
                        ),
                ),
              );
            },
          ),
          TextButton(
            child: const Text(
              'Close',
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
