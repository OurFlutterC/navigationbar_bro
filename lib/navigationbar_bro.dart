library NavigationBarBro_bro;
import 'package:flutter/material.dart';

class BtnBar {
  String title;
  IconData icon;
  BtnBar({this.title, this.icon});
}

enum PositionBar { top, left, bottom, right }

class NavigationBarBro extends StatefulWidget {
  List<Widget> children;
  List<BtnBar> btnsBar;
  PositionBar position;
  Color colorSelectBtn;
  Color colorAllBtn;
  double opacityBar;
  BorderRadiusGeometry btnBarRadius;
  NavigationBarBro({
    this.children = const <Widget>[],
    this.btnsBar = const <BtnBar>[],
    this.position = PositionBar.bottom,
    this.colorSelectBtn = Colors.grey,
    this.colorAllBtn = Colors.white,
    this.opacityBar = 1.0,
    this.btnBarRadius = const BorderRadius.only(
        bottomLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
  });
  @override
  _NavigationBarBroState createState() => _NavigationBarBroState(
      children: children,
      btnsBar: btnsBar,
      position: position,
      colorAllBtn: colorAllBtn,
      colorSelectBtn: colorSelectBtn,
      opacityBar: opacityBar,
      btnBarRadius: btnBarRadius);
}

class _NavigationBarBroState extends State<NavigationBarBro>
    with SingleTickerProviderStateMixin {
  List<Widget> children;
  List<BtnBar> btnsBar;
  PositionBar position;
  Color colorSelectBtn;
  Color colorAllBtn;
  double opacityBar;
  BorderRadiusGeometry btnBarRadius;
  _NavigationBarBroState(
      {this.children,
      this.btnsBar,
      this.position,
      this.colorSelectBtn,
      this.colorAllBtn,
      this.opacityBar,
      this.btnBarRadius});
  Animation animBar;
  AnimationController conBar;

  void allFalse() {
    for (var i = 0; i < check.length; i++) {
      check[i] = false;
    }
  }

  Widget btn(IconData icn, String txt, int index) {
    return Container(
      decoration: BoxDecoration(borderRadius: btnBarRadius),
      width: 70.0,
      height: 60.0,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: btnBarRadius),
        color: check[index]
            ? colorSelectBtn.withOpacity(opacityBar)
            : colorAllBtn.withOpacity(opacityBar),
        onPressed: () {
          setState(() {
            allFalse();
            check[index] = !check[index];
            cntrl.animateToPage(index,
                duration: Duration(seconds: 1), curve: Curves.easeOutSine);
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 7,
            ),
            Icon(
              icn,
              size: 30.0,
              color: check[index] ? colorAllBtn : colorSelectBtn,
            ),
            Expanded(
              child: Text(txt,
                  style: TextStyle(
                      color: check[index] ? colorAllBtn : colorSelectBtn,
                      fontSize: 10,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }

  List check = [];
  PageController cntrl = PageController();
  ScrollController lis = ScrollController(initialScrollOffset: 0.0);
  bool ck = true;
  List<Widget> btns = [];
  List<double> ps = [];
  PositionBar pb = PositionBar.bottom;
  PositionBar pt = PositionBar.top;
  PositionBar pl = PositionBar.left;
  PositionBar pr = PositionBar.right;
  @override
  void initState() {
    super.initState();
    conBar =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animBar = Tween(begin: 0 - 85.0, end: 0.0).animate(conBar);
    animBar.addListener(() {
      setState(() {});
    });

    conBar.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onVerticalDragUpdate: (t) {
                ps.length < 3 ? ps.add(t.globalPosition.dy) : ps.removeAt(0);
                setState(() {
                  ck = !ck;
                });
                if (position == pt || position == pb) {
                  if (ck) {
                    if (ps[position == pb ? 1 : 0] <
                        ps[position == pb ? 0 : 1]) {
                      conBar.addListener(() {
                        setState(() {});
                      });
                      conBar.forward();
                    }
                  } else {
                    if (ps[position == pb ? 1 : 0] >
                        ps[position == pb ? 0 : 1]) {
                      conBar.addListener(() {
                        setState(() {});
                      });
                      conBar.reverse();
                    }
                  }
                }
              },
              onHorizontalDragUpdate: (t) {
                ps.length < 3 ? ps.add(t.globalPosition.dx) : ps.removeAt(0);
                setState(() {
                  ck = !ck;
                });
                if (position == pr || position == pl) {
                  if (ck) {
                    if (ps[position == pr ? 1 : 0] <
                        ps[position == pr ? 0 : 1]) {
                      conBar.addListener(() {
                        setState(() {});
                      });
                      conBar.forward();
                    }
                  } else {
                    if (ps[position == pr ? 1 : 0] >
                        ps[position == pr ? 0 : 1]) {
                      conBar.addListener(() {
                        setState(() {});
                      });
                      conBar.reverse();
                    }
                  }
                }
              },
              onTap: () {
                setState(() {
                  ck = !ck;
                });
                if (ck) {
                  conBar.addListener(() {
                    setState(() {});
                  });
                  conBar.forward();
                } else {
                  conBar.addListener(() {
                    setState(() {});
                  });
                  conBar.reverse();
                }
              },
              onDoubleTap: () {
                setState(() {
                  ck = !ck;
                });
                if (ck) {
                  conBar.addListener(() {
                    setState(() {});
                  });
                  conBar.forward();
                } else {
                  conBar.addListener(() {
                    setState(() {});
                  });
                  conBar.reverse();
                }
              },
              child: SizedBox(
                child: PageView(
                  scrollDirection: position == pt || position == pb
                      ? Axis.horizontal
                      : Axis.vertical,
                  onPageChanged: (index) {
                    setState(() {
                      allFalse();
                      check[index] = !check[index];
                    });
                  },
                  controller: cntrl,
                  children: children,
                ),
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Positioned(
              left: position == pl ? animBar.value : null,
              top: position == pt ? animBar.value + 25.0 : null,
              bottom: position == pb ? animBar.value : null,
              right: position == pr ? animBar.value : null,
              child: AnimatedContainer(
                width: position == pt || position == pb
                    ? MediaQuery.of(context).size.width
                    : 70.0,
                height: position == pt || position == pb
                    ? 60.0
                    : MediaQuery.of(context).size.height,
                child: ListView(
                    scrollDirection: position == pt || position == pb
                        ? Axis.horizontal
                        : Axis.vertical,
                    children: btnsBar.map((bt) {
                      btnsBar.indexOf(bt) == 0
                          ? check.add(true)
                          : check.add(false);

                      return Padding(
                        padding: EdgeInsets.only(
                          top: position == pr ? 10.0 : 0.0,
                          bottom: position == pl ? 10.0 : 0.0,
                          right: position == pt ? 10.0 : 0.0,
                          left: position == pb ? 10.0 : 0.0,
                        ),
                        child: btn(bt.icon, bt.title, btnsBar.indexOf(bt)),
                      );
                    }).toList()),
                duration: Duration(milliseconds: 300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
