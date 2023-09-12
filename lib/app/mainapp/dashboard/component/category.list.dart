import 'package:flutter/material.dart';
import 'package:vds/app/mainapp/dashboard/merchant/merchant.dashboard.controller.dart';
import 'package:vds/common/enums.dart';

class CategoryList extends StatelessWidget {
  final Function(CategoryEnum)? didTapItem;
  final List<CategoryEnum> categories;

  const CategoryList({super.key, required this.categories, this.didTapItem});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 15, right: 17),
      itemCount: categories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1),
      itemBuilder: (context, index) {
        var category = categories[index];
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => didTapItem!(category),
          child: ChildCategory(
            category: category,
            categories: categories,
            index: index,
            length: categories.length,
          ),
        );
      },
    );
  }
}

class ChildCategory extends StatelessWidget {
  const ChildCategory({
    Key? key,
    required this.category,
    required this.categories,
    required this.index,
    required this.length,
  }) : super(key: key);

  final CategoryEnum category;
  final int index;
  final int length;
  final List<CategoryEnum> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              if (index % 3 != 0)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: VerticalDivider(
                    thickness: 1,
                    color: Color(0xFFF2EFEF),
                    width: 1,
                  ),
                ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    category.icon,
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Text(
                        category.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 13, color: Color(0xFF6F6F6F)),
                      ),
                    ),
                    // const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (index < (length % 3 == 0 ? length - 3 : (length - length % 3)))
          const Divider(
            thickness: 1,
            color: Color(0xFFF2EFEF),
            height: 1,
          ),
        // const Divider(
        //   thickness: 1,
        //   color: Color(0xFFF2EFEF),
        //   height: 1,
        // ),
      ],
    );
  }
}
