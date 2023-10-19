import 'package:flutter/material.dart';

Widget addressPane(String address) {
  return Column(
    children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(address, style: const TextStyle(fontSize:  18),),
        ),
      ),

      const SizedBox(height: 20,),

      const Text('OR', style: TextStyle(fontSize:  18,),),

      const SizedBox(height: 20,),
    ]
  );
}