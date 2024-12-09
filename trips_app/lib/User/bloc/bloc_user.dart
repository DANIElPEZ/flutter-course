import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/User/repository/auth_repository.dart';

class UserBloc implements Bloc{
  final _authRepository=AuthRepository();

  Future<UserCredential?> signIn() async{
    return _authRepository.singInFirebase();
  }

  @override
  void dispose() {}
}