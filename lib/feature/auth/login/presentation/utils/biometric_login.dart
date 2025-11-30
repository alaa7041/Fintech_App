part of '../screens/login_screen.dart';

class _BiometricLogin extends StatelessWidget {
  const _BiometricLogin();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => RouteManager.navigateTo(FingrprintScreen()),
          child: SvgPicture.asset(Utils.getImagesSVGPath("fingrprint")),
        ),
        Gap(60),
        GestureDetector(
          onTap: () => RouteManager.navigateTo(FaceIdScreen()),
          child: SvgPicture.asset(Utils.getImagesSVGPath("face_id")),
        ),
      ],
    );
  }
}
