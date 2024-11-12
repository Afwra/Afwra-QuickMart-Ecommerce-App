import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';

class CustomExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;

  const CustomExpandableText(
      {super.key, required this.text, this.trimLines = 2});

  @override
  CustomExpandableTextState createState() => CustomExpandableTextState();
}

class CustomExpandableTextState extends State<CustomExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final span = TextSpan(text: widget.text);
    final tp = TextPainter(
      text: span,
      maxLines: widget.trimLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width);

    if (!tp.didExceedMaxLines) {
      return Text(widget.text);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.text,
          style: AppTextStyles.body2Regular.copyWith(color: AppColors.kGrey150),
          maxLines: isExpanded ? null : widget.trimLines,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? "Show less" : "Show more",
            style: AppTextStyles.body2Regular
                .copyWith(color: AppColors.kBrandColorCyan),
          ),
        ),
      ],
    );
  }
}
