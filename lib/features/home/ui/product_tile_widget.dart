import 'package:flutter/material.dart';
import 'package:flutter_application_7_bloc_learn/features/home/models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const ProductTileWidget({
    Key? key,
    required this.productDataModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,

          ),
          Text(productDataModel.name),
          Text(productDataModel.description),
          
        ],
      ),
    );
  }
}
