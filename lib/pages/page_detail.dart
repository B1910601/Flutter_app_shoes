import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/products.dart';
import 'package:myshop/cart/cart.dart';
import './home_page.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail(
    this.product, {
    super.key,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Image.asset(
                product.image,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '\$${product.price}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              width: double.infinity,
              child: Text(
                product.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(90),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    final cart = context.read<Cart>();
                    cart.themvaogiohang(product);
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Đã thêm vào giỏ hàng',
                          ),
                          duration: const Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'Hoàn tác',
                            onPressed: () {
                              cart.removeSingleItem(product.id!);
                            },
                          ),
                        ),
                      );
                  },
                ),
                Text(
                  'Add to Cart',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
