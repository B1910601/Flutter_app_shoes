import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myshop/cart/cart.dart';
import './cart_item_card.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng của bạn'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          Expanded(
            child: buildCartDetails(cart),
          ),
          Padding(
            padding: EdgeInsets.all(150),
          ),
          Expanded(
            child: buildCartSummary(cart, context),
          )
        ],
      ),
    );
  }

  Widget buildCartDetails(Cart cart) {
    return ListView(
      children: cart.productEntries
          .map(
            (entry) => CartItemCard(
              productId: entry.key,
              cartItem: entry.value,
            ),
          )
          .toList(), //được sử dụng để chuyển đổi danh sách các CartItemCard thành một danh sách các Widget mà ListView có thể hiển thị
    );
  }

  Widget buildCartSummary(Cart cart, BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            const Text(
              'Tổng:',
              style: TextStyle(fontSize: 20),
            ),
            //Spacer tạo ra một khoảng không gian trống
            const Spacer(),
            Chip(
              label: Text(
                '\$${cart.totalAmount}',
                style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.titleLarge?.color,
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
            ),
            ElevatedButton(
              child: Text('Đặt hàng'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Xác nhận đặt hàng'),
                      content: Text('Bạn có chắc chắn muốn đặt hàng?'),
                      actions: [
                        TextButton(
                          child: Text('Huỷ bỏ'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Đặt hàng'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            cart.clear();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
