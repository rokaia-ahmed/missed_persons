
import 'package:flutter/material.dart';
import 'package:missed_people/core/utils/app_colors.dart';
import 'package:missed_people/core/utils/media_query_values.dart';
import '../../../core/models/all_posts_model.dart';

class DetailsScreen extends StatelessWidget {
 final AllPostsModel postsModel;
   const DetailsScreen({required this.postsModel,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
         crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            Stack(
              alignment:Alignment.topLeft ,
              children: [
                Image.network(postsModel.picture!,
                  height:context.height*0.37 ,
                  width:double.infinity ,
                  fit:BoxFit.cover ,
                ),
                 InkWell(
                   onTap:(){
                     Navigator.pop(context);
                   } ,
                   child: Container(
                     margin:EdgeInsets.all(20) ,
                     width: 30,
                     height:30 ,
                     decoration:BoxDecoration(
                       color:Colors.white ,
                       borderRadius:BorderRadius.circular(3),
                       border: Border.all(
                         color:Colors.black,
                       ),
                     ) ,
                     child:Icon(Icons.arrow_back_sharp,
                       size:20 ,
                     ) ,
                   ),
                 ),
              ],
            ),
            SizedBox(height:context.height*0.01),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start ,
                children: [
                  const Text('Name of Missing',
                    style:TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height:context.height*0.01),
                  Text(postsModel.nameChild!,
                    style:const TextStyle(
                      //color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height:context.height*0.04),
                  const Text('Location of the missing',
                    style:TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height:context.height*0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(postsModel.location!,
                        maxLines: 2,
                        style:const TextStyle(
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.location_on,
                      color:AppColors.primaryColor ,
                        size:30 ,
                      ),
                    ],
                  ),
                  SizedBox(height:context.height*0.04),
                  const Text('Contact the finder',
                    style:TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height:context.height*0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(postsModel.poster!.phone!,
                        maxLines: 1,
                        style:const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const Icon(Icons.phone,
                        color:AppColors.primaryColor ,
                        size:25 ,
                      ),
                    ],
                  ),
                  SizedBox(height:context.height*0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(postsModel.poster!.email!,
                        maxLines: 2,
                        style:const TextStyle(
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.mail,
                        color:AppColors.primaryColor ,
                        size:25 ,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
