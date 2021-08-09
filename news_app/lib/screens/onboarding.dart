import 'package:flutter/material.dart';
import '../pagemodel.dart';
import 'home_screen.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class OnBoarding extends StatelessWidget {
  List<PageModel> pages = List<PageModel>();
  var _currentIndex = 0;
  ValueNotifier <int> _PageViewNotifier = ValueNotifier(0) ;

  void _addPages() {
    pages.add(PageModel(
        "Welcome!",
        "1-Make Freind is easy as waving your hand back and forth in easy step",
        Icons.safety_divider,
        'assets/images/1.jpg'));
    pages.add(PageModel(
        "Welcome!",
        "2-Make Freind is easy as waving your hand back and forth in easy step",
        Icons.sailing_sharp,
        'assets/images/1.jpg'));
    pages.add(PageModel(
        "Welcome!",
        "3-Make Freind is easy as waving your hand back and forth in easy step",
        Icons.close_fullscreen_outlined,
        'assets/images/1.jpg'));
    pages.add(PageModel(
        "Welcome!",
        "4-Make Freind is easy as waving your hand back and forth in easy step",
        Icons.car_rental,
        'assets/images/1.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();
    return Scaffold(
        body: Stack(
          children: <Widget>[
            PageView.builder(
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage(pages[index].images),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.translate(
                          child: Icon(pages[index].icon,
                              size: 100, color: Colors.white),
                          offset: Offset(0, -100),
                        ),
                        Text(
                          pages[index].title,
                          style: TextStyle(
                              letterSpacing: 3,
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 46, right: 50),
                          child: Text(
                            pages[index].description,
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
              onPageChanged: (index)
              {
                _PageViewNotifier.value = index;
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 25, left: 16, right: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.red.shade800,
                    child: Text(
                      "GET STARTED",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: ()
                    {
                        Navigator.push(context  , MaterialPageRoute (builder:(context)
                        {
                          return HomeScreen() ;
                        } )   ) ;
                    },
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -250),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child:_displayPageIndicators(pages.length) )

            ),
          ],
        ));
  }


Widget _displayPageIndicators(int length )
{
  return PageViewIndicator(
    pageIndexNotifier: _PageViewNotifier ,
    length: length,
    normalBuilder: (animationController, index) => Circle(
      size: 8.0,
      color: Colors.grey,
    ),
    highlightedBuilder: (animationController, index) => ScaleTransition(
      scale: CurvedAnimation(
        parent: animationController,
        curve: Curves.ease,
      ),
      child: Circle(
        size: 12.0,
        color: Colors.red,
      ),
    ),
  );

}
}


