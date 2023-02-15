import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

logout() async {
  try {
    await UserApi.instance.logout();
    print('Logout Success');
  } catch(e) {
    print(e);
  }
}
