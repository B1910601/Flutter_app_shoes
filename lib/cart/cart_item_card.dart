import 'package:flutter/material.dart';
import 'package:myshop/cart/cart.dart';
import 'package:provider/provider.dart';
import '../../models/cart.dart';

class CartItemCard extends StatelessWidget {
  final String productId;
  final CartItem cartItem;
  const CartItemCard({
    required this.productId,
    required this.cartItem,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showConfirmDialog(
          context,
          'Bạn có muốn xóa sản phẩm khỏi giỏ hàng?',
        );
      },
      onDismissed: (direction) {
        context.read<Cart>().removeItem(productId);
      },
      child: buildItemCard(),
    );
  }

  Widget buildItemCard() {
    return Card(
      margin: const EdgeInsets.symmetric(
        //left = right = horizontal
        //top = bottom = vertical
        horizontal: 15,
        vertical: 15,
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: GestureDetector(
              child: Image.asset(
                cartItem.image,
                fit: BoxFit.cover,
                width: 160,
              ),
            ),
          ),
          title: Text(cartItem.title),
          subtitle: Text('Total:\$${cartItem.price * cartItem.quantity}'),
          trailing: Text('\$${cartItem.quantity} x'),
        ),
      ),
    );
  }

  Future<bool?> showConfirmDialog(BuildContext context, String message) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Are you sure?'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(ctx).pop(false);
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(ctx).pop(true);
            },
          ),
        ],
      ),
    );
  }
}
