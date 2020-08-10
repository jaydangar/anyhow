import 'dart:async';

import 'package:AnyHow/product/reponse/fetch_photo_reponse.dart';
import 'package:AnyHow/utils/api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    yield ProductFetching();
    if (event is FetchPhotosByKeyword) {
      try {
        Future<FetchPhotoResponse> response =
            ApiProvider.fetchPhotoByKeyword(event.keyword);
        yield ProductFetched(photoResponse: response);
      } catch (e) {
        yield ProductFetchFailed(errorMessage: 'Unexpected error occurred...');
      }
    }
  }
}
