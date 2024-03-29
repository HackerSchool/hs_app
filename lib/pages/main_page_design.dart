import 'package:flutter/material.dart';
import 'package:hsapp/lists/project_list.dart';
import 'package:hsapp/lists/menu_list.dart';
import 'package:hsapp/lists/announcement_list.dart';
import 'package:hsapp/lists/member_list.dart';
import 'package:hsapp/design/letters_design.dart';
import 'package:hsapp/design/colors.dart';
import 'package:hsapp/pages/one_announcement_page.dart';
import 'package:hsapp/pages/project_page.dart';
import 'package:hsapp/pages/login.dart';
import 'package:hsapp/pages/members.dart';
import 'package:hsapp/pages/search_for_a_skill.dart';
import 'package:hsapp/pages/links&forms.dart';
import 'package:hsapp/pages/settings_page.dart';
import 'package:hsapp/pages/future_ideas.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPageDesign extends StatelessWidget {
  final List<AnnouncementInformation> _announcementInformations;
  final List<MenuList> _menuList;
  final List<MemberList> _memberList;
  final List<ProjectInformation> _projectList;

  const MainPageDesign(
    this._announcementInformations,
    this._menuList,
    this._memberList,
    this._projectList,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: announcementGrey,
        appBar: _appBarFunction(context),
        body: Padding(
          padding: const EdgeInsets.all(3), //mete o espaço em cima
          child: ListView.builder(
            itemCount: this._announcementInformations.length,
            itemBuilder: _designPage,
          ),
        ),
        drawer: _drawerFunction(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: backgroundGreen,
          elevation: 10.0,
          child: Container(
            child: Icon(
              Icons.add_rounded,
              size: 50.0,
              color: textGrey,
            ),
          ),
          onPressed: () {
            _addAnnouncementPage(context);
          },
        ));
  }

  Widget _appBarFunction(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundGreen,
      //Alinhar ao centro!
      title: Padding(
        padding: const EdgeInsets.all(32.0),
        child: InkWell(
          child: Image.asset(
            'assets/hs_logo.png',
            alignment: Alignment.center,
            fit: BoxFit.fitWidth,
            color: Colors.white,
          ),
          onTap: () async {
            final Uri url = Uri.parse("http://hackerschool.io/");
            if (!await launchUrl(url)) {
              throw 'Could not launch $url';
            }
          },
        ),
      ),
      actions: <Widget>[
        Padding(
          //REVER COLOCAÇÃO
          padding: EdgeInsets.only(right: 10),
          child: InkWell(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/${_memberList[0].photo}'),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OneMemberPage(_memberList[0]),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _designPage(BuildContext context, int index) {
    var announcementInformations = this._announcementInformations[index];
    return Card(
        child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'http://hackerschool.tecnico.ulisboa.pt/logo.png'),
            ),
            tileColor: backgroundGrey,
            contentPadding: EdgeInsets.all(10),
            title: _oneAnnouncementTitle(announcementInformations),
            subtitle: _oneAnnouncementDate(announcementInformations),
            trailing: _oneAnnouncementPublicationDate(announcementInformations),
            onTap: () {
              _openAnnouncementPage(context, announcementInformations);
            }));
  }

  Widget _drawerFunction(BuildContext context) {
    return Drawer(
      //TENHO DE VER O ICONE E A POSIÇÃO, TAMANHO E COR
      child: ListView.builder(
        itemCount: this._menuList.length,
        itemBuilder: _designMenu,
      ),
    );
  }

  Widget _designMenu(BuildContext context, int index) {
    var menuInformations = this._menuList[index];
    if (index == 0) {
      return DrawerHeader(
        decoration: BoxDecoration(
          color: backgroundGrey,
        ),
        margin: const EdgeInsets.only(bottom: 0), //espaço entre header e o menu
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              //alignment: Alignment(-1, 0.2),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/${_memberList[0].photo}'),
                radius: 40.0,
              ),
            ),
            Align(
              //alignment: Alignment(0, 0),
              alignment: Alignment.centerLeft + Alignment(1.4, -0.2),
              child: Text(
                _memberList[0].name,
                style: TextStyle(color: textGrey, fontSize: 20.0),
              ),
            ),
            Align(
              //alignment: Alignment(-0.35, 0.4),3
              alignment: Alignment.centerLeft + Alignment(0.9, 0.2),
              child: Text(
                'ist1${_memberList[0].id}',
                style: TextStyle(color: textGrey, fontSize: 10.0),
              ),
            ),
          ],
        ),
      );
    } else {
      return ListTile(
        tileColor: backgroundGrey,
        leading: Icon(
          menuInformations.icon,
          color: textGrey,
        ),
        title: Text(
          menuInformations.title,
          style: Styles.textDesign,
        ),
        onTap: () {
          _choosePageToOpen(context, _projectList, index);
        },
      );
    }
  }

  Widget _oneAnnouncementTitle(
      AnnouncementInformation announcementInformation) {
    return Text(
      announcementInformation.title,
      style: Styles.titleDesign,
    );
  }

  Widget _oneAnnouncementDate(AnnouncementInformation announcementInformation) {
    return Text(
      announcementInformation.eventDate,
      style: Styles.textDesign,
    );
  }

  Widget _oneAnnouncementPublicationDate(
      AnnouncementInformation announcementInformation) {
    return Text(
      'Published: \n ${announcementInformation.publicationDate}',
      style: Styles.publicationDateDesign,
    );
  }

  void _openEmptyPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: backgroundGrey,
          appBar: AppBar(
            backgroundColor: backgroundGreen,
          ),
        );
      },
    ));
  }

  void _openAnnouncementPage(
      BuildContext context, AnnouncementInformation announcementInformations) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OneAnnouncementPage(announcementInformations)));
  }

  void _addAnnouncementPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddOneAnnouncement()));
  }

  void _openProjectsPage(BuildContext context,
      List<ProjectInformation> projectList, List<MemberList> memberList) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProjectsPage(projectList, memberList)));
  }

  void _openMembersPage(BuildContext context, List<MemberList> memberList) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MembersPage(memberList)));
  }

  void _openLoginPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void _openSearchForASkillPage(
      BuildContext context, List<MemberList> memberList) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchForASkillPage(memberList)));
  }

  void _openLinksPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LinksPage()));
  }

  void _openSettingsPage(BuildContext context, List<MemberList> memberList) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SettingsPage()));
  }

  void _openFutureIdeasPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FutureIdeasPage()));
  }

  void _choosePageToOpen(
      BuildContext context, List<ProjectInformation> projectList, int index) {
    if (index == 1) {
      _openLoginPage(context);
    } else if (index == 2) {
      _openProjectsPage(context, _projectList, _memberList);
    } else if (index == 3) {
      _openSearchForASkillPage(context, _memberList);
    } else if (index == 4) {
      _openMembersPage(context, _memberList);
    } else if (index == 5) {
      _openSettingsPage(context, _memberList);
    } else if (index == 6) {
      _openLinksPage(context);
    } else if (index == 7) {
      _openFutureIdeasPage(context);
    } else {
      _openEmptyPage(context);
    }
  }
}
