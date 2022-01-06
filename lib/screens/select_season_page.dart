import 'package:auto_route/annotations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/utils/format_utils.dart';
import 'package:crunchyroll_app/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class SelectSeasonScreen extends StatelessWidget {

  final dynamic availableSeasons;
  final dynamic selectSeason;
  final dynamic selectedSeason;
  const SelectSeasonScreen({

    Key? key,
    @PathParam() required this.availableSeasons,
    @PathParam() required this.selectSeason,
    @PathParam() required this.selectedSeason,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final List<AnimeSeason> _availableSeasons = availableSeasons;
    final Function(AnimeSeason) _selectSeason = selectSeason;
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
                      context.router.pop();
                      //Navigator.of(context).pop();
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
                  ...List.generate(availableSeasons.length, (index) {
                    return Column(
                      children: [
                        _SelectSeasonButton(
                          onTap: (){
                            selectSeason(availableSeasons[index]);
                            Navigator.of(context).pop();
                          },
                          seasonTitle: availableSeasons[index].displaySeasonTitle(),
                          isSelectedSeason: availableSeasons[index] == selectedSeason ? true : false,
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
