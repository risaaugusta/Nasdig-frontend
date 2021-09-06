library my_prj.globals;

import 'dart:io';
import 'dart:convert';

enum Environment { staging, production }

Environment env = Environment.staging;

bool debugMode = env == Environment.production ? false : true;

String beHost = env == Environment.production ? beProdHost : beStagHost;
String apiHost = env == Environment.production ? apiProdHost : apiStagHost;
String feHost = env == Environment.production ? feProdHost : feStagHost;

String appName = 'Pegassus';
String clientName = 'Partai NasDem';

String debugEmail = 'prasetyo.mailbox@gmail.com';
String debugPassword = 'Merdeka123~';

String debugEmailRegister = 'NasdemTestReg@mailinator.com';
//String debugEmail = debugEmailRegister;
//String debugPassword = 'Merdeka123~';

String username = env == Environment.production
    ? 'GENI_PRODUCTION_USERNAME'
    : 'GENI_DEV_USERNAME';
String password = env == Environment.production
    ? 'GENI_PRODUCTION_PASSWORD'
    : 'GENI_DEV_PASSWORD';
String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

// update store
String appStoreAppId = '1448961754';
String playSoreAppId = 'com.arda.nasdemdigital';
String appId = Platform.isIOS ? appStoreAppId : playSoreAppId;
String appStoreUrl = 'https://itunes.apple.com/us/app/id$appId';
String playStoreUrl = 'https://play.google.com/store/apps/details?id=$appId';
String storeUrl = Platform.isIOS ? appStoreUrl : playStoreUrl;

// global msg
String msgFailedLoadData = 'Gagal mengakses data.';
String msgNoInternet = 'Tidak ada koneksi internet.';
String msgUseOfflineData = 'Menggunakan data offline.';
String msgTapToTryAgain = 'Coba lagi';

String xSourceChannel = Platform.isIOS ? 'MOBILE iOS' : 'MOBILE Android';

// Keys to store and fetch data from SharedPreferences
String usernameKey = 'username';
String nameKey = 'name';
String authTokenKey = 'authToken';
String initialsKey = 'initials';
String gridMenuKey = 'grid_menu_key';
String verifiedKey = 'verified';

String beLocalHost = 'http://localhost:3000';
String feLocalHost = 'https://digital.nasdem.id/';
String apiLocalHost = '$beLocalHost/v1';

String beStagHost = 'https://barito.masmadmad.com/hayamwuruk';
String feStagHost = 'https://digital.nasdem.id';
String apiStagHost = '$beStagHost/v1';

String beProdHost = 'https://mahakam.masmadmad.com/hayamwuruk';
String feProdHost = 'https://digital.nasdem.id';
String apiProdHost = '$beProdHost/v1';

String epFeContentPage = '$feHost/p';
String epFeTerms = 'https://nasdem.id/syarat-kondisi';
String epFePrivacy = 'https://nasdem.id/privasi';

String epUserLogin = '$apiHost/user/auth/login';
String epUserInfo = '$apiHost/user/me';
String epUserInfoById = '$apiHost/user/detail';
String epAccountCheck = '$apiHost/user/accountcheck';
String epAccountCheckOtp = '$apiHost/user/accountcheck/otp';
String epRegisterSubmit = '$apiHost/user/register';

String epForgotPassword = '$apiHost/user/auth/forgetpassword';
String epForgotPasswordComplete =
    '$apiHost/user/auth/forgetpassword/confirmation';

String epChangePassword = '$apiHost/user/auth/changepassword';

String epChangeProfile = '$apiHost/donor/change/profile';
String epChangeProfileComplete = '$apiHost/donor/change/profile/complete';

String epNews = '$apiHost/news';
String epMessage = '$apiHost/message';
String epMessageSetOpened = '$apiHost/message/opened';
String epVoter = '$apiHost/user/referal';

String epVoterVerification = '$apiHost/user/verification';
String epVoterVerificationSubmit = '$apiHost/user/verification/submit';
String epVoterVerificationApprove = '$apiHost/user/verification/approve';

String epVoterVerificationCheck = '$apiHost/user/verification/check';

String epDonorRegisterDevice = '$apiHost/app/device/register';
String epUploadImage = '$apiHost/app/uploader/assets';

String epLocationProvince = '$apiHost/location/province';
String epLocationKabupatenByProvinceId = '$apiHost/location/province/city';
String epLocationKecamatanByKabupatenId = '$apiHost/location/city/subdistrict';
String epLocationKelurahanByKecamatanId =
    '$apiHost/location/subdistrict/village';

//Map<String, dynamic> debugData = {
//  'name': 'Arie Prasetyo',
//  'email': 'Arie.Prasetyo@mailinator',
//};
