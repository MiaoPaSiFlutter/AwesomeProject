import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../routes/router.dart';
import '../routes/router.gr.dart';
import '../values/data.dart';
import '../values/values.dart';
import '../widgets/foody_bite_card.dart';
import '../widgets/search_input_field.dart';
import '../widgets/spaces.dart';

class SearchResultsScreen extends StatelessWidget {
  final SearchValue searchValue;

  const SearchResultsScreen(this.searchValue, {super.key});

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController(text: searchValue.value);

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            left: Sizes.MARGIN_16,
            right: Sizes.MARGIN_16,
            top: Sizes.MARGIN_16,
          ),
          child: Column(
            children: <Widget>[
              FoodyBiteSearchInputField(
                ImagePath.searchIcon,
                controller: controller,
                textFormFieldStyle:
                    Styles.customNormalTextStyle(color: AppColors.accentText),
                hintText: StringConst.HINT_TEXT_TRENDING_SEARCH_BAR,
                hintTextStyle:
                    Styles.customNormalTextStyle(color: AppColors.accentText),
                suffixIconImagePath: ImagePath.closeIcon,
                onTapOfSuffixIcon: () => Navigator.pop(context),
                borderWidth: 0.0,
                borderStyle: BorderStyle.solid,
              ),
              SizedBox(height: Sizes.WIDTH_16),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  separatorBuilder: (context, index) {
                    return SpaceH8();
                  },
                  itemBuilder: (context, index) {
                    return Container(
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
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
