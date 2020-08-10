part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductFetching extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductFetched extends ProductState {
  final Future<FetchPhotoResponse> photoResponse;

  ProductFetched({@required this.photoResponse});

  @override
  List<Object> get props => [this.photoResponse];
}

class ProductFetchFailed extends ProductState {
  final String errorMessage;

  ProductFetchFailed({@required this.errorMessage});

  @override
  List<Object> get props => [this.errorMessage];
}
