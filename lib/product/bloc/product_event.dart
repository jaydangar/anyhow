part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class FetchPhotosByKeyword extends ProductEvent {
  final String keyword;

  FetchPhotosByKeyword({@required this.keyword});

  @override
  List<Object> get props => [this.keyword];
}
