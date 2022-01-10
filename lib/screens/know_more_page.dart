import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/models/data.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class KnowMoreScreen extends StatefulWidget {

  final AnimeContent featuredAnimeArgument;

  const KnowMoreScreen({Key? key,
    required this.featuredAnimeArgument
  }) : super(key: key);

  @override
  State<KnowMoreScreen> createState() => _KnowMoreScreenState();
}

class _KnowMoreScreenState extends State<KnowMoreScreen> {
  @override
  Widget build(BuildContext context) {
    
    final AnimeContent _featuredAnime = widget.featuredAnimeArgument;
    final AnimeEpisodesList _animeEpisodesList = animesEpisodesList[_featuredAnime]!;
    int _numberOfEpisodes = 0;
    _animeEpisodesList.seasons.forEach((key, value) {
      _numberOfEpisodes += value.length;
    });
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
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
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.featuredAnimeArgument.title,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              _DescriptionBox(description: widget.featuredAnimeArgument.description),
              const SizedBox(
                height: 20
              ),
              _DetailRows(
                numberOfEpisodes: _numberOfEpisodes,
                publisherName: _featuredAnime.publisher,)
            ],
          ),
        ),
      ),
    );
  }
}



class _DescriptionBox extends StatelessWidget {

  final String description;

  const _DescriptionBox({Key? key,
    required this.description
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
        color: Colors.grey.shade500
      ),
    );
  }
}



class _DetailRows extends StatelessWidget {
  
  final int numberOfEpisodes;
  final String publisherName;
  
  const _DetailRows({Key? key, 
    required this.numberOfEpisodes,
    required this.publisherName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _RowsInfos(leading: Strings.numberOfEpisodes, trailing: numberOfEpisodes.toString()),
        const DividerWidget(),
        _RowsInfos(leading: Strings.publisherName, trailing: publisherName),
        const DividerWidget()
      ],
    );
  }
}

class _RowsInfos extends StatelessWidget {

  final String leading;
  final String trailing;

  const _RowsInfos({Key? key,
    required this.leading,
    required this.trailing
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        leading,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      trailing: Text(
        trailing,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}


