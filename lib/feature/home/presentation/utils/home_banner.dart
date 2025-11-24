part of '../home_screen.dart';

// still to be implemented 💤 😴
class _HomeBanner extends StatelessWidget {
  const _HomeBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(
          image: AssetImage(Utils.getAssetPNGPath("home_banner")),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            title: "Total Value",
            style: TextStyle(
              fontSize: 14.sp,
              color: Color(0xffF5F8FE),
              fontWeight: FontWeightsHelper.semiBold,
            ),
          ),
          Gap(10),
          AppText(
            title: "143,421.20 USD",
            style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeightsHelper.bold),
          ),
          Gap(14),
          AppText(
            title: "+2.5% (305.20 USD) Today",
            style: TextStyle(
              fontSize: 14.sp,
              color: Color(0xff69D895),
              fontWeight: FontWeightsHelper.regular,
            ),
          ),
        ],
      ),
    );
  }
}
