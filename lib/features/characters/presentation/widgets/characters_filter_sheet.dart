import 'package:flutter/material.dart';

import '../../../../core/utils/extensions.dart';
import '../../domain/entities/character_enums.dart';
import 'character_display.dart';

/// Результат, возвращаемый нижним листом фильтров.
class CharacterFilterResult {
  const CharacterFilterResult({this.status, this.gender, this.reset = false});
  final CharacterStatus? status;
  final CharacterGender? gender;
  final bool reset;
}

/// Нижний лист для фильтрации персонажей по статусу и полу.
class CharactersFilterSheet extends StatefulWidget {
  const CharactersFilterSheet({
    super.key,
    this.initialStatus,
    this.initialGender,
  });

  final CharacterStatus? initialStatus;
  final CharacterGender? initialGender;

  static Future<CharacterFilterResult?> show(
    BuildContext context, {
    CharacterStatus? status,
    CharacterGender? gender,
  }) {
    return showModalBottomSheet<CharacterFilterResult>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => CharactersFilterSheet(
        initialStatus: status,
        initialGender: gender,
      ),
    );
  }

  @override
  State<CharactersFilterSheet> createState() => _CharactersFilterSheetState();
}

class _CharactersFilterSheetState extends State<CharactersFilterSheet> {
  CharacterStatus? _status;
  CharacterGender? _gender;

  @override
  void initState() {
    super.initState();
    _status = widget.initialStatus;
    _gender = widget.initialGender;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 8,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.filterTitle, style: context.textTheme.titleLarge),
          const SizedBox(height: 20),
          Text(l10n.filterStatus, style: context.textTheme.labelSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: CharacterStatus.values
                .map((s) => ChoiceChip(
                      label: Text(s.label(l10n)),
                      selected: _status == s,
                      onSelected: (v) =>
                          setState(() => _status = v ? s : null),
                    ))
                .toList(),
          ),
          const SizedBox(height: 20),
          Text(l10n.filterGender, style: context.textTheme.labelSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: CharacterGender.values
                .map((g) => ChoiceChip(
                      label: Text(g.label(l10n)),
                      selected: _gender == g,
                      onSelected: (v) =>
                          setState(() => _gender = v ? g : null),
                    ))
                .toList(),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(
                    const CharacterFilterResult(reset: true),
                  ),
                  child: Text(l10n.filterReset),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pop(
                    CharacterFilterResult(status: _status, gender: _gender),
                  ),
                  child: Text(l10n.filterApply),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
