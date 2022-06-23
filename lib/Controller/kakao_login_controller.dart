import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:front/Connect/user_provider.dart';
import 'package:front/Model/user/token_request.dart';
import 'package:front/Service/auth_service.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class KakaoLoginController extends GetxController {
  final _userProvider = Get.put(UserProvider());
  final _authService = Get.put(AuthService());

  Future<bool> _postLogin(OAuthToken token) async {
    var req = TokenRequest(kakaoToken: token.accessToken);
    var res = await _userProvider.login(req);
    return res.isOk && res.body['sign'];
  }

  // 사용자 정보 처리 (DB 전송 등)
  void _get_user_info(OAuthToken token) async {
    try {
      User user = await UserApi.instance.me();
      EasyLoading.dismiss();
      print('사용자 정보 요청 성공'
          '\n회원번호: ${user.id}'
          '\n닉네임: ${user.kakaoAccount?.profile?.nickname}');
      _authService.token = token;
      if (await _postLogin(token)) {
        Get.offAllNamed('/catMap');
        return;
      }
      Get.offAndToNamed('/insertInfo');
    } catch (error) {
      print('사용자 정보 요청 실패 $error');
    }
  }

  void login() async {
    if (await isKakaoTalkInstalled()) {
      try {
        // 카카오 로그인 성공
        await _loginTalk();
      } catch (error) {
        // 카카오 웹으로 로그인
        EasyLoading.dismiss();
        print('카카오톡으로 로그인 실패 $error');
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        await _loginAccount();
      }
    } else {
      // 카카오 웹으로 로그인
      await _loginAccount();
    }
  }

  Future<void> _loginTalk() async {
    var token = await UserApi.instance.loginWithKakaoTalk();
    EasyLoading.show(status: '로그인중...');
    print('카카오톡으로 로그인 성공');
    _get_user_info(token);
  }

  Future<void> _loginAccount() async {
    try {
      var token = await UserApi.instance.loginWithKakaoAccount();
      EasyLoading.show(status: '로그인중...');
      print('카카오계정으로 로그인 성공');
      _get_user_info(token);
    } catch (error) {
      EasyLoading.dismiss();
      print('카카오계정으로 로그인 실패 $error');
    }
  }
}
