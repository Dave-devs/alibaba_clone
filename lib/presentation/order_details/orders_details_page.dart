import 'package:alibaba_clone/constants/widget/reusable_button.dart';
import 'package:alibaba_clone/model/order_model.dart';
import 'package:alibaba_clone/presentation/admin_features/services/admin_services.dart';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:alibaba_clone/presentation/home/widget/appbar_widget.dart';
import 'package:alibaba_clone/presentation/search/search_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'widgets/view_order_deatals.dart';

class OrdersDetailsPage extends ConsumerStatefulWidget {
  static const String routeName = '/order-details';
  final Order orders;
  const OrdersDetailsPage(this.orders, {Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _OrdersDetailsPageState();
}

class _OrdersDetailsPageState extends ConsumerState<OrdersDetailsPage> {
  int currentStep = 0;
  final AdminServices adminServices = AdminServices();

  navigateToSearchPage(String query) {
    Navigator.pushNamed(context, SearchPage(searchQuery: query) as String,
        arguments: query);
  }

  //!!! ONLY FOR ADMIN !!!
  changeOrderStatus(int status) {
    adminServices.changeOrderStatus(
      ref: ref,
      context: context,
      status: status+1,
      order: widget.orders,
      onSuccess:() {
        setState(() {
          currentStep += 1;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    currentStep = widget.orders.status;
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userChangedNotifierProvider).user;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: HomeAppBar(
              onFieldSubmitted: navigateToSearchPage,
              onPressed: () {
                //This is for Icon click
              },
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              purchaseDetails(),
              orderDetailTexts(
                orderDate:
                    'Order Date: ${DateFormat().format(DateTime.fromMillisecondsSinceEpoch(widget.orders.orderAt))}',
                orderId: 'Order Id: ${widget.orders.id}',
                orderTotal: 'Order Total: \$${widget.orders.orderTotal}',
              ),
              const SizedBox(
                height: 10,
              ),
              purchaseDetails(),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < widget.orders.products.length; i++)
                      purchaseDetailTexts(
                        src: widget.orders.products[i].images[0],
                        productName: widget.orders.products[i].productName,
                        quantity: 'Qty: ${widget.orders.quantity[i]}',
                      )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              tracking(),
              trackingSteps(
                controlsBuilder: (context, details) {
                  if(user.type == 'admin') {
                    return ReusableButton(
                      text: 'Done',
                      onPressed:() => changeOrderStatus(details.currentStep),
                    );
                  }
                  return const SizedBox();
                },
                currentStep: currentStep,
                isActiveStep1: currentStep > 0,
                state1: currentStep > 0 ? StepState.complete : StepState.indexed,
                isActiveStep2: currentStep > 1,
                state2: currentStep > 1 ? StepState.complete : StepState.indexed,
                isActiveStep3: currentStep > 2,
                state3: currentStep > 2 ? StepState.complete : StepState.indexed,
                isActiveStep4: currentStep >= 3,
                state4: currentStep >= 3 ? StepState.complete : StepState.indexed,
              )
            ],
          ),
        ));
  }
}
