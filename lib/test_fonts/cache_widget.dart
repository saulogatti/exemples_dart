import 'package:auto_route/auto_route.dart';
import 'package:exemplos_flutter/test_fonts/cache_font.dart';
import 'package:flutter/material.dart';

class CacheAWidget extends StatefulWidget {
  const CacheAWidget({required this.length, super.key});
  final int length;

  @override
  State<CacheAWidget> createState() => _CacheAWidgetState();
}

class CacheWidget extends StatefulWidget {
  const CacheWidget({required this.length, super.key});
  final int length;

  @override
  State<CacheWidget> createState() => _CacheWidgetState();
}

class _CacheAWidgetState extends State<CacheAWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Cache Widget'), leading: const AutoLeadingButton()),
      body: SafeArea(
        child: ListView.builder(
          itemCount: widget.length,
          itemBuilder: (context, index) {
            return FutureBuilder<CacheSealedClassA?>(
              future: cacheBackend.get('cachebackendclassa_$index'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Text('No data found');
                } else {
                  final cacheFont = snapshot.data!;
                  return Text(
                    'Font Name: ${cacheFont.valueA}, Font Size: ${cacheFont.key}',
                    style: TextStyle(fontFamily: cacheFont.valueA, fontSize: 14),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class _CacheWidgetState extends State<CacheWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
            return FutureBuilder<CacheSealedClassA?>(
              future: cacheBackend.get('cachebackendclassa_$index'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Text('No data found');
                } else {
                  final cacheFont = snapshot.data!;
                  return Text(
                    'Font Name: ${cacheFont.valueA}, Font Size: ${cacheFont.key}',
                    style: TextStyle(fontFamily: cacheFont.valueA, fontSize: 14),
                  );
                }
              },
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
        // SliverList.separated(
        //   itemCount: FontWeight.values.length,
        //   separatorBuilder: (context, index) => const SizedBox(height: 20),
        //   itemBuilder: (context, index) {
        //     return FutureBuilder<CacheFont?>(
        //       future: cacheBackend.get(_getKeyCahce(index)),
        //       builder: (context, snapshot) {
        //         if (snapshot.connectionState == ConnectionState.waiting) {
        //           return const CircularProgressIndicator();
        //         } else if (snapshot.hasError) {
        //           return Text('Error: ${snapshot.error}');
        //         } else if (!snapshot.hasData || snapshot.data == null) {
        //           return const Text('No data found');
        //         } else {
        //           final cacheFont = snapshot.data!;
        //           return Text(
        //             'Font Name: ${cacheFont.fontName}, Font Size: ${cacheFont.key}',
        //             style: TextStyle(fontFamily: cacheFont.fontName, fontSize: 14),
        //           );
        //         }
        //       },
        //     );
        //   },
        // ),
      ],
    );
  }

  // String _getKeyCahce(int index) => 'open_sans_$index';
}
