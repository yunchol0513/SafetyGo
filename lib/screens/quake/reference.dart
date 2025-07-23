import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class CitationPage extends StatelessWidget {
  final List<Map<String, String>> references = [
    {
      "title": "日本標識工業会",
      "url": "http://www.signs-nsa.jp/"
    },
    {
      "title": "神戸市：神戸市防災行政無線",
      "url": "https://www.city.kobe.lg.jp/a95474/bosaimusen.html"
    },
    {
      "title": "NHK WORLD JAPAN： 多言語による災害時の呼びかけ音声データ",
      "url": "https://www3.nhk.or.jp/nhkworld/en/multilingual_links/yobikake/"
    },
    {
      "title": "徳島市：全国瞬時警報システムについて",
      "url": "https://www.city.tokushima.tokushima.jp/smph/anzen/shoubo_bousai/shoubou/urgent/jalert/450201a20201858471.html"
    },
    // 他の引用元をここに追加
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.inyou),
        backgroundColor: const Color.fromARGB(255, 163, 181, 63),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.go(RoutePaths.diffculty_quake), // ← go_routerによる戻る
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: references.length,
          itemBuilder: (context, index) {
            final ref = references[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(ref["title"] ?? ""),
                subtitle: Text(ref["url"] ?? ""),
                trailing: Icon(Icons.open_in_new),
                onTap: () async {
                  final url = ref["url"]!;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'このURLは開けません: $url';
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}