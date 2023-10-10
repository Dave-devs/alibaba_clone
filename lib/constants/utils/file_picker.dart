import 'dart:io';
import 'package:file_picker/file_picker.dart';
// import 'package:image_picker/image_picker.dart';

Future<List<File>> filePicker() async {
  List<File> images = [];
  try {
    FilePickerResult? files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    throw Exception(e.toString());
  }
  return images;
}


// Future<List<File>> pickMultipleImages() async {
//   List<File> images = [];
//   try {
//     List<XFile>? pickedFiles = await ImagePicker().pickMultiImage();
//     if (pickedFiles != null) {
//       images = pickedFiles.map((XFile file) => File(file.path)).toList();
//     }
//   } catch (e) {
//     throw Exception(e.toString());
//   }
//   return images;
// }