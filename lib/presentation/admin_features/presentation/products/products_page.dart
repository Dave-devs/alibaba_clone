import 'package:alibaba_clone/presentation/admin_features/model/product_model.dart';
import 'package:alibaba_clone/presentation/admin_features/presentation/add_product/add_product_page.dart';
import 'package:alibaba_clone/presentation/admin_features/services/admin_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Issue => Needs to select multiple images ten save. in filePicker method
class ProductsPage extends ConsumerStatefulWidget {
  static const String routeName = '/product_page';
  const ProductsPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _ProductsPageState();
}

class _ProductsPageState extends ConsumerState<ProductsPage> {
  final AdminServices adminServices = AdminServices();
  List<ProductModel>? products;

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

   getAllProducts() async {
    products = await adminServices.getAllProducts(ref: ref, context: context);
    setState(() {});
  }

  deleteProduct(ProductModel productModel, int index) async {
    await adminServices.deleteProduct(
      ref: ref,
      context: context,
      productModel: productModel,
      onSuccess: () {
        products!.removeAt(index);
        setState(() { });
      }
    );
  }

  navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null ? 
    const Center(child: CircularProgressIndicator(),) 
    : Scaffold(
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
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        elevation: 2,
      ),

      body: GridView.builder(
        itemCount: products!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final productData = products![index];
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Container(
                      height: 180.h,
                      padding: EdgeInsets.all(15.w),
                      child: Image.network(
                        productData.images[0],
                        fit: BoxFit.fitHeight,
                        width: 180.w
                      )
                    )
                  )
                ),
                    
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        productData.productName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                        
                    IconButton(
                      onPressed: () => deleteProduct(productData, index),
                      icon: const Icon(
                        Icons.delete_outline,
                      ),
                    ),
                  ],
                ),
              ],
            );
        }
    ),
  );
  }
}