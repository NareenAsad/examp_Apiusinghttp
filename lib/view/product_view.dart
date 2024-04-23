import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:examp_api_using_http/models/product.model.dart';
import 'package:examp_api_using_http/view/productdetail_view.dart';
import 'package:examp_api_using_http/view/widget/productview_widget.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<ProductElement> products = [];
  String searchText = '';
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final product = Product.fromJson(jsonData);
      setState(() {
        products = product.products;
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  List<ProductElement> getFilteredProducts() {
    return products.where((product) {
      final title = product.title.toLowerCase();
      final search = searchText.toLowerCase();

      return title.contains(search);
    }).toList();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = getFilteredProducts();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Discover ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 200),
            Icon(Icons.shopping_bag_outlined),
          ],
        ),
      ),
      body: Column(
        children: [
          SearchBarWidget(
            searchText: searchText,
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
          ),
          Expanded(
            child: filteredProducts.isNotEmpty
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return ProductCard(
                        product: product,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailPage(product: product),
                            ),
                          );
                        },
                      );
                    },
                  )
                : Center(
                    child: Text(
                      'No products found',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.green,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 32,
      ),
    );
  }
}
