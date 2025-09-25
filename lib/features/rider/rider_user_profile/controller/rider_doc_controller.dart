import 'package:get/get.dart';

import '../model/doc_model.dart';

class RiderDocController extends GetxController{

  final List <DocModel> docList=[
    DocModel(title: 'National ID', downloadImageUrl: '', visualImageUrl: '', deleteImageUrl: ''),
    DocModel(title: 'Driving License', downloadImageUrl: '', visualImageUrl: '', deleteImageUrl: ''),
    DocModel(title: 'Additional Documents', downloadImageUrl: '', visualImageUrl: '', deleteImageUrl: ''),
  ];
}