part of '../home_screen.dart';



// still to be implemented 💤 😴
class _HomeBanner extends StatelessWidget {
  const _HomeBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 30.h,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Utils.getAssetPNGPath("home_banner")),
          fit: BoxFit.cover,  
          alignment: Alignment.topCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: "Hi, Ahmed 👋🏿",
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
          Gap(4),
          AppText(
            title: "Welcome to your dashboard",
            style: TextStyle(fontSize: 16.sp, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
