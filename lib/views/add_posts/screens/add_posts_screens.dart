import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:missed_people/core/utils/app_colors.dart';
import 'package:missed_people/core/utils/media_query_values.dart';
import 'package:missed_people/views/home/cubit/home_cubit.dart';
import 'package:missed_people/views/home/cubit/home_states.dart';
import 'package:missed_people/views/home/screens/home_screen.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/navigator.dart';
import '../../home/widgets/app_widgets.dart';
import '../widgets/custom_text_form_field.dart';

class AddPostsScreen extends StatefulWidget {
  const AddPostsScreen({Key? key}) : super(key: key);

  @override
  State<AddPostsScreen> createState() => _AddPostsScreenState();
}

class _AddPostsScreenState extends State<AddPostsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController clothColorController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String type = 'finder';
  List<Widget> myImages = [
    BlocBuilder<HomeCubit, HomeStates>(
      builder:(context,state){
        HomeCubit cubit = BlocProvider.of(context);
        if (cubit.imageCamera == null) {
          return InkWell(
          onTap: () {
            cubit.cameraImage();
          },
          child: Container(
            height: 175,
            width: 175,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.imageColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.camera_alt_outlined,
              size: 60,
              color: AppColors.primaryColor,
            ),
          ),
        );
        }else{
          return Center(
              child: Image.file(
                cubit.imageCamera!,
                height: 175,
                width: 175,
              ));
        }
      } ,
    ),
    BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        HomeCubit cubit = BlocProvider.of(context);
        if (cubit.image == null) {
          return InkWell(
            onTap: () {
              cubit.addImage();
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: DottedBorder(
                borderType: BorderType.RRect,
                strokeWidth: 2,
                dashPattern: const [10, 7, 10, 7],
                color: AppColors.primaryColor,
                radius: const Radius.circular(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 175,
                    width: 175,
                    color: const Color.fromRGBO(9, 46, 92, 0.17),
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: SvgPicture.asset(
                        'assets/images/plus.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
              child: Image.file(
            cubit.image!,
            height: 175,
            width: 175,
          ));
        }
      },
    ),
  ];
  // when adding new images they'll be added at the beginning to have plus at the end
  // myImages.insert(0, element);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(context.height * 0.085),
            child: PreferredSize(
                preferredSize: Size.fromHeight(context.height * 0.085),
                child: AppWidgets.customAppBar(
                  context,
                  Container(),
                  [],
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      'Add missing person',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ),
                )),
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: ListView(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        child: SizedBox(
                          width: context.width * 0.36,
                          child: RadioListTile(
                              activeColor: AppColors.primaryColor,
                              title: FittedBox(
                                child: Text(
                                  'Finder',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              value: 'finder',
                              groupValue: type,
                              onChanged: (value) {
                                type = value.toString();
                                setState(() {});
                              }),
                        ),
                      ),
                      FittedBox(
                        child: SizedBox(
                          width: context.width * 0.4,
                          child: RadioListTile(
                              activeColor: AppColors.primaryColor,
                              title: FittedBox(
                                child: Text(
                                  'Searcher',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              value: 'searcher',
                              groupValue: type,
                              onChanged: (value) {
                                type = value.toString();
                                setState(() {});
                              }),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Photos of the missing',
                    style: AppFonts.poppins,
                  ),
                  const SizedBox(height: 10),
                  // GridView(gridDelegate: gridDelegate),
                  SizedBox(
                    height: myImages.length == 1
                        ? 180
                        : myImages.length.isEven
                            ? 180 * myImages.length.toDouble() / 2
                            : 120 * myImages.length.toDouble(),
                    child: StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      itemBuilder: (context, index) => myImages[index],
                      itemCount: myImages.length,
                      staggeredTileBuilder: (int index) =>
                          const StaggeredTile.count(1, 1),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Details',
                    style: AppFonts.poppins,
                  ),
                  const SizedBox(height: 10),
                  //////////////////////////name
                  Text(
                    'Name of missed person',
                    style: AppFonts.poppinsLight,
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    controller:nameController ,
                    hintText:'Enter name...' ,
                  ),
                  /////////////////////////phone
                  Text(
                    'Your Phone',
                    style: AppFonts.poppinsLight,
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    controller:phoneController ,
                    hintText:'Enter phone...' ,
                  ),
                  /////////////////////////////details
                  Text(
                    'Details',
                    style: AppFonts.poppinsLight,
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                      controller: detailsController,
                      hintText: 'Enter details...'),
                  /////////////////////////////age
                  Text(
                    'Age of missed person',
                    style: AppFonts.poppinsLight,
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                      controller: ageController,
                      hintText: 'Enter age...'),
                  /////////////////////////////clothes color
                  Text(
                    'clothes color',
                    style: AppFonts.poppinsLight,
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                      controller: clothColorController,
                      hintText: 'Enter clothes color...',
                  ),
                  ////////////////////////location
                  Text(
                    'Location',
                    style: AppFonts.poppinsLight,
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    controller: locationController,
                    hintText: 'Enter location...',
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            type == 'finder'
                                ? 'Add location'
                                : 'Last location of the missing',
                            style: AppFonts.poppinsLight,
                          ),
                          const Text(
                            '*',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(6)),
                        height: 55,
                        width: 55,
                        child: const Icon(Icons.my_location,
                            size: 22, color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child: InkWell(
                        onTap: () {
                            if(type == 'finder') {
                            cubit.addPostByFinder(
                            image: cubit.img64!,
                            name: nameController.text,
                            phone: phoneController.text,
                            details: detailsController.text,
                            location: locationController.text,
                            age: ageController.text,
                            clothColor: clothColorController.text,
                          ).then((value) {
                            AppNavigator.push(
                                context: context, screen: const HomeScreen());
                          });
                            }else{
                              cubit.addPostBySearcher(
                                  image: cubit.img64!,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  details: detailsController.text,
                                  location: locationController.text,
                                  age: ageController.text,
                                  clothColor: clothColorController.text,
                              ).then((value){
                                AppNavigator.push(
                                    context: context, screen: const HomeScreen());
                              });
                            }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              'Upload',
                              style: AppFonts.upload,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (state is AddPostsByFinderLoadingState)
                    const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
