import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

void main() {
  runApp(Sce1_1());
}

class Sce1_1 extends StatefulWidget {
  const Sce1_1({super.key});

  @override
  State<Sce1_1> createState() => _Sce1_1State();
}

class _Sce1_1State extends State<Sce1_1> {
  bool showStatus = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Scenario 1-1')),
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
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              'assets/images/sce1-1back.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
            color: Colors.black.withOpacity(0.3),
            ),
          ),

              Expanded(
                flex: 7,
                child: Stack(
                  children: [
                    //右のキャラ
                Positioned(
                  right: 180,
                  bottom: 10,
                  child: GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      height: 130,
                      child: Image.asset('assets/images/image1.png'),
                    ),
                  ),
                ),

                //移動(上)
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child:  Icon(
                        Icons.arrow_drop_up,
                        size: 90,
                        color: Colors.black,
                    ),
                  )
                ),

                Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                        ),
                      ),
                    ),


                //移動(下)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 90,
                      color: Colors.black,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.transparent,
                      ),
                    ),
                  )
                  ],
                ),
              ),

              Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                color: Colors.white.withOpacity(0.7),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('(見出し)'),
                    SizedBox(height: 8),
                    Text('ここにテキストを表示')
                  ],
                ),
              ),
            ),

          // 状態確認パネル（右側表示）
          if (showStatus)
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 160,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(-2, 2),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('状態確認', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('flg1: 0'),
                    Text('flg2: '),
                    Text('flg3: '),
                    Text('flg4: '),
                    Text('flg5: '),
                    Text('flg6: '),
                    Text('flg7: '),
                    Text('flg8: '),
                    ElevatedButton(
                      onPressed: () => context.push(RoutePaths.sce1_10), 
                      child: Text('Escape')),
                    ElevatedButton(
                      onPressed: () => context.go(RoutePaths.scehome), 
                      child: Text('Home'))
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}