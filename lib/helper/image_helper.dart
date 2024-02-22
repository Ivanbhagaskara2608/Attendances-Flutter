import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  ImageHelper({ImagePicker? imagePicker, ImageCropper? imageCropper})
      : _imagePicker = imagePicker ?? ImagePicker(),
        _imageCropper = imageCropper ?? ImageCropper();

  final ImagePicker _imagePicker;
  final ImageCropper _imageCropper;

  Future<List<XFile>> pickImage(
      {ImageSource source = ImageSource.gallery,
      int imageQuality = 100}) async {
    final file = await _imagePicker.pickImage(
        source: source, imageQuality: imageQuality);
    if (file != null) return [file];
    return [];
  }

  Future<XFile?> camera(
      {ImageSource source = ImageSource.camera, int imageQuality = 100}) async {
    final file = await _imagePicker.pickImage(
        source: source, imageQuality: imageQuality);
    if (file != null) return file;
    return null;
  }

  Future<CroppedFile?> crop(
      {required XFile file, CropStyle cropStyle = CropStyle.circle}) async {
    final croppedFile = await _imageCropper
        .cropImage(cropStyle: cropStyle, sourcePath: file.path, uiSettings: [
      AndroidUiSettings(toolbarTitle: "Profile photo", hideBottomControls: true)
    ]);

    return croppedFile;
  }
}
