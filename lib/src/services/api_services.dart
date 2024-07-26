import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:molz/src/local_storage/auth_tokens_prefs/shared_prefs.dart';
import 'package:molz/src/utils/custom_toasts.dart';
import 'package:molz/src/utils/logger.dart';

/// TODO: Commented 3 times "(userToken = await AccountManager.getToken();)"

enum Result { loading, successful, error, networkError, idle }

class Connection {
  static Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      debug("Internet not Connected !!!!");
      showToastError("Please check your Internet connection.");
      return false;
    }
    debug('last statement of connection');
    return true;
  }
}

enum Status {
  loading,
  successful,
  error,
  networkError,
  idle,
  tokenExpired,
  code400,
}

// enum UserLogged { loggedIn, notLoggedIn, idleUser }

bool userIsLoggedIn = false;

class ApiCall {
  static get(
    String fullUrl, {
    Map<String, dynamic>? queryParam,
    success = (dynamic),
    failure = (String),
    error400 = (dynamic),
  }) async {
    fly("Get is called api is $fullUrl");
    if (!await Connection.isConnected()) {
      return failure("No Internet");
    }
    String? userToken;
    try {
      await AccountManager.initAccountData();
      userToken = await AccountManager.getToken();
    } catch (ex) {
      debug(
          "******* User Not Authorized !!!!!!!!!!!@@@@@@@@@@@@@@@@@@@#######&&&&***************");
    }
    if (queryParam == null) {
      try {
        // String token = '';
        // UserLogged userCheckLogin = UserLogged.idleUser,

        if (userToken != null) {
          // token = base64Encode(
          //     latin1.encode('${accountModel.mobile}:${accountModel.token}'));
          debug('if Token is $userToken');
          final response = await http.get(
            Uri.parse(fullUrl),
            headers: <String, String>{
              "accept": "application/json",
              "Authorization": userToken
            },
          );

          if (response.statusCode == 200 || response.statusCode == 201) {
            try {
              success(response.body);
            } catch (ex) {
              debug(ex.toString());
            }
          } else if (response.statusCode == 401) {
            failure("token_not_valid");
          } else if (response.statusCode == 400) {
            error400(response.body);
          } else {
            failure(response.body);
          }
        } else {
          //Here Token is not available
          debug('else Token is $userToken');
          final response = await http.get(
            Uri.parse(fullUrl),
            headers: <String, String>{
              "accept": "application/json",
              "Authorization": "Bearer $userToken"
            },
          );

          if (response.statusCode == 200 || response.statusCode == 201) {
            try {
              success(response.body);
            } catch (ex) {
              debug(ex.toString());
            }
          } else if (response.statusCode == 401) {
            failure("token_not_valid");
          } else if (response.statusCode == 400) {
            error400(response.body);
          } else {
            failure(response.body);
          }
        }
      } catch (exc) {
        debug(exc.toString());
        failure(exc.toString());
      }
    } else {
      //query params is null
      try {
        debug('####################\n$fullUrl');
        debug(queryParam.toString());
        String? userToken;
        try {
          // userToken = await AccountManager.getToken();
        } catch (ex) {
          debug(
              "******* User Not Authorized !!!!!!!!!!!@@@@@@@@@@@@@@@@@@@#######&&&&***************");
        }

        if (userToken != null) {
          // token = base64Encode(
          //     latin1.encode('${accountModel.mobile}:${accountModel.token}'));
          debug('if 2 Token is $userToken');
          final uri = Uri.parse(
            fullUrl,
          ).replace(
            queryParameters: queryParam,
          );
          final response = await http.get(
            uri,
            headers: <String, String>{
              "accept": "application/json",
              "Authorization": "Bearer $userToken"
            },
          );
          if (response.statusCode == 200 || response.statusCode == 201) {
            try {
              success(response.body);
            } catch (ex) {
              debug(ex.toString());
            }
          } else if (response.statusCode == 401) {
            failure("token_not_valid");
          } else if (response.statusCode == 400) {
            error400(response.body);
          } else {
            failure(response.body);
          }
        } else {
          // Here Token is also not available
          debug('else 2 Token is $userToken');
          final uri = Uri.parse(
            fullUrl,
          ).replace(
            queryParameters: queryParam,
          );

          final response = await http.get(
            uri,
            headers: <String, String>{
              "accept": "application/json",
              "Authorization": "Bearer $userToken"
            },
          );

          if (response.statusCode == 200 || response.statusCode == 201) {
            try {
              success(response.body);
            } catch (ex) {
              debug(ex.toString());
            }
          } else if (response.body.contains("login_required") &&
              jsonDecode(response.body)['login_required'] == true) {
            error(
                "User Not Authorized and required token 22222 ********************");
            failure("User Not Authorized");
          } else if (response.statusCode == 401) {
            failure("token_not_valid");
          } else if (response.statusCode == 400) {
            error400(response.body);
          } else {
            failure(response.body);
          }
        }
      } catch (exc) {
        debug(exc.toString());
        failure(exc.toString());
      }
    }
  }

