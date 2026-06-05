import 'package:flutter/material.dart';

import '../../../../core/utils/extensions.dart';
import '../../domain/entities/user_profile.dart';

/// Простой диалог для редактирования имени и никнейма локального профиля.
class EditProfileDialog extends StatefulWidget {
  const EditProfileDialog({super.key, required this.profile});
  final UserProfile profile;

  static Future<UserProfile?> show(BuildContext context, UserProfile profile) {
    return showDialog<UserProfile>(
      context: context,
      builder: (_) => EditProfileDialog(profile: profile),
    );
  }

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  late final TextEditingController _name =
      TextEditingController(text: widget.profile.name);
  late final TextEditingController _nickname =
      TextEditingController(text: widget.profile.nickname);

  @override
  void dispose() {
    _name.dispose();
    _nickname.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.settingsEdit),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _name,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _nickname,
            decoration: const InputDecoration(labelText: 'Nickname'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(
            widget.profile.copyWith(
              name: _name.text.trim(),
              nickname: _nickname.text.trim(),
            ),
          ),
          child: Text(context.l10n.filterApply),
        ),
      ],
    );
  }
}
