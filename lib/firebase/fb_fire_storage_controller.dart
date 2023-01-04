import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageController {
  StorageController._();

  static StorageController storageController = StorageController._();
  FirebaseStorage storageInstance = FirebaseStorage.instance;

  Future<String> uploadImage(String folderName, File file) async {
    //1- define the reference of the file
    String path = file.path; // ننجيب اسم الصورة الي اتخزنت
    String name = path.split('/').last;
    Reference reference =
        storageInstance.ref('$folderName/ $name'); //بدو المسار كامل
    await reference.putFile(file); // مسؤولة عن رفع الملفات
    String imageUrl = await reference.getDownloadURL();
    return imageUrl;
  }
}
