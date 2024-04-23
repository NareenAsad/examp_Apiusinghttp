import 'package:examp_api_using_http/models/product.model.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductElement product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: isFavorited ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                isFavorited = !isFavorited;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  widget.product.thumbnail,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      widget.product.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 50),
                    Text(
                      '${widget.product.discountPercentage}%',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text(
                            '${widget.product.rating}',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '${widget.product.brand}',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('${widget.product.category}',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '${widget.product.stock} remain...',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: widget.product.images.map((image) {
                  return Image.network(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              Text(
                'Description:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                widget.product.description,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${widget.product.price}.00',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                      primary: Colors.green,
                    ),
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
