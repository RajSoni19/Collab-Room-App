import 'package:colab_room/resources/auth_methods.dart';
import 'package:colab_room/resources/firestore_methods.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods=FirestoreMethods();
  
  Future<void> createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username='',
  }) async {
    try {
      String name;
      if(username.isEmpty){
        name= _authMethods.user.displayName!;
      }else{
        name=username;
      }
      var options = JitsiMeetConferenceOptions(
        room: roomName,
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
        },
        featureFlags: {
          "unsaferoomwarning.enabled": false,
        },
        userInfo: JitsiMeetUserInfo(
          displayName: _authMethods.user.displayName ?? 'Guest',
          email: _authMethods.user.email ?? '',
          avatar: _authMethods.user.photoURL ?? '',
        ),
      );

      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet().join(options);
    } catch (error) {
      print("error: $error");
    }
  }
}