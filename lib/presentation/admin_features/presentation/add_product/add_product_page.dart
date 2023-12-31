import 'dart:io';
import 'package:alibaba_clone/presentation/admin_features/services/admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alibaba_clone/constants/utils/file_picker.dart';
import 'package:alibaba_clone/constants/widget/reusable_button.dart';
import 'package:alibaba_clone/constants/widget/reusable_textfield.dart';
import 'package:alibaba_clone/presentation/admin_features/presentation/add_product/widget/select_product_image.dart';

class AddProductPage extends ConsumerStatefulWidget {
  static const String routeName = '/add_product_page';
  const AddProductPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _AddProductPageState();
}

class _AddProductPageState extends ConsumerState<AddProductPage> {
  final AdminServices _adminServices = AdminServices();
  final _addProductInFormKey = GlobalKey<FormState>();
  final TextEditingController _productNameCont = TextEditingController();
  final TextEditingController _descriptionCont = TextEditingController();
  final TextEditingController _priceCont = TextEditingController();
  final TextEditingController _quantityCont = TextEditingController();
  List<File> images = [];
  String defaultCategory = 'Fashion & Wears';
  List<String> categoriesList = [
    'Fashion & Wears',
    "Phones & Telecommunication",
    "Beauty, Health & Hair",
    "Computer, Office & Security",
    "Jwwelry & Watches",
    "Home, Pets & Appliances",
    "Bags & Shoes"
  ];

  onCateChanged(String? newValue) {
    setState(() {
      defaultCategory = newValue!;
    });
  }

  selectProduct() async {
    var res = await filePicker();
    setState(() {
      images = res;
    });
  }

  onSellProduct() {
    if (_addProductInFormKey.currentState!.validate() && images.isNotEmpty) {
      _adminServices.sellProducts(
        context: context,
        ref: ref,
        productName: _productNameCont.text,
        description: _descriptionCont.text,
        category: defaultCategory,
        quantity: double.parse(_quantityCont.text),
        price: double.parse(_priceCont.text),
        images: images
      );
    }
  }
  
  @override
  void dispose() {
    super.dispose();
    _productNameCont.dispose();
    _descriptionCont.dispose();
    _priceCont.dispose();
    _quantityCont.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Product Page',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Form(
          key: _addProductInFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w).copyWith(top: 10.h),
            child: Column(
              children: [
                images.isNotEmpty ?
                CarouselSlider(
                        items: images.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      ) :
                SelectProductImage(selectProductImage: selectProduct),

                SizedBox(height: 30.h,),

                //Product Name TextFiled
                ReusableTextfield(
                  controller: _productNameCont,
                  hintText: 'Product Name',
                  obscureText: false,
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
                  filled: false,
                ),

                SizedBox(height: 10.h,),

                //Description TextFiled
                ReusableTextfield(
                  controller: _descriptionCont,
                  hintText: 'Description',
                  maxLines: 7,
                  obscureText: false,
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
                  filled: false,
                ),

                SizedBox(height: 10.h,),

                //Price TextFiled
                ReusableTextfield(
                  controller: _priceCont,
                  hintText: 'Price',
                  obscureText: false,
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
                  filled: false,
                ),

                SizedBox(height: 10.h,),

                //Quantity TextFiled
                ReusableTextfield(
                  controller: _quantityCont,
                  hintText: 'Quantity',
                  obscureText: false,
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
                  filled: false,
                ),
                
                SizedBox(height: 10.h,),

                //Add This dropdown next
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    value: defaultCategory,
                    items: categoriesList.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: onCateChanged
                  )
                ),
                
                SizedBox(height: 10.h,),
                
                //Sell Button
                ReusableButton(
                  text: 'Sell',
                  onPressed: onSellProduct,
                  minimumSize: Size(375.w,50.h),
                ),

                SizedBox(height: 20.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}