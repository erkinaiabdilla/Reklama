import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();
  final storage = FirebaseStorage.instance;
  Future<List<XFile>?> pickImages() async {
    final images = await _picker.pickMultiImage(imageQuality: 5);
    return images;
  }
}
