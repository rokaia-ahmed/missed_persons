import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missed_people/core/utils/media_query_values.dart';
import 'package:missed_people/core/utils/navigator.dart';
import 'package:missed_people/views/home/cubit/home_cubit.dart';
import 'package:missed_people/views/home/cubit/home_states.dart';
import 'package:missed_people/views/search/widgets/no_matches_widget.dart';

import '../../../core/models/all_posts_model.dart';
import '../../home/screens/details_screen.dart';
import '../widgets/scanning_picture.dart';

class SearchByPhoto extends StatelessWidget {
   const SearchByPhoto({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: const Color(0xFF092E5C),
          leading: InkWell(
            onTap: () {
              BlocProvider.of<HomeCubit>(context).image=null;
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(Icons.arrow_back),
            ),
          ),
          title: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 245, 245, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const TextField(
              // controller: _textEditingController,
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                prefixIcon: Icon(Icons.search),

              ),

            ),
          )
      ),
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          HomeCubit cubit = BlocProvider.of(context);
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (cubit.image ==null)
                    InkWell(
                      onTap: (){
                        cubit.addImage().then((value) {
                          cubit.searchByPicture(image64: cubit.img64!);
                        });
                      },
                      child: Image.asset('assets/images/searching.png'),
                    ),
                    if (cubit.image !=null && state is SearchByPictureLoadingState)
                    const ScanningPicture(),
                    if (cubit.image !=null && state is SearchByPictureSuccessState)
                      buildItem(context,cubit.searchByPictureModel!),
                    if (cubit.image !=null && state is SearchByPictureErrorState)
                      NoMatchWidget(),
                  ],
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
