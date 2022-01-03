import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class SelectSeasonScreen extends StatelessWidget {

  final dynamic availableSeasonsArgument;
  const SelectSeasonScreen({
    Key? key,
    required this.availableSeasonsArgument
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<AnimeSeason> _availableSeasons = availableSeasonsArgument;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )
                  ),
                ],
              ),
              Column(
                children: [
                  ...List.generate(_availableSeasons.length, (index) {
                    return Column(
                      children: [
                        _SelectSeasonButton(
                          onTap: () {
                          },
                          seasonTitle: _availableSeasons[index].season + " - " + _availableSeasons[index].seasonTitle,
                        ),
                        const DividerWidget()
                      ],
                    );
                  }),
                ],
              )
            ]
          ),
        )
      )
    );
  }
}

class _SelectSeasonButton extends StatelessWidget {

  final VoidCallback onTap;
  final String seasonTitle;

  const _SelectSeasonButton({
    Key? key,
    required this.onTap,
    required this.seasonTitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        children: [
          Text(
            seasonTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline1,
          )
        ],
      ),
    );
  }
}
