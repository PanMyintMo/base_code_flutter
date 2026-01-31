import 'package:base_code_flutter/core/errors/error_handler.dart';
import 'package:base_code_flutter/features/user/data/datassources/remotedatasource/auth_remote_datasource.dart';
import 'package:base_code_flutter/features/user/domain/entities/auth_entity.dart';
import 'package:base_code_flutter/features/user/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);
  
  @override
  void saveLogin(LoginEntity entity) {
   
  }

  @override
  Future<LoginEntity> userLogin({required String phone, required String password}) async{

  var result = await  authRemoteDataSource.userLogin(phone, password);

  if(result.data?.code == 0 && result.data?.info != null) {
    return result.data!.info!.firstOrNull!.toEntity();
  }
  else{
    throw ErrorHandler.otherException(result.data?.msg);
  }
  }
}