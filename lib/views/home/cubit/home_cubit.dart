import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:missed_people/core/models/all_posts_model.dart';
import '../../../core/network/dio_helper.dart';
import '../../../core/network/end_point.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(InitialHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<AllPostsModel> allPostsList=[];
  void getAllPosts(){
    allPostsList =[];
    emit(GetALLPostsLoadingState());
    DioHelper.getData(
      url:GET_ALL_POSTS,
    ).then((value) {
      List data=value.data;
      for (var element in data) {
        allPostsList.add(AllPostsModel.fromJson(element));
      }
      emit(GetALLPostsSuccessState());
      print(allPostsList[0].poster!.email);
      print('Response status code: ${value.statusCode}');
    }).catchError((error){
      print(error.toString());
      emit(GetALLPostsErrorState(error.toString()));
    });
  }

  //TODO ADD IMAGE
  ImagePicker picker = ImagePicker();
  File? image;
  Uint8List? bytes;
  String? img64;

  Future<void> addImage() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      bytes = File(image!.path).readAsBytesSync();
      img64 = base64Encode(bytes!);
      print('image base64 done');
      emit(SuccessPickImageState());
    } else {
      print('No image selected.');
      emit(ErrorPickImageState());
    }
  }
  File? imageCamera;
  Future<void> cameraImage() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imageCamera = File(pickedFile.path);
      bytes = File(imageCamera!.path).readAsBytesSync();
      img64 = base64Encode(bytes!);
      print('image camera success');
      emit(SuccessPickImageState());
    } else {
      print('No image selected.');
      emit(ErrorPickImageState());
    }
  }
  //TODO ADD POST BY FINDER
  Future addPostByFinder({
    required String image,
    required String name,
    required String phone,
    required String details,
    required String location,
    String age ='',
    String clothColor='',
  })async{
    emit(AddPostsByFinderLoadingState());
    await DioHelper.postData(
      url: Finder_POST,
      data:{
        'name':name ,
        'phone':phone,
        'details':details,
        'location':location,
        'age':age,
        'picture':image,
        'clothesColor':clothColor,
      },
    ).then((value){
      print("post added by finder${value.data}");
      getAllPosts();
      emit(AddPostsByFinderSuccessState());
      print('post success');
    }).catchError((error){
      print('error when finder search ${error.toString()}');
      emit(AddPostsByFinderErrorState(error.toString()));
    });
  }

//TODO ADD POST BY SEARCHER

  Future addPostBySearcher({
    required String image,
    required String name,
    required String phone,
    required String details,
    required String location,
    String age ='',
    String clothColor='',
  })async{
    emit(AddPostsBySearcherLoadingState());
    await DioHelper.postData(
      url: Searcher_POST,
      data:{
        'name':name ,
        'phone':phone,
        'details':details,
        'location':location,
        'age':age,
        'picture':image,
        'clothesColor':clothColor,
      },
    ).then((value){
      print("post added by searcher${value.data}");
      getAllPosts();
      emit(AddPostsBySearcherSuccessState());
      print('post success');
    }).catchError((error){
      print('error when finder search${error.toString()}');
      emit(AddPostsBySearcherErrorState(error.toString()));
    });
  }
//TODO SEARCH BY PICTURE

    AllPostsModel? searchByPictureModel;
 searchByPicture({required String image64}){
   emit(SearchByPictureLoadingState());
   var formData = FormData.fromMap({
     'pictureBase64': image64,
   });
      DioHelper.postSearch(
        url: SearchByPicture,
        data: formData ,
      ).then((value){
        print('search success${value.data}');
        searchByPictureModel = AllPostsModel.fromJson(value.data);
        emit(SearchByPictureSuccessState());
      }).catchError((error){
        print('error when search by pic${error.toString()}');
       emit(SearchByPictureErrorState(error.toString()));
      });
 }
  //TODO SEARCH BY TEXT
  List<AllPostsModel> searchList=[];
   String? searchText;
  void searchByText(){
    searchList=[];
    emit(SearchByTextLoadingState());
    DioHelper.getData(
      url:'posts/searchByText?text=$searchText',
    ).then((value) {
      List data=value.data;
      for (var element in data) {
        searchList.add(AllPostsModel.fromJson(element));
      }
      emit(SearchByTextSuccessState());
      print('search by text: ${value.data}');
    }).catchError((error){
      print(error.toString());
      emit(SearchByTextErrorState(error.toString()));
    });
  }
}