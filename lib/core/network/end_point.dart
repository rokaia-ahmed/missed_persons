
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared_preferences/shared_pref_user.dart';

const GET_ALL_POSTS = 'posts/getAllPosts';
String Finder_POST = 'posts/addFinderPost/user/${PrefUser.getUser()!.id}';
String Searcher_POST = 'posts/addSearcherPost/user/${PrefUser.getUser()!.id}';
String SearchByPicture = 'posts/searchByPicture';

