import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class ProductListingColorSection extends StatefulWidget {
  final List<MaterialColor> colors = const [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.indigo,
  ];

  const ProductListingColorSection({super.key});
  @override
  State<ProductListingColorSection> createState() =>
      _ProductListingColorSectionState();
}

class _ProductListingColorSectionState
    extends State<ProductListingColorSection> {
  int pressedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: AppTextStyles.heading3SemiBold,
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          children: List.generate(
            widget.colors.length,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CustomColorWidget(
                color: widget.colors[index],
                onPressed: () {
                  setState(() {
                    pressedIndex = index;
                  });
                },
                isPressed: index == pressedIndex,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CustomColorWidget extends StatelessWidget {
  const CustomColorWidget({
    super.key,
    required this.color,
    this.isPressed = false,
    this.onPressed,
  });

  final MaterialColor color;
  final bool isPressed;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        backgroundColor: isPressed ? AppColors.kBrandColorCyan : color,
        radius: 20,
        child: CircleAvatar(
          backgroundColor: color,
          radius: 18,
        ),
      ),
    );
  }
}
