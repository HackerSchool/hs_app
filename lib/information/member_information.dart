import '../lists/member_list.dart';

class MemberInformation extends MemberList {
  static final List<MemberList> items = [
    for (int i = 0; i < 20; i++)
      MemberList(
        name: "Pedro Ventura",
        id: "93155",
        photo: "EU.jpg",
      ),
    MemberList(
      name: 'Eu estou aqui',
      id: '93155',
      photo: 'hs_logo.png',
    ),
  ].shuffleList();
  static MemberList oneItem() {
    return items[0];
  }

  static List<MemberList> allItems() {
    return items;
  }
}

extension ShuffleList<T> on List<T> {
  List<T> shuffleList() {
    this.shuffle();
    return this;
  }
}
