import 'package:AnyHow/product/bloc/product_bloc.dart';
import 'package:AnyHow/product/reponse/fetch_photo_reponse.dart';
import 'package:AnyHow/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(4),
            alignment: Alignment.centerLeft,
            child: TextField(
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.orangeAccent)),
                hintText: 'Search product',
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.orangeAccent,
                ),
              ),
              onSubmitted: (value) {
                if (value.length > 0 && value != null) {
                  BlocProvider.of<ProductBloc>(context)
                      .add(FetchPhotosByKeyword(keyword: value));
                }
              },
            )),
        BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductFetched) {
              Future<FetchPhotoResponse> futureResponse = state.photoResponse;
              return FutureBuilder(
                future: futureResponse,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    FetchPhotoResponse response = snapshot.data;
                    return GridView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: response.photos.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(2),
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.width * 0.2,
                          child: Container(
                            child: Image.network(
                                response.photos.elementAt(index).src.medium,
                                fit: BoxFit.fill),
                          ),
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              );
            } else if (state is ProductFetchFailed) {
              return CustomErrorWidget();
            } else if (state is ProductFetching) {
              return Container(
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        child: CircularProgressIndicator(),
                        width: 50,
                        height: 50,
                      ),
                      Container(child: Text('Fetching Photos...')),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        )
      ],
    );
  }
}
