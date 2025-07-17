import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/screens/scenario/sce_1flg.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'dart:ui';
import 'package:safety_go/l10n/app_localizations.dart';

class Sce1_10 extends StatefulWidget {
  const Sce1_10({super.key});

  @override
  State<Sce1_10> createState() => _Sce1_10State();
}

class _Sce1_10State extends State<Sce1_10> {
  bool showStatus = false;

  @override
  Widget build(BuildContext context) {
    final flg = Provider.of<FlgModel>(context);
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('')),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              setState(() {
                showStatus = !showStatus;
              });
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/sce1-1back.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: Container(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    t.info,
                                    style: const TextStyle(fontSize: 20),
                                    textAlign: TextAlign.left,
                                  ),
                                  if (flg.flg1 == 1) Text('・${t.scepeople1}', textAlign: TextAlign.left),
                                  if (flg.flg2 == 1) Text('・${t.scepeople2}', textAlign: TextAlign.left),
                                  if (flg.flg3 == 1) Text('・${t.scepeople3}', textAlign: TextAlign.left),
                                  if (flg.flg4 == 1) Text('・${t.scepeople4}', textAlign: TextAlign.left),
                                  if (flg.flg5 == 1) Text('・${t.scepeople5}', textAlign: TextAlign.left),
                                  if (flg.flg6 == 1) Text('・${t.scepeople6}', textAlign: TextAlign.left),
                                  if (flg.flg7 == 1) Text('・${t.scepeople7}', textAlign: TextAlign.left),
                                  if (flg.flg8 == 1) Text('・${t.scepeople8}', textAlign: TextAlign.left),
                                  if (flg.flg9 == 1) Text('・${t.scepeople9}', textAlign: TextAlign.left),
                                  if (flg.flg10 == 1) Text('・${t.scepeople10}', textAlign: TextAlign.left),
                                  if (flg.flg11 == 1) Text('・${t.scepeople11}', textAlign: TextAlign.left),
                                  if (flg.flg12 == 1) Text('・${t.scepeople12}', textAlign: TextAlign.left),
                                  if (flg.flg13 == 1) Text('・${t.scepeople13}', textAlign: TextAlign.left),
                                  const SizedBox(height: 40),
                                  if ([
                                    flg.flg1,
                                    flg.flg2,
                                    flg.flg3,
                                    flg.flg4,
                                    flg.flg5,
                                    flg.flg6,
                                    flg.flg7,
                                    flg.flg8,
                                    flg.flg9,
                                    flg.flg10,
                                    flg.flg11,
                                    flg.flg12,
                                    flg.flg13,
                                  ].every((f) => f == 0))
                                    Text(t.ngescape, textAlign: TextAlign.left)
                                  else
                                    Text(t.where, textAlign: TextAlign.left),
                                  const SizedBox(height: 40),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      if (flg.flg1 == 1 || flg.flg5 == 1)
                                        ElevatedButton(
                                          onPressed: () {
                                            context.push(RoutePaths.sce1_ans);
                                            flg.toggleFlg(21);
                                          },
                                          child: Text(t.park),
                                        ),
                                      if (flg.flg2 == 1 || flg.flg5 == 1 || flg.flg13 == 1)
                                        ElevatedButton(
                                          onPressed: () {
                                            context.push(RoutePaths.sce1_ans);
                                            flg.toggleFlg(22);
                                          },
                                          child: Text(t.junior),
                                        ),
                                      if (flg.flg5 == 1 || flg.flg6 == 1 || flg.flg11 == 1)
                                        ElevatedButton(
                                          onPressed: () {
                                            context.push(RoutePaths.sce1_ans);
                                            flg.toggleFlg(23);
                                          },
                                          child: Text(t.hall),
                                        ),
                                      if (flg.flg4 == 1 || flg.flg5 == 1 || flg.flg6 == 1)
                                        ElevatedButton(
                                          onPressed: () {
                                            context.push(RoutePaths.sce1_ans);
                                            flg.toggleFlg(24);
                                          },
                                          child: Text(t.here),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () => context.pop(),
                            child: Text(t.back),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (showStatus)
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(-2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(t.finish, style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            context.push(RoutePaths.scehome);
                            final flg = Provider.of<FlgModel>(context, listen: false);
                            flg.resetAllFlags();
                          },
                          child: Text(t.finished),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showStatus = !showStatus;
                            });
                          },
                          child: Text(t.cont),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
