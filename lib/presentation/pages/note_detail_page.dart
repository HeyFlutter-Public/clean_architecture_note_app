import 'package:flutter/material.dart';
import 'package:note_app_clean_arch/domain/entities/note_entity.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_styles.dart';

class NoteDetailPage extends StatelessWidget {
  final NoteEntity note;

  const NoteDetailPage({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.date.toString(),
              style: AppStyles.date.copyWith(
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              note.title,
              style: AppStyles.noteTitle
                  .copyWith(color: Colors.white.withOpacity(0.7), fontSize: 32),
            ),
            const SizedBox(height: 24),
            Text(
              note.text,
              style: AppStyles.body.copyWith(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
