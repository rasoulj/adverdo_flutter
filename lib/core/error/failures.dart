import 'package:equatable/equatable.dart';
import 'exceptions.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  final ServerException? serverException;

  const ServerFailure({this.serverException});

  @override
  List<Object> get props => [serverException?.exception?.response?.data];
}

class CacheFailure extends Failure {
  final String? message;

  const CacheFailure({this.message});

  @override
  List<Object> get props => ["$message"];
}

class InternetFailure extends ServerFailure {
  const InternetFailure();

  @override
  List<Object> get props => [];
}

class GeneralFailure extends Failure {
  final String? message;

  const GeneralFailure({this.message});

  @override
  List<Object> get props => ["$message"];
}


