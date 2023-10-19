import 'package:alibaba_clone/model/sales.dart';
import 'package:alibaba_clone/presentation/admin_features/services/admin_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnalyticPage extends ConsumerStatefulWidget {
  static const String routeName = '/analytics-page';
  const AnalyticPage({ Key? key }) : super(key: key);

  @override
  ConsumerState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends ConsumerState<AnalyticPage> {
  final AdminServices adminServices = AdminServices();
  List<Sales>? earnings;
  int? totalSales;

  @override
  void initState() {
    super.initState();
    fetchEarnings();
  }

  fetchEarnings() async {
    var earningData = await adminServices.fetchProductAnalytics(ref: ref, context: context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null  || totalSales == null ?
    const Center(child: CircularProgressIndicator(),) : 
    Column(
      children: [
        Text('\$$totalSales', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        const SizedBox(
          height: 250,
          child: Text('Chart')
        )
      ],
    );
  }
}