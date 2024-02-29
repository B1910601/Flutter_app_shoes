import 'package:flutter/material.dart';
import 'package:myshop/pages/page_detail.dart';

import '../../models/products.dart';

import './product.dart';

class ProductsGird extends StatelessWidget {
  const ProductsGird({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: items.length,
      itemBuilder: (ctx, i) => ProductTile(items[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //Nó được sử dụng để chỉ định số lượng sp ở mổi hàng
        crossAxisCount: 1,
        childAspectRatio: 1,
        //Nó được sử dụng để chỉ định số lượng pixel giữa mỗi widget con được liệt kê trong trục chéo.
        crossAxisSpacing: 20,
        //Nó được sử dụng để chỉ định số lượng pixel giữa mỗi widget con được liệt kê trong trục chính.
        mainAxisSpacing: 10,
      ),
    );
  }
}

class ProductTile extends StatefulWidget {
  const ProductTile(
    this.product, {
    super.key,
  });
  final Product product;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    // cử chỉ
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ProductDetail(widget.product),
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10, color: Colors.grey, offset: Offset(0, 10)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    widget.product.image,
                    fit: BoxFit.cover,
                    width: 150,
                  ),
                ),
                Text(
                  widget.product.title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        GridTileBar(
                          //để lắng nghe sự thay đổi của thuộc tính isFavorite của đối tượng Product.
                          leading: ValueListenableBuilder<bool>(
                            valueListenable:
                                widget.product.isFavoriteListenable,
                            builder: (ctx, isFavorite, child) {
                              return IconButton(
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                ),
                                color: Theme.of(context).colorScheme.secondary,
                                onPressed: () {
                                  widget.product.isFavorite = !isFavorite;
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
