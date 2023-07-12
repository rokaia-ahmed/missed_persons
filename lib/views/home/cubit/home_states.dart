abstract class HomeStates{}
class InitialHomeState extends HomeStates{}

class GetALLPostsSuccessState extends HomeStates{}
class GetALLPostsLoadingState extends HomeStates{}
class GetALLPostsErrorState extends HomeStates{
  String errorMessage;
  GetALLPostsErrorState(this.errorMessage);
}
class SuccessPickImageState extends HomeStates{}
class ErrorPickImageState extends HomeStates{}

class AddPostsByFinderSuccessState extends HomeStates{}
class AddPostsByFinderLoadingState extends HomeStates{}
class AddPostsByFinderErrorState extends HomeStates{
  String errorMessage;
  AddPostsByFinderErrorState(this.errorMessage);
}

class AddPostsBySearcherSuccessState extends HomeStates{}
class AddPostsBySearcherLoadingState extends HomeStates{}
class AddPostsBySearcherErrorState extends HomeStates{
  String errorMessage;
  AddPostsBySearcherErrorState(this.errorMessage);
}

class SearchByPictureSuccessState extends HomeStates{}
class SearchByPictureLoadingState extends HomeStates{}
class SearchByPictureErrorState extends HomeStates{
  String errorMessage;
  SearchByPictureErrorState(this.errorMessage);
}

class SearchByTextSuccessState extends HomeStates{}
class SearchByTextLoadingState extends HomeStates{}
class SearchByTextErrorState extends HomeStates{
  String errorMessage;
  SearchByTextErrorState(this.errorMessage);
}