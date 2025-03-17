import 'package:flutter/material.dart';
import 'package:shop/pages/dop_info_product_page/widgets/buy_dialog.dart';
import 'package:shop/repository/models/product_model.dart';

class DopInfoProductsPage extends StatefulWidget {
  const DopInfoProductsPage({super.key, required this.product});

  final ProductModel product;

  @override
  State<DopInfoProductsPage> createState() => _DopInfoProductsPageState();
}

class _DopInfoProductsPageState extends State<DopInfoProductsPage> {
  final TextEditingController controllerNumberCard = TextEditingController();
  final TextEditingController controllerDateCard = TextEditingController();
  final TextEditingController controllerCvvCard = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'detail of product',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 366,
          height: 700,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 325,
                  height: 300,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFD8A500),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.network(widget.product.image),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.product.title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${widget.product.price}\$',
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.product.description,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                          child: BuyDialog(
                        products: widget.product,
                        controllerCvvCard: controllerCvvCard,
                        controllerDateCard: controllerDateCard,
                        controllerNumberCard: controllerNumberCard,
                      ));
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD8A500),
                  minimumSize: const Size(322, 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: const Text(
                  'Buy',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
