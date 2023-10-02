import 'package:alibaba_clone/presentation/admin_features/presentation/add_product/add_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsPage extends StatefulWidget {
  static const String routeName = '/product_page';
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/alibaba_group.png',
          scale: 10,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddProduct,
        label: Row(
          children: [
            const Icon(Icons.add, size: 28,),
            SizedBox(width: 2.w,),
            const Text(
              'Add Product',
              style: TextStyle(
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
        elevation: 2,
      ),
      
      body: Container(),
    );
  }
}