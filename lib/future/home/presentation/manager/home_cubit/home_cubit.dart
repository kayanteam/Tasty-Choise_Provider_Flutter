import 'dart:developer';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_choise_provider/future/home/domin/home_repo.dart';
import 'package:tasty_choise_provider/future/home/models/general_response.dart';
import 'package:tasty_choise_provider/future/home/models/my_media.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;

  HomeCubit(this.repo) : super(HomeInitial());

  static HomeCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  GeneralResponse<String>? trems;

  Future getTermsOfUse() async {
    emit(LoadingData());
    (await repo.termsOfUse()).fold(
      (l) {
        emit(FailureData(l));
      },
      (r) {
        trems = r;
        emit(SuccessData(r.data ?? ""));
      },
    );
  }

  Future initHomeCubit(BuildContext context) async {
    emit(LoadingData());
    getTermsOfUse();
  }

  List<MyMedia> media = [];
  Future pickMedia() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );

    if (result != null) {
      log(result.files.single.path!);
      String? newPath;
      if (result.files.single.extension == 'mp4') {
        newPath = await getTunmp(result.files.single.path!);
      }
      media.add(MyMedia(
          file: result.files.single,
          thum: result.files.single.extension == 'mp4' ? newPath! : null));
      emit(HomeInitial());
    }
  }

  Future deleteMedia(int index) async {
    media.removeAt(index);
    emit(HomeInitial());
  }

  Future<String> getTunmp(String path) async {
    // final thumbnailFile = await VideoCompress.getFileThumbnail(path);

    final thumbnailFile = await VideoThumbnail.thumbnailFile(
      video: path,
      // thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.PNG,
      quality: 100,
    );
    return thumbnailFile!;
  }
}
