
import 'package:bhagavad_gita/controllers/verse_controllers.dart';
import 'package:bhagavad_gita/modals/verse_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerseEnglishDetailPage extends StatelessWidget {
  const VerseEnglishDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    int VaIndex = ModalRoute.of(context)!.settings.arguments as int;

    return Consumer<VerseController>(builder: (context, provider, _) {
      VerseModal verses = provider.AllVerse[VaIndex];
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Chapter ${verses.chapter_number}'),
          actions: [
            IconButton(
              icon: provider.isBookmark(verses)
                  ? Icon(Icons.bookmark_added)
                  : Icon(Icons.bookmark_add),
              onPressed: () {
                if (provider.isBookmark(verses)) {
                  provider.removeFromBookmark(index: VaIndex);
                } else {
                  provider.addToBookmark(verse: verses);
                }
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://wallpapers.com/images/hd/bhagavad-gita-golden-chariot-j8mak9up18ot5u32.jpg',
                        ),
                        fit: BoxFit.fill,
                        opacity: 0.5))),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        '${verses.title}',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      '${verses.transliteration}',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${verses.text}',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Summary :- ',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '                  ${verses.word_meanings}',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: Text(
                        '...',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 34),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    Center(
                      child: CircleAvatar(
                        backgroundColor: provider.isFavorite(verses)
                            ? Colors.transparent
                            : Colors.yellow,
                        child: IconButton(
                          icon: provider.isFavorite(verses)
                              ? Icon(Icons.star, color: Colors.yellow)
                              : Icon(
                                  Icons.star_border,
                                  color: Colors.white,
                                ),
                          onPressed: () {
                            if (provider.isFavorite(verses)) {
                              provider.removeFromFavorites(index: VaIndex);
                            } else {
                              provider.addToFavorites(verse: verses);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
