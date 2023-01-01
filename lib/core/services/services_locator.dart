import 'package:dz_pos/features/features.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Shared prefs

  /// Blocs
  sl.registerFactory(ApplicationBloc.new);

  /// usecases

  /// repositories

  /// data sources

  /// External
}
