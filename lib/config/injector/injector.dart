import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'initDI',
  preferRelativeImports: true,
  asExtension: true,
)
Future<GetIt> configureDependencies({String? environment, EnvironmentFilter? environmentFilter}) async =>
    getIt.initDI(environment: environment, environmentFilter: environmentFilter);

