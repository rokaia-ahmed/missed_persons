
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missed_people/core/models/all_posts_model.dart';
import 'package:missed_people/core/utils/media_query_values.dart';
import 'package:missed_people/core/utils/navigator.dart';
import 'package:missed_people/views/home/cubit/home_cubit.dart';
import 'package:missed_people/views/home/cubit/home_states.dart';
import '../../../core/utils/app_colors.dart';
import '../screens/details_screen.dart';

class CustomPost extends StatelessWidget {
  const CustomPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HomeCubit cubit = BlocProvider.of(context);
        return Flexible(
          child: BuildCondition(
            condition:(cubit.allPostsList.isNotEmpty) ,
            builder:(context)=>ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => buildItem(context,cubit.allPostsList[index]),
              separatorBuilder: (context, index) =>
                  SizedBox(height: context.height * 0.01),
              itemCount: cubit.allPostsList.length,
            ) ,
            fallback:(context)=>const Center(child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            )) ,
          ),
        );
      },
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
