import 'package:crunchyroll_app/models/content_model.dart';
import 'package:crunchyroll_app/resources/strings.dart';
import 'package:flutter/material.dart';

class KnowMoreScreen extends StatelessWidget {

  final dynamic featuredAnimeArgument;

  const KnowMoreScreen({Key? key,
    required this.featuredAnimeArgument
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    )
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        featuredAnimeArgument.title,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              _DescriptionBox(description: featuredAnimeArgument.description),
              SizedBox(
                height: 20
              ),
              _DetailRows()
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
    return Container(
      child: Text(
        description,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: Colors.grey.shade500
        ),
      ),
    );
  }
}



class _DetailRows extends StatelessWidget {
  const _DetailRows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _RowsInfos(leading: Strings.numberOfEpisodes, trailing: "12"),
        _DividerWidget(),
        _RowsInfos(leading: Strings.editorName, trailing: "universal"),
        _DividerWidget()
      ],
    );
  }
}



class _DividerWidget extends StatelessWidget {
  const _DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey.shade500,
      height: 0,
      thickness: 1,
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


