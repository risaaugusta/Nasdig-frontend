part of '../widgets.dart';

class WizardHeader extends StatelessWidget {
  final int currentPage;
  final List<String> listFormTitle;

  WizardHeader({
    this.currentPage,
    this.listFormTitle,
  });

  @override
  Widget build(BuildContext context) {
    double radius = 23;
    double headerPadd = 30;
    double lineBarheight = 4;
    double screenWidth = MediaQuery.of(context).size.width;
    double indicatorBlockWidth = screenWidth / 4 - headerPadd / 2;

    Widget wizardIndicator(String title, int id, int currentPage) {
      double adjustedRadius = radius - (id < currentPage ? 0 : 0);
      return Container(
        width: indicatorBlockWidth,
        child: Column(
          children: <Widget>[
            Container(
              height: radius,
              width: radius,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(adjustedRadius),
                child: Container(
                  color: id < currentPage ? nasdemBlue : nasdemLightBlue,
                  child: id <= currentPage
                      ? Container(
                          margin: EdgeInsets.all(6.5),
                          height: radius / 2,
                          width: radius / 2,
                          decoration: BoxDecoration(
                            color: nasdemBlue,
                            borderRadius: BorderRadius.circular(radius / 2),
                            border: Border.all(
                              width: 1.5,
                              color:
                                  id < currentPage ? Colors.white : nasdemBlue,
                            ),
                          ),
                        )
                      : Container(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                title,
                style: TextStyle(
                    color: id <= currentPage ? nasdemBlue : nasdemLightBlue2),
              ),
            )
          ],
        ),
      );
    }

    Widget lineBar() {
      return Container(
        height: lineBarheight,
        width: indicatorBlockWidth * 3,
        color: nasdemLightBlue,
      );
    }

    return Material(
      color: Colors.white,
//      elevation: 5,
      shape: BeveledRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.zero,
      ),
      child: Container(
        padding: EdgeInsets.only(
            top: 14, bottom: 8, left: headerPadd, right: headerPadd),
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: radius / 2 - lineBarheight / 2,
              left: indicatorBlockWidth / 2,
              child: lineBar(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: listFormTitle.asMap().entries.map((entry) {
                int idx = entry.key;
                String val = entry.value;
                return wizardIndicator(val, idx, currentPage);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
