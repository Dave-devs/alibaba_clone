import 'package:alibaba_clone/constants/utils/snackbar.dart';
import 'package:alibaba_clone/constants/widget/reusable_textfield.dart';
import 'package:alibaba_clone/presentation/address/widgets/address_pane.dart';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:alibaba_clone/services/address_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay/pay.dart';

class AddressPage extends ConsumerStatefulWidget {
  static const String routeName = '/address-page';
  final String totalAmount;
  const AddressPage({ Key? key, required this.totalAmount, }) : super(key: key);

  @override
  ConsumerState createState() => _AddressPageState();
}

class _AddressPageState extends ConsumerState<AddressPage> {
  final _addressFormKey = GlobalKey<FormState>();
  final TextEditingController houseCont = TextEditingController();
  final TextEditingController areaCont = TextEditingController();
  final TextEditingController pinCont= TextEditingController();
  final TextEditingController townCont = TextEditingController();
  List<PaymentItem> paymentItems = [];
  String addressToUsed = '';
  final AddressServices addressServices = AddressServices();

  onGooglePayResult(paymentResult) {
    if(ref.read(userChangedNotifierProvider).user.address.isEmpty) {
      addressServices.storeUserAddress(
        context: context, 
        ref: ref,
        address: addressToUsed
      );
    }
    addressServices.placeAnOrder(
      ref: ref,
      context: context,
      totalSum: double.parse(widget.totalAmount),
      address: addressToUsed
    );
  }
  onApplePayResult(paymentResult) {
    if(ref.read(userChangedNotifierProvider).user.address.isEmpty) {
      addressServices.storeUserAddress(
        context: context, 
        ref: ref,
        address: addressToUsed
      );
    }
    addressServices.placeAnOrder(
      ref: ref,
      context: context,
      totalSum: double.parse(widget.totalAmount),
      address: addressToUsed
    );
  }

  void onPayPressed(String addressFormProvider) {
    addressToUsed = '';

    bool isFormFilled = houseCont.text.isNotEmpty ||
    areaCont.text.isNotEmpty || 
    pinCont.text.isNotEmpty || 
    townCont.text.isNotEmpty;

    if(isFormFilled) {
      if(_addressFormKey.currentState!.validate()) {
        //Interpolated the address text
        addressToUsed = '${houseCont.text}, ${areaCont.text}, ${townCont.text} - ${pinCont.text}';
      } else {
        throw Exception('Please input all form values!');
      }
    } else if (addressFormProvider.isNotEmpty) {
      addressToUsed = addressFormProvider;
    } else {
      flutterToast('Error!');
    }
  }

  @override
  void initState() {
    super.initState();
    paymentItems.add(
      PaymentItem(
        amount: widget.totalAmount,
        label: 'Total Amount',
        status: PaymentItemStatus.final_price
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    houseCont.dispose();
    areaCont.dispose();
    pinCont.dispose();
    townCont.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //This is addressFormProvider by default
    final address = ref.watch(userChangedNotifierProvider).user.address;
    return Scaffold(
      appBar: AppBar(),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              if(address.isNotEmpty) 
              addressPane(address),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    ReusableTextfield(
                      controller: houseCont,
                      hintText: 'Flat, House no, Building',
                      obscureText: false,
                      maxLines: 1,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                      hintStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w200),
                    ),
        
                    SizedBox(height: 5.h,),
        
                    ReusableTextfield(
                      controller: areaCont,
                      hintText: 'Area, Street',
                      obscureText: false,
                      maxLines: 1,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                      hintStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w200),
                    ),
        
                    SizedBox(height: 5.h,),
        
                    ReusableTextfield(
                      controller: pinCont,
                      hintText: 'Pincode',
                      obscureText: false,
                      maxLines: 1,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                      hintStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w200),
                    ),
        
                    SizedBox(height: 5.h,),
        
                    ReusableTextfield(
                      controller: townCont,
                      hintText: 'Town/City',
                      obscureText: false,
                      maxLines: 1,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                      hintStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w200),
                    ),
                  ],
                )
              ),

              SizedBox(height: 10.h,),

              ApplePayButton(
                onPressed: () => onPayPressed(address),
                margin: const EdgeInsets.only(top: 15),
                width: double.infinity,
                height: 50,
                style: ApplePayButtonStyle.whiteOutline,
                type: ApplePayButtonType.buy,
                paymentConfiguration: PaymentConfiguration.fromJsonString('applepay.json'),
                onPaymentResult: onApplePayResult,
                paymentItems: paymentItems
              ),

              SizedBox(height: 10.h,),

              GooglePayButton(
                onPressed:() => onPayPressed(address),
                paymentConfiguration: PaymentConfiguration.fromJsonString('gpay.json'),
                margin: const EdgeInsets.only(top: 15),
                width: double.infinity,
                height: 50,
                type: GooglePayButtonType.buy,
                onPaymentResult: onGooglePayResult,
                paymentItems: paymentItems,
                loadingIndicator: const Center(child: CircularProgressIndicator(),)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//9:20