import 'package:exemplos_flutter/assets_gen/fonts.gen.dart';
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
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text('Test Fonts')),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
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
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            'Font $index',
                            style: GoogleFonts.openSans(fontWeight: fontWeight, fontSize: 26),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ColoredBox(
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            'Font $index',
                            style: TextStyle(
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
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
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
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            'Font $index',
                            style: GoogleFonts.lato(fontWeight: fontWeight, fontSize: 26),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ColoredBox(
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            'Font $index',
                            style: TextStyle(
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
    );
  }
}
