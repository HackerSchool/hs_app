import 'package:flutter/material.dart';
import '../lists/member_list.dart';
import '../design/colors.dart';
import '../design/letters_design.dart';
import '../pages/members.dart';

class SearchForASkillPage extends StatefulWidget {
  final List<MemberList> _membersList;

  SearchForASkillPage(this._membersList);

  @override
  _SearchForASkillState createState() => _SearchForASkillState(_membersList);
}

class _SearchForASkillState extends State<SearchForASkillPage> {
  final List<MemberList> _memberList;
  _SearchForASkillState(this._memberList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      appBar: AppBar(
        backgroundColor: backgroundGreen,
        title: Text(
          'Search For A Skill',
          style: Styles.titleDesign,
        ),
      ),
      /* body: Padding(
            padding: const EdgeInsets.all(20), //mete o espaço em cima
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
              ),
            )) */
      floatingActionButton: FloatingActionButton(
        backgroundColor: backgroundGreen,
        child: Icon(
          Icons.search,
          color: textGrey,
        ),
        onPressed: () async {
          await showSearch<String>(
            context: context,
            delegate: NameSearch(names, this._memberList),
          );
        },
      ),
    );
  }
}

const names = [
  "C",
  "Dart",
  "Flutter",
  "Java",
  "C++",
  "C#",
  "Python",
  "JavaScript",
  "Perl",
  "Assembly",
  "PHP",
  "Matlab",
  "Ltspice",
  "Ruby",
  "Swift",
  "Visual Basic",
  "Objective-C",
  "Microsoft Office"
];

class NameSearch extends SearchDelegate<String> {
  final List<String> names;
  final List<MemberList> _memberList;
  String result;

  NameSearch(this.names, this._memberList);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, result);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = names.where((name) {
      return name.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            suggestions.elementAt(index),
          ),
          onTap: () {
            result = suggestions.elementAt(index);
            _oneSkillPage(context, this._memberList, result);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = names.where((name) {
      return name.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            suggestions.elementAt(index),
          ),
          onTap: () {
            result = suggestions.elementAt(index);
            _oneSkillPage(context, this._memberList, result);
            //query = suggestions.elementAt(index);
          },
        );
      },
    );
  }

  void _oneSkillPage(
      BuildContext context, List<MemberList> _memberList, String searched) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: backgroundGrey,
          appBar: AppBar(
              backgroundColor: backgroundGreen,
              title: Text(
                searched,
                style: Styles.titleDesign,
              )),
          body: Padding(
            padding: const EdgeInsets.all(3),
            child: ListView.builder(
              itemCount: this._memberList.length,
              itemBuilder: _designPage,
            ),
          ),
        );
      },
    ));
  }

  Widget _designPage(BuildContext context, int index) {
    var member = this._memberList[index];
    return Card(
        child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/${member.photo}"),
            ),
            tileColor: backgroundGrey,
            contentPadding: EdgeInsets.all(10),
            title: _onePersonTitle(member),
            //subtitle: _oneAnnouncementDate(announcementInformations),
            //trailing: _oneAnnouncementPublicationDate(announcementInformations),
            onTap: () {
              _openMemberPage(context, member);
            }));
  }

  Widget _onePersonTitle(MemberList member) {
    return Text(
      member.name,
      style: Styles.titleDesign,
    );
  }

  void _openMemberPage(BuildContext context, MemberList member) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OneMemberPage(member)));
  }
}
