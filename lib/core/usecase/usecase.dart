import 'package:dartz/dartz.dart';

import '../response/response_model.dart';

abstract class Usecase<Type, Params> {
  Future<Either<ResponseModel, Type>> call(Params params);
}
