import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bhagavad_gita/controllers/chapter_controllers.dart';
import 'package:bhagavad_gita/modals/chapter_modal.dart';

class ChapterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChapterController>(
      builder: (context, chapterProvider, _) {
        List<ChapterModal> allChapter = chapterProvider.AllChapter;
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://rukminim1.flixcart.com/image/300/300/xif0q/book/w/g/t/a-seeker-s-srimad-bhagavad-gita-original-imagtcn83erhg2je.jpeg',
                        ),
                        fit: BoxFit.fill,
                        opacity: 0.5)),
              ),
              ListView.builder(
                itemCount: allChapter.length,
                itemBuilder: (context, index) {
                  ChapterModal chapter = allChapter[index];
                  return Column(
                    children: [
                      Divider(),
                      ListTile(
                        leading: Text(
                          '${chapter.chapter_number}',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Bold',
                          ),
                        ),
                        title: Text('${chapter.name_translation}'),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              'ChapterEnglishDetail',
                              arguments: index);
                        },
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
