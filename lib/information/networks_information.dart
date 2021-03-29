import '../lists/social_networks.dart';

class MemberInformation extends NetworksList {
  static final NetworksList memberOne = NetworksList(
    instagram: 'https://www.instagram.com/hackerschool_ist/',
    facebook: 'https://www.facebook.com/groups/HackerSchoolIST',
    linkedin: 'https://www.linkedin.com/company/hackerschool/mycompany/',
  );

  static NetworksList oneItem() {
    return memberOne;
  }
}
