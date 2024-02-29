import '../../models/products.dart';

final List<Product> _items = [
  Product(
    id: 'p1',
    title: 'Giày blackshoes',
    description: 'blackshoes giá rẻ và đẹp',
    price: 200.000,
    image: 'assets/image/blackshoes.png',
    isFavorite: true,
  ),
  Product(
    id: 'p2',
    title: 'Giày',
    description: 'Giày menshoes dành cho nam đẹp ',
    price: 150.000,
    image: 'assets/image/menshoes.png',
  ),
  Product(
    id: 'p3',
    title: 'Giày nike',
    description: 'Giày nike giá rẻ sinh viên',
    price: 350.000,
    image: 'assets/image/nikeshoes.png',
  ),
  Product(
    id: 'p4',
    title: 'Giày',
    description: 'Áo khoác dù nam, nữ mặc điều đẹp',
    price: 300.000,
    image: 'assets/image/redshoes.png',
    isFavorite: true,
  ),
  Product(
    id: 'p5',
    title: 'Giày ',
    description: 'Giày dành cho các bạn nữ',
    price: 300.000,
    image: 'assets/image/pinkshoes.png',
    isFavorite: true,
  ),
  Product(
    id: 'p6',
    title: 'Giày thể thao',
    description: 'Giày thể thao phù hợp cho cả nam và nữ',
    price: 300.000,
    image: 'assets/image/sportshoes.png',
    isFavorite: true,
  )
];

List<Product> get items {
  return [..._items];
}
