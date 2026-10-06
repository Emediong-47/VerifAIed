import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/repositories/document_capture_repository.dart';
import 'package:verif_aled/features/verification/infrastructure/capture_store.dart';

@LazySingleton(as: DocumentCaptureRepository)
class ImagePickerDocumentCaptureRepository
    implements DocumentCaptureRepository {
  ImagePickerDocumentCaptureRepository(this._picker, this._captures);

  final ImagePicker _picker;
  final CaptureStore _captures;

  @override
  Future<Result<DocumentImage>> captureFromCamera() async {
    try {
      final file = await _picker.pickImage(source: ImageSource.camera);
      if (file == null) return const Err(CaptureCancelled());
      return Ok(
        await _captures.keep(
          DocumentImage(path: file.path),
          CaptureKind.document,
        ),
      );
    } catch (e) {
      return Err(CaptureFailure(e.toString()));
    }
  }
}
