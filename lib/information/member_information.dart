import '../lists/member_list.dart';

/* class MemberInformation extends MemberList {
  static final List<MemberList> items = [
    MemberList(
      name: 'Pedro Ventura',
      id: '93155',
      photo: 'EU.jpg',
    ),
  ];
}
 */

class MemberInformation extends MemberList {
  static final MemberList memberOne = MemberList(
    name: 'Pedro Ventura',
    id: '93155',
    photo: 'EU.jpg',
  );

  static MemberList oneItem() {
    return memberOne;
  }
}
