part of '../login_screen.dart';

class _BiometricLogin extends StatelessWidget {
  const _BiometricLogin();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(Utils.getImagesSVGPath("fingrprint")),
        ),
        Gap(60),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(Utils.getImagesSVGPath("face_id")),
        ),
      ],
    );
  }
}
