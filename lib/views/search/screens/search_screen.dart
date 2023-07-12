import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missed_people/core/utils/app_colors.dart';
import 'package:missed_people/core/utils/media_query_values.dart';
import 'package:missed_people/views/home/cubit/home_cubit.dart';
import 'package:missed_people/views/home/cubit/home_states.dart';
import '../../../core/models/all_posts_model.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/navigator.dart';
import '../../home/screens/details_screen.dart';
import '../../home/widgets/app_widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static String routeName = 'SearchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
final TextEditingController textEditingController = TextEditingController();
class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context) => HomeCubit()..searchByText(),
  child: BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        HomeCubit cubit =BlocProvider.of(context);
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(context.height * 0.085),
              child: AppWidgets.customAppBar(
                context,
                GestureDetector(
                  onTap: () {
                      cubit.searchText=null;
                      Navigator.pop(context);
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    margin: const EdgeInsets.only(left: 15, top: 15),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child:
                    const Icon(Icons.arrow_back, color: Colors.white, size: 25),
                  ),
                ),
                [],
                Container(
                  height: 43,
                  margin: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    controller: textEditingController,
                    onFieldSubmitted:(value){
                      cubit.searchText=value;
                      cubit.searchByText();
                      print(cubit.searchText);
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10),
                      prefixIcon: Icon(Icons.search,
                          color: AppColors.primaryColor.withOpacity(0.4),
                          size: 24),
                      hintText: 'Search',
                      hintStyle: AppFonts.poppinsLight
                          .copyWith(color: Colors.black.withOpacity(0.4)),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                      ),
                    ),
                  ),
                ),
              )),
          body: BuildCondition(
            condition:(cubit.searchList.isNotEmpty) ,
            builder:(context)=>Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => buildItem(context,cubit.searchList[index]),
                separatorBuilder: (context, index) =>
                    SizedBox(height: context.height * 0.01),
                itemCount: cubit.searchList.length,
              ),
            ) ,
            fallback:(context)=>const Center(
                child: Text('search about missing person',
                 style:TextStyle(
                   fontSize: 18,
                   color: AppColors.primaryColor,
                 ) ,
                ),
            ),
          ),
        );
      },
    ),
);
  }
  Widget buildItem(BuildContext context,AllPostsModel model) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/OIP.C4_ifNigEcuZrZttvlxbgwAAAA?pid=ImgDet&w=358&h=358&rs=1'),
            ),
            title: Row(
              children: [
                Text(model.poster!.name!,
                  style: const TextStyle(),
                ),
                Text(model.finder! ?' (finder)':' (searcher)',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            subtitle: Text(model.date!,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            trailing: const Icon(Icons.more_vert),
          ),
          Image.network(
            model.picture!,
            height: context.height * 0.37,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/images/loading.png',
                width: 300,
                height: 200,
                fit: BoxFit.contain,
              );
            },
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  //color:Colors.grey ,
                  height: context.height * 0.05,
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${model.likes!}'),
                      SizedBox(width: context.width * 0.01),
                      const Text('Up'),
                    ],
                  ),
                ),
              ),
              Container(
                height: context.height * 0.04,
                color: Colors.grey[300],
                width: 2,
              ),
              Expanded(
                child: MaterialButton(
                  height: context.height * 0.05,
                  onPressed: () {
                    AppNavigator.push(
                      context: context,
                      screen:  DetailsScreen(postsModel: model),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.library_books,
                        size: 16,
                        color: Colors.black,
                      ),
                      SizedBox(width: context.width * 0.01),
                      const Text('Details'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
