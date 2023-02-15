import 'package:dblin_app/repository/user_repository.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

login() async {
  try {
    if(await isKakaoTalkInstalled()) {
      await UserApi.instance.loginWithKakaoTalk();
    } else {
      await UserApi.instance.loginWithKakaoAccount();
    }
    User user = await UserApi.instance.me();
    var response = await findByID(user.id.toString());
    if(response['result'] == 'NotFound') {
      return enroll(user.id.toString());
    } else {
     return;
    }
  } catch(e) {
    print(e);
  }
}

enroll(String id) async {
  return await create(id);
}
