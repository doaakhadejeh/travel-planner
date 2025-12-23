import 'package:dartz/dartz.dart';
import 'package:travel_planner/core/network/api_crud.dart';
import 'package:travel_planner/core/network/api_error_model.dart';
import 'package:travel_planner/core/network/api_link.dart';
import 'package:travel_planner/feature/favourite/data/model/favouritemodel.dart';

class Favouritedata {
  final Crud crud;
  Favouritedata(this.crud);

  Future<Either<Failure, List<FavouriteResponse>>> myFavourite() async {
    var response = await crud.getData(ApiLink.myFavorites);
    return response.fold(
      (l) => Left(l),
      (r) =>
          Right((r as List).map((x) => FavouriteResponse.fromJson(x)).toList()),
    );
  }

  Future<Either<Failure, Unit>> removeFavourite(int tripId) async {
    var response = await crud.deleteData(ApiLink.removeFavorite(tripId));
    return response.fold((l) => Left(l), (r) => Right(unit));
  }

  Future<Either<Failure, List<FavouriteResponse>>> isFavourite(
    int tripId,
  ) async {
    final response = await crud.getData(ApiLink.isFavorite(tripId));
    return response.fold(
      (l) => Left(l),
      (r) =>
          Right((r as List).map((x) => FavouriteResponse.fromJson(x)).toList()),
    );
  }

  Future<Either<Failure, Unit>> addFavourite(int tripId) async {
    var response = await crud.postData(ApiLink.addFavorite(tripId), {});
    return response.fold((l) => Left(l), (r) => Right(unit));
  }
}