  static post(
    String fullUrl, {
    Map<String, dynamic> body = const {},
    success = (dynamic),
    error400 = (dynamic),
    failure = (String),
  }) async {
    fly("Post is called api is $fullUrl");
    if (!await Connection.isConnected()) {
      return failure("No Internet");
    }
    try {
      String? userToken;
      try {
        AccountManager.initAccountData();
        userToken = await AccountManager.getToken();
      } catch (ex) {
        debug(
            "******* User Not Authorized !!!!!!!!!!!@@@@@@@@@@@@@@@@@@@#######&&&&***************");
        // return failure("No Internet");
      }
      if (userToken != null) {
        // token = base64Encode(
        //     latin1.encode('${accountModel.mobile}:${accountModel.token}'));
        debug(
            'Post Method call full url is below ((((((((())))))))\n${Uri.parse(fullUrl)}');
        debug("token is $userToken");
        String jsonString = jsonEncode(body);
        final response = await http.post(
          Uri.parse(fullUrl),
          body: jsonString,
          headers: <String, String>{
            // "accept": "application/json",
            'Content-Type': 'application/json',
            "Authorization": "Bearer $userToken"
          },
        );
        debug('Post method api call code is  ${response.statusCode}');
        if (response.statusCode == 200 || response.statusCode == 201) {
          try {
            debug(
                "Full url is $fullUrl and response is below\n${response.body}");
            success(response.body);
          } catch (e) {
            debug('try catch block exception is below if');
            debug(e.toString());
          }
        } else if (response.statusCode == 401) {
          failure("token_not_valid");
        } else if (response.statusCode == 400) {
          error400(response.body);
        } else {
          failure(response.body);
        }
      } else {
        debug("Token is not available here");
        debug(
            'Post Method call full url is below ((((((((())))))))\n${Uri.parse(fullUrl)}');
        // Uri.parse(fullUrl)
        String jsonString = jsonEncode(body);
        final response = await http.post(
          Uri.parse(fullUrl),
          body: jsonString,
          headers: <String, String>{
            'Content-Type': 'application/json',
            "Authorization": "Bearer $userToken"
          },
        );
        debug('Post method api call code is  ${response.statusCode}');
        if (response.statusCode == 200 || response.statusCode == 201) {
          try {
            debug(
                "Full url is $fullUrl and response is below\n${response.body}");
            success(response.body);
          } catch (e) {
            debug('try catch block exception is below else');
            debug(e.toString());
          }
        } else if (response.statusCode == 401) {
          failure("token_not_valid");
        } else if (response.statusCode == 400) {
          error400(response.body);
        } else {
          failure(response.body);
        }
      }
    } catch (ex) {
      failure(ex.toString());
    }
  }

