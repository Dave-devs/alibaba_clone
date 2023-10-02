import 'package:alibaba_clone/constants/palette.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class SelectProductImage extends StatefulWidget {
  const SelectProductImage({Key? key}) : super(key: key);

  @override
  State createState() => _SelectProductImageState();
}

class _SelectProductImageState extends State<SelectProductImage> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: flexSchemeLight.primaryContainer,
      borderType: BorderType.RRect,
      radius: const Radius.circular(10),
      dashPattern: const [10, 4],
      strokeCap: StrokeCap.round,
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.folder_open, size: 40),
            const SizedBox(height: 15),
            Text(
              'Select Product Images',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
