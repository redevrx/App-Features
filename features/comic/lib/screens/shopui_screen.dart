import 'package:comic/model/category_model.dart';
import 'package:core/core/constants/colors.dart';
import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShopUIScreen extends StatelessWidget {
  const ShopUIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(kDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            const Text(
              "Best Outfits for you",
              style: TextStyle(fontSize: kDefault + 2),
            ),
            const SizedBox(
              height: kDefault,
            ),
            buildForm(),
            const SizedBox(
              height: kDefault,
            ),
            buildPreviewShop(context),
            const SizedBox(height: kDefault,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Arrival",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/icons/menu.svg"),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/icons/Location.svg"),
          const SizedBox(
            width: kDefault / 2,
          ),
          Text(
            "15/2 Location",
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/Notification.svg'))
      ],
    );
  }

  Form buildForm() {
    return Form(
        child: TextFormField(
      decoration: InputDecoration(
        hintText: "Search Items ...",
        filled: true,
        fillColor: Colors.white,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset('assets/icons/Search.svg'),
        ),
        suffixIcon: SizedBox(
            height: 50,
            width: 50,
            child: Stack(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      backgroundColor: primaryColor),
                  child: const SizedBox(),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset('assets/icons/Filter.svg'),
                )
              ],
            )),
      ),
    ));
  }

  SizedBox buildPreviewShop(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .088,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: demoCategories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: kDefault),
            child: CategoryCard(
                icon: demoCategories[index].icon,
                press: () {},
                title: demoCategories[index].title),
          );
        },
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(kDefault / 1.2),
        borderSide: BorderSide.none);
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.icon,
    required this.press,
    required this.title,
  });

  final String icon;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kDefault / 2))),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 0.0, vertical: kDefault / 2),
          child: Column(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(
                height: kDefault / 8,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
        ));
  }
}
