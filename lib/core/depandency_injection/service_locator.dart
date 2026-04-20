import 'package:get_it/get_it.dart';
import 'package:lapo_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:lapo_app/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:lapo_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:lapo_app/features/auth/domain/repo/auth_repo.dart';
import 'package:lapo_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt sl = GetIt.instance;

void getItInit() {
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(supabaseClient: sl.get<SupabaseClient>()),
  );
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRemoteDataSource: sl.get<AuthRemoteDataSource>()),
  );
  sl.registerLazySingleton(() => AuthCubit(sl.get<AuthRepo>()));
}
