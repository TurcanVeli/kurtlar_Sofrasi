import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/components/button.dart';
import 'package:kurtlar/frontend/pages/starting_view.dart';
import '../../backend/models/BaseRole.dart';
import '../base/color_constants.dart';
import '../base/widget_base.dart';
import '../models/roles.dart';
import 'package:vector_math/vector_math.dart' as math;

import '../models/users.dart';


/* People are going to choose which roles are going to include in the game */

class rolesPage extends StatefulWidget {
  @override
  State<rolesPage> createState() => _rolesPageState();
}

class _rolesPageState extends BaseState<rolesPage> {
  
 /* We are going to use count of player with USER service file */
  int UsersCount      = USERS.length;
  int addedRoleCount  = 0;
 /* count of mafia can not be 0. All game have to contain at least 1 mafia player. */
  int addedmafiacount = 0;

  

  @override
  void initState() {
    
    Off.SetCount(UsersCount);
    for (int i = 0; i<UsersCount; i++){
      addedRoles.add(Off);
    }
    super.initState();
  }

  void roleCountIncrement(Role role){
    setState(() {
      if(Off.Getcount > 0){
        role.increment();
        Off.count--;
        addedRoles.remove(Off);
        if (role.GetTeam == "Mafya"){
          addedmafiacount++;
        }
        addedRoles.add(role);
        addedRoleCount++;
        }
    });
  }

  void roleCountDecrement(Role role){
    setState(() {
      role.decrase();
      Off.count++;
      addedRoles.add(Off);
       if (role.GetTeam == "Mafya"){
          addedmafiacount--;
        }
        addedRoles.remove(role);
      addedRoleCount--;
    });
  }

  void _scaleDialog(String header, String body) {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: _dialog(ctx, header, body),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate(context).roles),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: ColorConstant.instance.black,
        elevation: 5,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: dynamicHeight(0.02),
            child: DecoratedBox(
              decoration: BoxDecoration(color: ColorConstant.instance.white),
            ),
          ),
          Container(
            height: dynamicHeight(0.2),
            child: RolesRow(ordinary),
            color: ColorConstant.instance.white,
          ),
          Container(
            height: dynamicHeight(0.2),
            color: ColorConstant.instance.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: TeamNameColumn(translate(context).govteam),
            ),
          ),
          Container(
            height: dynamicHeight(0.2),
            color: ColorConstant.instance.white,
            child: RolesRow(deepgoverment),
          ),
          Container(
            height: dynamicHeight(0.2),
            color: ColorConstant.instance.white,
            child: TeamNameColumn(translate(context).mafiateam),
          ),
          Container(
            height: dynamicHeight(0.2),
            color: ColorConstant.instance.white,
            child: RolesRow(mafia),
          ),
          SizedBox(
            height: dynamicHeight(0.02),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: ColorConstant.instance.white,
              ),
            ),
          ),
          BottomButtonContainerContiune(
            context: context,
            color: addedmafiacount == 0? ColorConstant.instance.grey: null ,
            height: dynamicHeight(0.08),
            //Translate edilecek
            buttonText: addedmafiacount == 0? "En az 1 mafya ekleyin": translate(context).contiune,
            where:addedmafiacount == 0? null :starting(),//Where ve function null olursa hiç bir şey çalışmaz bu buttonda
          ),
        ],
      ),
    );
  }

  Column TeamNameColumn(String TeamName) {
    return Column(
      children: [
        Expanded(flex: 5, child: SizedBox()),
        Expanded(flex: 4, child: BracketText()),
        Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: 4, child: TeamNameText(TeamName)),
        Expanded(flex: 5, child: SizedBox()),
      ],
    );
  }

  Text TeamNameText(String TeamName) => Text(
        TeamName,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      );

  Text BracketText() => Text("________________",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ));

  Row RolesRow(List<Role> roles) {
    return Row(
      children: [
        Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: 5, child: RoleContainer(roles[0])),
        Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: 5, child: RoleContainer(roles[1])),
        Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: 5, child: RoleContainer(roles[2])),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }

  Container RoleContainer(Role role) {
    return Container(
      height: dynamicHeight(0.2),
      width: 50,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: RoleContainerInsideColumn(role),
        ),
      ),
      decoration: BoxDecoration(
          color: ColorConstant.instance.white,
          border: Border.all(
            color: role.Getcount == 0
                ? ColorConstant.instance.Catskill_White
                : ColorConstant.instance.black,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }

  Column RoleContainerInsideColumn(Role role) {
    return Column(
      children: [
        Expanded(flex:4,child: Image.asset(role.imagePath)),
        Expanded(
            flex: 3,
            child: InkWell(
                onTap: (() {
                  _scaleDialog(role.GetName, role.GetRoleDefiniton);
                }),
                child: RoleNameContainer(role))),
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 3,
          child: CountRow(role),
        ),
      ],
    );
  }

  Container RoleNameContainer(Role role) =>
      Container(color: ColorConstant.instance.white, child: RoleNameText(role));

  Row CountRow(Role role) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
            onTap: () {
              setState(() {
                roleCountDecrement(role);
              });
            },
            child: role.GetName=="Memur" || role.Getcount == 0? SizedBox():OperationContainer(" - ")),
        RoleCountText(role),
        InkWell(
            onTap: () {
              setState(() {
                roleCountIncrement(role);
              });
            },
            //ToDo Textler düzelecek
            child: role.GetName=="Memur" || role.Getcount == 1 && role.GetName != "Mafya Adamı"? SizedBox():OperationContainer(" + ")),
      ],
    );
  }

  Text RoleCountText(Role role) => Text(role.Getcount.toString());

  Container OperationContainer(String operation) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstant.instance.red,
          borderRadius: BorderRadius.circular(90)),
      child: Text(
        operation,
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Text RoleNameText(Role role) => Text(role.GetName,style: TextStyle(fontWeight: FontWeight.bold),);
}

Widget _dialog(BuildContext context, String header, String Body) {
  return AlertDialog(
    title: Text(header),
    content: Text(Body),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            translate(context).ok,
            style: TextStyle(color: ColorConstant.instance.red, fontSize: 17),
          ))
    ],
  );
}
