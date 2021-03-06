import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/goods_detail.dart';
import 'package:flutter_shop/widgets/detail/detail_bottom.dart';
import 'package:flutter_shop/widgets/detail/detail_comments.dart';
import 'package:flutter_shop/widgets/detail/detail_instructions.dart';
import 'package:flutter_shop/widgets/detail/detail_tab_bar.dart';
import 'package:flutter_shop/widgets/detail/detail_top_area.dart';
import 'package:flutter_shop/widgets/detail/detail_web.dart';
import 'package:provider/provider.dart';

// class DetailPage extends StatefulWidget {
//   final String id;
//   DetailPage({Key key, this.id}) : super(key: key);

//   @override
//   _DetailPageState createState() => _DetailPageState(id);
// }

// class _DetailPageState extends State<DetailPage> {
//   final String id;
//   _DetailPageState(this.id) : super();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: ChangeNotifierProvider(
//         create: (_) => GoodsDetailProvider(),
//         child: FutureBuilder(
//           future: _getGoods(context),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Container(
//                 child: Column(
//                   children: [],
//                 ),
//               );
//             } else {
//               return Text('加载中...');
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Future _getGoods(BuildContext context) async {
//     await context.watch<GoodsDetailProvider>().requestGoodsDetail(id);
//     print(context.watch<GoodsDetailProvider>().goods.toString());
//     return '加载完成';
//   }
// }

class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ChangeNotifierProvider(
        create: (_) => GoodsDetailProvider(),
        builder: (context, _) => FutureBuilder(
          future: _getGoods(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  Container(
                    child: ListView(
                      children: [
                        DetailTopArea(),
                        DetailInstructions(),
                        DetailTabBar(),
                        // DetailComments(),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: DetailBottom(),
                  )
                ],
              );
            } else {
              return Text('加载中...');
            }
          },
        ),
      ),
    );
  }

  Future _getGoods(BuildContext context) async {
    ///context.read<GoodsDetailProvider>().requestGoodsDetail(id);
    await Provider.of<GoodsDetailProvider>(
      context,
      listen: false,
    ).requestGoodsDetail(id);
    return '加载完成';
  }
}
