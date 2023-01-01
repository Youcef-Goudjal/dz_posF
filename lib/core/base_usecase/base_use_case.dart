// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';
import 'package:dz_pos/core/core.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

abstract class StreamUseCase<T, Parameters> {
  Stream<T> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object?> get props => [];
}
