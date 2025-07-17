import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/screens/scenario/sce_1flg.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'dart:ui';
import 'package:safety_go/l10n/app_localizations.dart';

class Sce1s10 extends StatefulWidget {
  const Sce1s10({super.key});

  @override
  State<Sce1s10> createState() => _Sce1s10State();
}

class _Sce1s10State extends State<Sce1s10> {
  bool showStatus = false;

  @override
  Widget build(BuildContext context) {
    //final flg = Provider.of<FlgModel>(context);
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(child: Text('Scenario sub 1-10')),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              setState(() {
                showStatus = !showStatus;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/1_7.jpg',
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
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const Alignment(0.9, 1.0),
                        child: SizedBox(
                          height: 400,
                          child: Image.asset('assets/images/people10.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white.withOpacity(0.7),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(t.pe10),
                      const SizedBox(height: 8),
                      Text(t.scepeople10),
                      const SizedBox(height: 24),
                      Center(
                        child: ElevatedButton(
                          onPressed: () => context.push(RoutePaths.sce1_10),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 60),
                          ),
                          child: Text(t.escape),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: const Alignment(0.9, 0.8),
                        child: ElevatedButton(
                          onPressed: () => context.pop(),
                          child: Text(t.back),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                          showStatus = false;
                        });
                      },
                      child: Text(t.cont),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
