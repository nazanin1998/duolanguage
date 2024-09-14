import 'package:duolingo/core/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/medias.dart';
import '../../data/models/language_model.dart';

class LanguageListWidget extends StatelessWidget {
  const LanguageListWidget({super.key});

  List<LanguageModel> get _allLanguages => [
        LanguageModel(id: 1, flag: Medias.iranFlag, language: 'فارسی'),
        LanguageModel(id: 2, flag: Medias.americaFlag, language: 'English'),
        LanguageModel(id: 3, flag: Medias.franceFlag, language: 'Francias'),
        LanguageModel(id: 4, flag: Medias.iranFlag, language: 'فارسی'),
        LanguageModel(id: 5, flag: Medias.americaFlag, language: 'English'),
        LanguageModel(id: 6, flag: Medias.franceFlag, language: 'Francias'),
        LanguageModel(id: 7, flag: Medias.iranFlag, language: 'فارسی'),
        LanguageModel(id: 8, flag: Medias.americaFlag, language: 'English'),
        LanguageModel(id: 9, flag: Medias.franceFlag, language: 'Francias'),
        LanguageModel(id: 10, flag: Medias.iranFlag, language: 'فارسی'),
        LanguageModel(id: 11, flag: Medias.americaFlag, language: 'English'),
        LanguageModel(id: 12, flag: Medias.franceFlag, language: 'Francias'),
        LanguageModel(id: 13, flag: Medias.iranFlag, language: 'فارسی'),
        LanguageModel(id: 14, flag: Medias.americaFlag, language: 'English'),
        LanguageModel(id: 15, flag: Medias.franceFlag, language: 'Francias'),
        LanguageModel(id: 16, flag: Medias.iranFlag, language: 'فارسی'),
        LanguageModel(id: 17, flag: Medias.americaFlag, language: 'English'),
        LanguageModel(id: 18, flag: Medias.franceFlag, language: 'Francias'),
        LanguageModel(id: 19, flag: Medias.iranFlag, language: 'فارسی'),
        LanguageModel(id: 20, flag: Medias.americaFlag, language: 'English'),
        LanguageModel(id: 21, flag: Medias.franceFlag, language: 'Francias'),
        LanguageModel(id: 22, flag: Medias.iranFlag, language: 'فارسی'),
        LanguageModel(id: 23, flag: Medias.americaFlag, language: 'English'),
        LanguageModel(id: 24, flag: Medias.franceFlag, language: 'Francias'),
        LanguageModel(id: 25, flag: Medias.americaFlag, language: 'English'),
        LanguageModel(id: 26, flag: Medias.iranFlag, language: 'فارسی'),
      ];

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 300, maxHeight: 550),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Sizes.mainMargin, horizontal: Sizes.mediumMargin),
        child: Wrap(
          spacing: 20,
          runSpacing: 50,
          direction: Axis.vertical,
          children: _allLanguages
              .map((item) => _LanguageItemWidget(languageModel: item))
              .toList(),
        ),
      ),
    );
  }
}

class _LanguageItemWidget extends StatelessWidget {
  final LanguageModel languageModel;

  final double imageHeight = 15;
  final double imageWidth = 20;

  const _LanguageItemWidget({required this.languageModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _image,
        SizedBox(width: Sizes.mediumMargin),
        Text(languageModel.language,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
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
