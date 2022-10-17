import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';
import 'package:youth_care/data/models/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  List<NewsModel> newsList = [];
  NewsCubit() : super(NewsInitial());
  CollectionReference news = FirebaseFirestore.instance.collection('news');
  void getNews() {
    try {
      news.orderBy('time').snapshots().listen((event) {
        newsList.clear();
        for (var doc in event.docs) {
          
          newsList.add(NewsModel.fromJson(doc));
        }

        emit(NewsSuccess(newsList: newsList));
      });
    } on Exception catch (e) {
      // TODO
      print('fail to load');
    }
  }

  final _storage = FirebaseStorage.instance;

  File? _imagePath;
  Reference? _spaceRef;
  bool imgReadyToBeUploaded = false;
  UploadTask? _uploadTask;
  String? _title;
  String? _description;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> selectImage() async {
    final storageRef = _storage.ref();
    final imagesRef = storageRef.child("news_images");

    // final result = await
    var result;
    FilePicker.platform
        .pickFiles(
      allowMultiple: false,
      type: FileType.image,
    )
        .then((value) {
      result = value;
      PlatformFile selectedImage = result!.files.first;
      _imagePath = File(selectedImage.path!);
      if (_imagePath != null)
        _spaceRef = storageRef.child("news_images/${selectedImage.name}");
      emit(ImageSelected(
        name: selectedImage.name,
        file: _imagePath!,
      ));

      // _uploadTask = _spaceRef!.putFile(_imagePath!);
      // final snapshot = _uploadTask.whenComplete(() {
      // });
      imgReadyToBeUploaded = true;
      checkReadyToPublish();
    }).onError((error, stackTrace) {
      // TODO
      imgReadyToBeUploaded = false;
      checkReadyToPublish();
    });
    checkReadyToPublish();
  }

  void titleChanged(String? n) {
    _title = n;
    checkReadyToPublish();
  }

  void descriptionChanged(String? n) {
    _description = n;
    checkReadyToPublish();
  }

  void checkReadyToPublish() {
    print('''
check to publish was called:-

title:- ${_title},
description:- ${_description}, 
imageTobeuploadded :- $imgReadyToBeUploaded
    
    ''');
    if (_title != null && _description != null && imgReadyToBeUploaded) {
      emit(ReadyToPublish());
    }
  }

  void publish() async {
    checkReadyToPublish();
    emit(Publishing());
    _uploadTask = _spaceRef!.putFile(_imagePath!);
    emit(Publishing());
    final snapshot = await _uploadTask!.whenComplete(() {});
    var url = await snapshot.ref.getDownloadURL();
    emit(Publishing());
    db.collection('news').doc().set({
      'description': _description,
      'title': _title,
      'image': url,
      'time': DateTime.now().toString(),
    }).then((value) => emit(PublishedSuccessfully()));
  }
}
