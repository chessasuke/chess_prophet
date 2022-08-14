import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/common/constants/remote_config_values.dart';
import 'package:chess_prophet/common/text/text_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: DisplayProperties.pagesPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(
                    DisplayProperties.defaultContentPadding),
                child: Text(
                  'FAQ',
                  style: TextStyles.display02,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Rating
                  Padding(
                    padding: const EdgeInsets.all(
                        DisplayProperties.defaultContentPadding),
                    child: Text(
                      'Rating',
                      style: TextStyles.heading02,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  for (final item in RemoteConfigValues.ratingFAQ.entries)
                    Padding(
                      padding: const EdgeInsets.all(
                          DisplayProperties.defaultContentPadding),
                      child: ExpansionTile(
                        title: Text(
                          item.key,
                          style: TextStyles.heading03,
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item.value,
                              style: TextStyles.body01,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                    ),

                  const SizedBox(
                      height: DisplayProperties.defaultContentPadding),

                  /// Norm
                  Padding(
                    padding: const EdgeInsets.all(
                        DisplayProperties.defaultContentPadding),
                    child: Text(
                      'Norm',
                      style: TextStyles.heading02,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  for (final item in RemoteConfigValues.normFAQ.entries)
                    Padding(
                      padding: const EdgeInsets.all(
                          DisplayProperties.defaultContentPadding),
                      child: ExpansionTile(
                        title: Text(
                          item.key,
                          style: TextStyles.heading03,
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item.value,
                              style: TextStyles.body01,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