  // // update the profile
  // static updateClientProfile({
  //   name = String,
  //   gender = String,
  //   dob = String,
  //   String? image,
  //   success = dynamic,
  //   failure = (String),
  // }) async {
  //   var data = {
  //     "name": name.toString(),
  //   };
  //
  //   String? token = '';
  //   if (!await Connection.isConnected()) {
  //     return failure("No Internet");
  //   }
  //   token = await AccountManager.getToken();
  //
  //   // token = base64Encode(
  //   //     latin1.encode('${accountModel!.mobile}:${accountModel.token}'));
  //   if (gender != null && gender.isNotEmpty) {
  //     data['gender'] = gender;
  //   }
  //   if (dob.toString().isNotEmpty) {
  //     data['dob'] = dob;
  //   }
  //   try {
  //     var headers = {'Authorization': "Bearer $token"};
  //     var request = http.MultipartRequest('POST', Uri.parse(Urls.updateClientProfile));
  //     if (image != null && image.isNotEmpty) {
  //       request.files.add(await http.MultipartFile.fromPath('profile_pic', image));
  //     }
  //     request.headers.addAll(headers);
  //     request.fields.addAll(data);
  //
  //     http.StreamedResponse response = await request.send();
  //
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       await response.stream.bytesToString().then(
  //               (value) => success(value));
  //     } else if (response.statusCode == 401) {
  //       failure("token_not_valid");
  //     }
  //     else {
  //       await response.stream.bytesToString().then((value) => failure(value));
  //     }
  //   } catch (e) {
  //     failure(e.toString());
  //   }
  // }
  //
  // // for send sms
  // static sendMessage({
  //   messageFrom = String,
  //   messageTo = String,
  //   bookingId = String,
  //   message = String,
  //   String? image,
  //   success = dynamic,
  //   error400 = (dynamic),
  //   failure = (String),
  // }) async {
  //
  //   //
  //
  //   // ApiCallMethods.post(Urls.sendMessage, body: {
  //   //   "message_from": clientId,
  //   //   "message_to": coachId,
  //   //   "booking_id": bookingId,
  //   //   "message": messageText,
  //   //   "message_file": imageFile,
  //   // }, success: (success) {
  //   //   debug("I am in success of send message api call and data is $success");
  //   //
  //   //   // socket work for message
  //   //   _sendMessageSocket(roomId!, _messageController.text, bookingId,
  //   //       getFormattedMessageTime(DateTime.now().toString()), "");
  //   // }, failure: (fail) {
  //   //   error("I am in fail resp in send message api call and data is $fail");
  //   // });
  //
  //   //
  //
  //
  //   Map<String, String> data = {
  //     "message_from": messageFrom.toString(),
  //     "message_to": messageTo.toString(),
  //     "booking_id": bookingId.toString(),
  //     "message" : message != null && message.isNotEmpty ? message : "",
  //   };
  //
  //   String? token = '';
  //   if (!await Connection.isConnected()) {
  //     return failure("No Internet");
  //   }
  //   token = await AccountManager.getToken();
  //
  //   // token = base64Encode(
  //   //     latin1.encode('${accountModel!.mobile}:${accountModel.token}'));
  //   ///
  //   // if (message != null && message.isNotEmpty) {
  //   //   data['message'] = message;
  //   // }
  //
  //   try {
  //     var headers = {'Authorization': "Bearer $token"};
  //     var request = http.MultipartRequest('POST', Uri.parse(Urls.sendMessage));
  //     if (image != null && image.isNotEmpty) {
  //       request.files.add(await http.MultipartFile.fromPath('message_file', image));
  //     }
  //     request.headers.addAll(headers);
  //     request.fields.addAll(data);
  //
  //     http.StreamedResponse response = await request.send();
  //
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       await response.stream.bytesToString().then(
  //               (value) => success(value));
  //     }
  //     // else if(response.statusCode == 400){
  //     //   error400(response.stream);
  //     // }
  //     else if (response.statusCode == 401) {
  //       failure("token_not_valid");
  //     }
  //     else {
  //       await response.stream.bytesToString().then((value) => failure(value));
  //     }
  //   } catch (e) {
  //     failure(e.toString());
  //   }
  // }
}

class HttpCall {
  static get(
    String apiUrl, {
    Map<String, dynamic> jsonData = const {},
    success = (dynamic),
    error400 = (dynamic),
    failure = (String),
    //required Map<String, String> body,
  }) async {
    // Encode the JSON data
    String jsonString = jsonEncode(jsonData);

    String? userToken;
    try {
      AccountManager.initAccountData();
      userToken = await AccountManager.getToken();
    } catch (ex) {
      debug('User Not Authorized');
    }
    // Make the POST request
    http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $userToken"
      },
    ).then((http.Response response) {
      if (response.statusCode == 200) {
        debug('POST request successful!');
        debug('Response: ${response.body}');
        //success(response.body);
      } else {
        debug('Failed to make the POST request. Error: ${response.statusCode}');
        failure(response.body);
      }
    }).catchError((error) {
      debug('Error during POST request: $error');
      failure(error.toString());
    });
  }

  static post(
    String apiUrl, {
    Map<String, dynamic> jsonData = const {},
    success = (dynamic),
    error400 = (dynamic),
    failure = (String),
    //required Map<String, String> body,
  }) async {
    // Encode the JSON data
    String jsonString = jsonEncode(jsonData);

    String? userToken;
    try {
      AccountManager.initAccountData();
      userToken = await AccountManager.getToken();
    } catch (ex) {
      debug('User Not Authorized');
    }
    debug('Url : $apiUrl');
    debug('body : $jsonString');
    debug('userToken : $userToken');
    // Make the POST request
    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonString,
      headers: <String, String>{
        'Content-Type': 'application/json',
        "Authorization": "$userToken"
      },
    ).then((http.Response response) {
      if (response.statusCode == 200) {
        debug('POST request successful!');
        debug('Response: ${response.body}');
        success(response.body);
      } else {
        debug('Failed to make the POST request. Error: ${response.statusCode}');
        failure(response.body);
      }
    }).catchError((error) {
      debug('Error during POST request: $error');
      failure(error.toString());
    });
  }
}
