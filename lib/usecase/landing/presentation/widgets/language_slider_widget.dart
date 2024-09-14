import 'package:duolingo/core/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/medias.dart';
import '../../../../core/constants/sizes.dart';
import '../../data/models/language_model.dart';

class LanguageSliderWidget extends StatelessWidget {
  const LanguageSliderWidget({super.key});

  List<LanguageModel> get _allLanguages => [
        LanguageModel(id: 1, flag: Medias.iranFlag, language: 'PERSIAN'),
        LanguageModel(id: 2, flag: Medias.americaFlag, language: 'ENGLISH'),
        LanguageModel(id: 3, flag: Medias.franceFlag, language: 'FRENCH'),
        LanguageModel(id: 4, flag: Medias.iranFlag, language: 'PERSIAN'),
        LanguageModel(id: 5, flag: Medias.americaFlag, language: 'ENGLISH'),
        LanguageModel(id: 6, flag: Medias.franceFlag, language: 'FRENCH'),
        LanguageModel(id: 7, flag: Medias.iranFlag, language: 'PERSIAN'),
        LanguageModel(id: 8, flag: Medias.americaFlag, language: 'ENGLISH'),
        LanguageModel(id: 9, flag: Medias.franceFlag, language: 'FRENCH'),
        LanguageModel(id: 10, flag: Medias.iranFlag, language: 'PERSIAN'),
        LanguageModel(id: 11, flag: Medias.americaFlag, language: 'ENGLISH'),
        LanguageModel(id: 12, flag: Medias.franceFlag, language: 'FRENCH'),
        LanguageModel(id: 13, flag: Medias.iranFlag, language: 'PERSIAN'),
        LanguageModel(id: 14, flag: Medias.americaFlag, language: 'ENGLISH'),
        LanguageModel(id: 15, flag: Medias.franceFlag, language: 'FRENCH'),
        LanguageModel(id: 16, flag: Medias.iranFlag, language: 'PERSIAN'),
        LanguageModel(id: 17, flag: Medias.americaFlag, language: 'ENGLISH'),
        LanguageModel(id: 18, flag: Medias.franceFlag, language: 'FRENCH'),
        LanguageModel(id: 19, flag: Medias.iranFlag, language: 'PERSIAN'),
        LanguageModel(id: 20, flag: Medias.americaFlag, language: 'ENGLISH'),
        LanguageModel(id: 21, flag: Medias.franceFlag, language: 'FRENCH'),
        LanguageModel(id: 22, flag: Medias.iranFlag, language: 'PERSIAN'),
        LanguageModel(id: 23, flag: Medias.americaFlag, language: 'ENGLISH'),
        LanguageModel(id: 24, flag: Medias.franceFlag, language: 'FRENCH'),
        LanguageModel(id: 25, flag: Medias.americaFlag, language: 'ENGLISH'),
        LanguageModel(id: 26, flag: Medias.iranFlag, language: 'PERSIAN'),
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
            horizontal: BorderSide(
                color: AppColors.neutralGray, width: Sizes.btnBorderWidth)),
      ),
      height: Sizes.appbarHeight,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon(Icons.arrow_back_ios, () {}),
          SizedBox(
            width: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width / 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _allLanguages.length,
              itemBuilder: (context, index) => _LanguageItemWidget(
                languageModel: _allLanguages[index],
              ),
            ),
          ),
          _icon(Icons.arrow_forward_ios, () {}),
        ],
      ),
    );
  }

  IconButton _icon(IconData data, Function() onPressed) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          data,
          size: Sizes.iconSize,
          color: AppColors.textGray,
        ));
  }
}

class _LanguageItemWidget extends StatelessWidget {
  final LanguageModel languageModel;

  final double imageHeight = 22;
  final double imageWidth = 30;

  const _LanguageItemWidget({required this.languageModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Sizes.mediumMargin),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _image,
          SizedBox(width: Sizes.mainMargin),
          Text(languageModel.language,
              style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget get _image => SizedBox(
        height: imageHeight,
        width: imageWidth,
        child: ClipRRect(
            borderRadius: Sizes.smallBorder,
            child: Image.asset(
              languageModel.flag,
              height: imageHeight,
              width: imageWidth,
              fit: BoxFit.cover,
            )),
      );
}
