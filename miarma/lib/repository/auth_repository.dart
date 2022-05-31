import 'package:miarma_network/models/login_response.dart';


abstract class AuthRepository {
  Future<LoginResponse> login(LoginDto loginDto);
}

