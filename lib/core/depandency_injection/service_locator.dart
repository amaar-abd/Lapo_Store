import 'package:get_it/get_it.dart';
import 'package:lapo_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:lapo_app/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:lapo_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:lapo_app/features/auth/domain/repo/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt getIt = GetIt.instance;

void getItInit()  {
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(supabaseClient: getIt.get<SupabaseClient>()),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRemoteDataSource: getIt.get<AuthRemoteDataSource>()),
  );
}
