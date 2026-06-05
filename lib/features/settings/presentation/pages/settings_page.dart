import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_settings_controller.dart';
import '../../../../core/utils/extensions.dart';
import '../controller/profile_controller.dart';
import '../widgets/edit_profile_dialog.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          const _ProfileSection(),
          const _SectionDivider(),
          _SectionLabel(l10n.settingsAppearance),
          const _ThemeTile(),
          const _SectionDivider(),
          _SectionLabel(l10n.settingsAbout),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
            child: Text(l10n.settingsAboutText,
                style: context.textTheme.bodyLarge),
          ),
          const _SectionDivider(),
          _SectionLabel(l10n.settingsVersion),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
            child: Text('${l10n.appName}  v${AppConstants.appVersion}',
                style: context.textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProfileController>();
    final profile = controller.profile;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor:
                    Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                child: Text(
                  profile.name.isNotEmpty ? profile.name[0].toUpperCase() : '?',
                  style: context.textTheme.headlineMedium,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profile.name, style: context.textTheme.titleLarge),
                    const SizedBox(height: 2),
                    Text(profile.nickname,
                        style: context.textTheme.bodyMedium),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () async {
                final updated =
                    await EditProfileDialog.show(context, profile);
                if (updated != null && context.mounted) {
                  await context.read<ProfileController>().update(
                        name: updated.name,
                        nickname: updated.nickname,
                      );
                }
              },
              child: Text(context.l10n.settingsEdit),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeTile extends StatelessWidget {
  const _ThemeTile();

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<AppSettingsController>();
    final l10n = context.l10n;
    return SwitchListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      secondary: const Icon(Icons.palette_outlined),
      title: Text(l10n.settingsDarkTheme),
      subtitle:
          Text(settings.isDark ? l10n.settingsThemeOn : l10n.settingsThemeOff),
      value: settings.isDark,
      onChanged: (v) => context.read<AppSettingsController>().setDarkMode(v),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
        child: Text(text.toUpperCase(), style: context.textTheme.labelSmall),
      );
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider();
  @override
  Widget build(BuildContext context) =>
      const Divider(height: 24, thickness: 1);
}
