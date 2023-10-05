import 'dart:io';
import 'package:file_picker/file_picker.dart';

Future<List<File>> filePicker() async {
  List<File> images = [];

  try {
    FilePickerResult? files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true
    );

    if(files != null && files.files.isNotEmpty) {
      images = files.paths.map((path) => File(path!)).toList();
      // for(int i = 0; i < files.files.length; i++) {
      //   images.add(File(files.files[i].path!));
      // }
    }
    
  } catch (e) {
    throw Exception(e.toString());
  }
  return images;
}
