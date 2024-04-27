import 'package:examp_api_using_http/models/product.model.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final String searchText;
  final ValueChanged<String> onChanged;

  const SearchBarWidget({
    Key? key,
    required this.searchText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(23),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Search',
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: onChanged,
          ),
          SizedBox(height: 20),
          Center(child: Image.asset('assets/1.png')),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SmallBox('All', Colors.green),
                  SizedBox(width: 20),
                  SmallBox('Smartphones', Colors.transparent),
                  SizedBox(width: 20),
                  SmallBox('Headphones', Colors.transparent),
                  SizedBox(width: 20),
                  SmallBox('Laptop', Colors.transparent),
                  SizedBox(width: 20),
                  SmallBox('Perfume', Colors.transparent),
                  SizedBox(width: 20),
                  SmallBox('Serum', Colors.transparent),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget SmallBox(String text, Color boxColor) {
  return Container(
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: boxColor,
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(
        color: Colors.black,
        width: 1.0,
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

class ProductCard extends StatelessWidget {
  final ProductElement product;
  final VoidCallback onTap;

  const ProductCard({Key? key, required this.product, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(10),
        shape: Border(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                product.thumbnail,
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Price: \$${product.price}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final double iconSize;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    this.iconSize = 28.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      iconSize: iconSize,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '',
        ),
      ],
    );
  }
}
