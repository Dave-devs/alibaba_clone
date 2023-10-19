import 'package:flutter/material.dart';

Widget viewOrdersDetails() {
  return const Text(
    'View Order Details',
    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  );
}

Widget orderDetailTexts({
  required String orderDate,
  required String orderId,
  required String orderTotal,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          orderDate,
        ),
        Text(
          orderId,
        ),
        Text(orderTotal)
      ],
    ),
  );
}

Widget purchaseDetails() {
  return const Text(
    'Purchase Details',
    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  );
}

Widget purchaseDetailTexts({
  required String src,
  required String productName,
  required String quantity
}) {
  return Row(
    children: [
      Image.network(
        src,
        height: 120,
        width: 120,
        fit: BoxFit.contain,
      ),
      const SizedBox(height: 10,),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(quantity),
          ]
        )
      )
    ],
  );
}

Widget tracking() {
  return const Text(
    'Tracking',
    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  );
}

Widget trackingSteps({
  required int currentStep,
  required bool isActiveStep1,
  required bool isActiveStep2,
  required bool isActiveStep3,
  required bool isActiveStep4,
  required StepState state1,
  required StepState state2,
  required StepState state3,
  required StepState state4,
  required Widget Function(BuildContext, ControlsDetails)? controlsBuilder
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
    child: Stepper(
      currentStep: currentStep,
      controlsBuilder: controlsBuilder,
      steps: [
        Step(
          title: const Text('Pending'),
          content: const Text('Your order is yet to be delivered!'),
          isActive: isActiveStep1,
          state: state1
        ),
        Step(
          title: const Text('Completed'),
          content: const Text("Your order has been delivered. You're yet to sign!"),
          isActive: isActiveStep2,
        ),
        Step(
          title: const Text('Recieved'), 
          content: const Text('Your order has been delivered and signed!'),
          isActive: isActiveStep3,
        ),
        Step(
          title: const Text('Delivered'), 
          content: const Text('Your order has been delivered and signed!'),
          isActive: isActiveStep4,
        )
      ],
    )
  );
}
