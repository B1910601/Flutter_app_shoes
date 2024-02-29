import 'package:flutter/widgets.dart';

import '../../models/products.dart';
import '../../models/cart.dart';
import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  void themvaogiohang(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (existingCartItem) => existingCartItem.copyWith(
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id!,
        () => CartItem(
          id: 'c${DateTime.now().toIso8601String()}',
          title: product.title,
          price: product.price,
          image: product.image,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

//được sử dụng để giảm số lượng của một sản phẩm trong giỏ hàng đi một đơn vị.
  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    //được sử dụng để giảm số lượng của một sản phẩm trong giỏ hàng đi một đơn vị.
    //Nếu số lượng sản phẩm trong giỏ hàng bằng 1, thì sản phẩm sẽ được xóa khỏi giỏ hàng.
    if (_items[productId]?.quantity as num > 1) {
      _items.update(
        productId,
        (existingCartItem) => existingCartItem.copyWith(
          quantity: existingCartItem.quantity - 1,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  int get productCount {
    return _items.length;
  }

  List<CartItem> get products {
    return _items.values.toList();
  }

//Phương thức productEntries trả về một Iterable chứa các cặp khóa/giá trị của _items,
//trong đó mỗi khóa là một chuỗi đại diện cho productId và giá trị tương ứng là một đối tượng CartItem đại diện cho sản phẩm.
  Iterable<MapEntry<String, CartItem>> get productEntries {
    return {..._items}.entries;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }
}
