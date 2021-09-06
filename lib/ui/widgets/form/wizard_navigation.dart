part of '../widgets.dart';


class WizardNavigation extends StatelessWidget {
  final int currentPage;
  final bool hideLeftNav;
  final bool hideRightNav;
  final VoidCallback onPressedPrev;
  final VoidCallback onPressedNext;
  final VoidCallback onSubmit;

  WizardNavigation({
    this.currentPage,
    this.hideLeftNav,
    this.hideRightNav,
    this.onPressedPrev,
    this.onPressedNext,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    double btnWidth = 145;

    return Container(
//      color: Colors.red.withOpacity(0),
//      height: 90,
      padding: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          hideLeftNav
              ? Container(
                  width: btnWidth,
                )
              : CommonOutlineButton(
                  text: 'Kembali',
                  width: btnWidth,
                  color: nasdemBlue,
                  onPressed: onPressedPrev,
                ),
          SizedBox(
            width: 30,
          ),
          hideRightNav
              ? CommonButton(
                  text: 'Kirim',
                  width: btnWidth,
                  onPressed: onSubmit,
                  color: nasdemGreen,
                )
              : CommonButton(
                  text: 'Berikutnya',
                  width: btnWidth,
                  onPressed: onPressedNext,
                ),
        ],
      ),
    );
  }
}
