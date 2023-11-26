import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/domain/domain.dart';
import 'package:moniepoint/services/services.dart';

final _injector = GetIt.instance;

/// Service container for registering and getting services
class SC {
  SC() {
    _injector.allowReassignment = true;
    if (!_injector.isRegistered<SC>(instance: this)) {
      _injector.registerFactory<SC>(() => this);
    }
  }

  static Future<void> initialize() async {
    SC()
      ..add<SessionStorage>(
        SessionStorage(),
      )
      ..add<AppHttpClient>(
        DioHttpClient(await DioAdapter.make),
      )
      //The environment should be gotten from CLI
      ..add<Repository>(
        await RepositoryFactory.make(Env.prod, await DioAdapter.make),
      )
      ..add<AppNavigator>(AppNavigator(rootNavigatorKey));
  }

  static SC get get => _injector.get<SC>();

  T getService<T extends Object>() => _injector.get<T>();

  void add<T extends Object>(T instance,
      {ServiceScope scope = ServiceScope.factory}) {
    if (scope.isFactory) {
      _injector.registerFactory<T>(() => instance);
      return;
    }
    _injector.registerSingleton(instance);
  }

  @visibleForTesting
  void dispose() {
    _injector.reset();
  }
}

extension XSC on SC {
  SessionStorage get sessionStorage => _injector.get<SessionStorage>();
  AppHttpClient get httpClient => _injector.get<AppHttpClient>();
  AppNavigator get navigator => _injector.get<AppNavigator>();
  Repository get repository => _injector.get<Repository>();
}

class SessionStorage {
  ValueNotifier<ThemeMode> appThemeMode = ValueNotifier(ThemeMode.light);
  ValueNotifier<Duration> appAnimationDuration = ValueNotifier(
    const Duration(milliseconds: 400),
  );
}

ValueNotifier<String> tokenSession = ValueNotifier("");

enum ServiceScope {
  factory,
  singleton;

  bool get isFactory => this == ServiceScope.factory;
  bool get isSingleton => this == ServiceScope.singleton;
}
