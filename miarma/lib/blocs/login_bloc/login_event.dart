import 'package:equatable/equatable.dart';
import 'package:miarma_network/models/login_response.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class DoLoginEvent extends LoginEvent {
  final LoginDto loginDto;

  const DoLoginEvent(this.loginDto);
}