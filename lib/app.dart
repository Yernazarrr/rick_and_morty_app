import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_settings_controller.dart';
import 'core/theme/app_theme.dart';
import 'features/settings/presentation/controller/profile_controller.dart';
import 'l10n/app_localizations.dart';

/// Корень приложения. Предоставляет контроллеры темы/локали и профиля
/// через `provider` и подключает экземпляр go_router.
class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: getIt<AppSettingsController>()),
        ChangeNotifierProvider.value(value: getIt<ProfileController>()),
      ],
      child: Consumer<AppSettingsController>(
        builder: (context, settings, _) {
          return MaterialApp.router(
            title: 'Rick & Morty',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: settings.themeMode,
            locale: settings.locale,
            routerConfig: AppRouter.router,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
