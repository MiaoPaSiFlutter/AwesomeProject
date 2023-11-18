// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../routes/router.dart';
import '../routes/router.gr.dart';
import '../values/values.dart';
import '../values/data.dart';
import '../widgets/category_card.dart';
import '../widgets/foody_bite_card.dart';
import '../widgets/heading_row.dart';
import '../widgets/search_input_field.dart';

class HomeScreen extends StatelessWidget {
  static const int TAB_NO = 0;

  HomeScreen({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: Sizes.MARGIN_16,
            vertical: Sizes.MARGIN_8,
          ),
          child: ListView(
            children: <Widget>[
              FoodyBiteSearchInputField(
                ImagePath.searchIcon,
                controller: controller,
                textFormFieldStyle:
                    Styles.customNormalTextStyle(color: AppColors.accentText),
                hintText: StringConst.HINT_TEXT_HOME_SEARCH_BAR,
                hintTextStyle:
                    Styles.customNormalTextStyle(color: AppColors.accentText),
                suffixIconImagePath: ImagePath.settingsIcon,
                borderWidth: 0.0,
                onTapOfLeadingIcon: () => AutoRouter.of(context).push(
                  SearchResultsScreen(
                    searchValue: SearchValue(
                      controller.text,
                    ),
                  ),
                ),
                onTapOfSuffixIcon: () =>
                    AutoRouter.of(context).push(const FilterScreen()),
                borderStyle: BorderStyle.solid,
              ),
              const SizedBox(height: 16.0),
              HeadingRow(
                title: StringConst.TRENDING_RESTAURANTS,
                number: StringConst.SEE_ALL_45,
                onTapOfNumber: () => AutoRouter.of(context)
                    .push(const TrendingRestaurantsScreen()),
              ),
              const SizedBox(height: 16.0),
              Container(
                height: 280,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 4.0),
                        child: FoodyBiteCard(
                          onTap: () => AutoRouter.of(context).push(
                            RestaurantDetailsScreen(
                              restaurantDetails: RestaurantDetails(
                                imagePath: imagePaths[index],
                                restaurantName: restaurantNames[index],
                                restaurantAddress: addresses[index],
                                rating: ratings[index],
                                category: category[index],
                                distance: distance[index],
                              ),
                            ),
                          ),
                          imagePath: imagePaths[index],
                          status: status[index],
                          cardTitle: restaurantNames[index],
                          rating: ratings[index],
                          category: category[index],
                          distance: distance[index],
                          address: addresses[index],
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 16.0),
              HeadingRow(
                title: StringConst.CATEGORY,
                number: StringConst.SEE_ALL_9,
                onTapOfNumber: () =>
                    AutoRouter.of(context).push(const CategoriesScreen()),
              ),
              const SizedBox(height: 16.0),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryImagePaths.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: FoodyBiteCategoryCard(
                        imagePath: categoryImagePaths[index],
                        gradient: gradients[index],
                        category: category[index],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              HeadingRow(
                title: StringConst.FRIENDS,
                number: StringConst.SEE_ALL_56,
                onTapOfNumber: () =>
                    AutoRouter.of(context).push(const FindFriendsScreen()),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: createUserProfilePhotos(numberOfProfilePhotos: 6),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> createUserProfilePhotos({required numberOfProfilePhotos}) {
    List<Widget> profilePhotos = [];
    List<String> imagePaths = [
      ImagePath.profile1,
      ImagePath.profile2,
      ImagePath.profile3,
      ImagePath.profile4,
      ImagePath.profile1,
      ImagePath.profile2,
    ];

    List<int> list = List<int>.generate(numberOfProfilePhotos, (i) => i + 1);

    for (var i in list) {
      profilePhotos
          .add(CircleAvatar(backgroundImage: AssetImage(imagePaths[i - 1])));
    }
    return profilePhotos;
  }
}
