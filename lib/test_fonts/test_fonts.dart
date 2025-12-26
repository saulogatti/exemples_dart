import 'package:exemplos_flutter/assets_gen/fonts.gen.dart';
import 'package:exemplos_flutter/main.dart';
import 'package:exemplos_flutter/test_fonts/cache_font.dart';
import 'package:exemplos_flutter/test_fonts/cache_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestFonts extends StatefulWidget {
  const TestFonts({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TestFontsState();
  }
}

class _TestFontsState extends State<TestFonts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Test Fonts')),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Open Sans", style: TextStyle(fontSize: 26, color: Colors.black)),
                ),
              ),
            ),
            SliverList.separated(
              itemCount: FontWeight.values.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                final CacheFont cacheFont = CacheFont(
                  key: _getKeyCahce(index),
                  fontName: 'Open Sans Reference',
                  fontSize: 14,
                );
                cacheBackend.save(cacheFont);
                final CacheSealedClassA cacheFontA = CacheSealedClassA(
                  key: 'CacheBackendClassA_$index'.toLowerCase(),
                  valueA: 'Description A $index',
                );
                cacheBackendClassA.save(cacheFontA);
                final fontWeight = FontWeight.values[index];
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  spacing: 10,
                  children: [
                    Expanded(
                      child: ColoredBox(
                        color: Colors.transparent,
                        child: Center(
                          child: Text(
                            'GoogleFont $index',
                            style: GoogleFonts.openSans(
                              fontWeight: fontWeight,
                              fontSize: 26,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ColoredBox(
                        color: Colors.transparent,
                        child: Center(
                          child: Text(
                            'Font $index',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: fontWeight,
                              fontFamily: FontFamily.openSans,
                              fontSize: 26,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Lato", style: TextStyle(fontSize: 26, color: Colors.black)),
                ),
              ),
            ),
            SliverList.separated(
              itemCount: FontWeight.values.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                final fontWeight = FontWeight.values[index];
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  spacing: 10,
                  children: [
                    Expanded(
                      child: ColoredBox(
                        color: Colors.transparent,
                        child: Center(
                          child: Text(
                            'GoogleFont $index',
                            style: GoogleFonts.lato(
                              fontWeight: fontWeight,
                              fontSize: 26,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ColoredBox(
                        color: Colors.transparent,
                        child: Center(
                          child: Text(
                            'Font $index',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: fontWeight,
                              fontFamily: FontFamily.lato,
                              fontSize: 26,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => CacheWidget(length: FontWeight.values.length)));
        },
        child: const Icon(Icons.arrow_back_ios),
      ),
    );
  }

  String _getKeyCahce(int index) => 'open_sans_$index';
}
