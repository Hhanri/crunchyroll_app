import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/utils/format_utils.dart';
import 'package:crunchyroll_app/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class SelectSeasonScreen extends StatelessWidget {

  final List<AnimeSeason> availableSeasons ;
  final Function(AnimeSeason) onSelectSeason;
  final AnimeSeason selectedSeason;

  const SelectSeasonScreen({
    Key? key,
    required this.availableSeasons,
    required this.onSelectSeason,
    required this.selectedSeason,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<AnimeSeason> _availableSeasons = availableSeasons;
    final Function(AnimeSeason) _selectSeason = onSelectSeason;
    final AnimeSeason _selectedSeason = selectedSeason;

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
                          onTap: (){
                            _selectSeason(_availableSeasons[index]);
                            Navigator.of(context).pop();
                          },
                          seasonTitle: _availableSeasons[index].displaySeasonTitle(),
                          isSelectedSeason: _availableSeasons[index] == _selectedSeason ? true : false,
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
  final bool isSelectedSeason;
  const _SelectSeasonButton({
    Key? key,
    required this.onTap,
    required this.seasonTitle,
    required this.isSelectedSeason
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
            style: isSelectedSeason ?
              Theme.of(context).textTheme.headline1!.copyWith(color: MyColors.fontColor2) :
            Theme.of(context).textTheme.headline1,
          )
        ],
      ),
    );
  }
}
