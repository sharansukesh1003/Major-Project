import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/core/model/news_model.dart';
import 'package:wasd_front_end/core/services/news_service.dart';
import 'package:wasd_front_end/widgets/news_tile.dart';
import 'package:wasd_front_end/views/news_view/webview_widget.dart';

class NewsView extends StatefulWidget {
  const NewsView({ Key? key }) : super(key: key);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {

  List<NewsModel> newsData = [];
  bool _loading = true;

  List<NewsModel> newsDataList = [];
  @override
  void initState() { 
    super.initState();
    getNewsData();
  }

  getNewsData() async {
    NewsApi newsDataMain = NewsApi();
    await newsDataMain.getNewsData();
    newsData = newsDataMain.newsDataList;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: ConstantColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.primaryColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
          Text("N",
            style: TextStyle(
              color: ConstantColors.secondaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            ),
            Text("ews",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            ),
          ],
        ),
      ),
      body: _loading ? const Center(
              child: CircularProgressIndicator(
                color: ConstantColors.secondaryColor,
              ),
            ) : SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
             physics: const BouncingScrollPhysics(),
             shrinkWrap: true,
             itemCount: 5,
             itemBuilder: (context, index) {
               return GestureDetector(
                 onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                                child: ContainedView(url: newsData[index].url),
                                type: PageTransitionType.rightToLeft),
                          );
                        },
                 child: NewsTile(
                   imageUrl: newsData[index].image, 
                   title: newsData[index].title, 
                   desc: newsData[index].description),
               );
          }),
        ),
      ),
    );
  }
}
