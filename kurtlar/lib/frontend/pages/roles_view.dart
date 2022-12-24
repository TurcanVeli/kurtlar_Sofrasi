import 'package:flutter/material.dart';

import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/components/button.dart';
import 'package:kurtlar/frontend/pages/starting_view.dart';
import '../../backend/roles/BaseRole.dart';
import '../base/widget_base.dart';
import '../constant/constant.dart';
import 'package:vector_math/vector_math.dart' as math;

class rolesPage extends StatefulWidget {
  const rolesPage({super.key});

  @override
  State<rolesPage> createState() => _rolesPageState();
}

class _rolesPageState extends BaseState<rolesPage> {
  void _rotateDialog(String Header, String Body) {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        return Transform.rotate(
          angle: math.radians(a1.value * 360),
          child: _dialog(ctx, Header, Body),
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
        leading: Icon(Icons.arrow_back),
        elevation: 15,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: dynamicHeight(0.02),
          ),
          Container(
            height: dynamicHeight(0.2),
            child: RolesRow(ordinary),
          ),
          Container(
            height: dynamicHeight(0.2),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: TeamNameColumn(translate(context).govteam),
            ),
          ),
          Container(
            height: dynamicHeight(0.2),
            color: Colors.white,
            child: RolesRow(deepgoverment),
          ),
          Container(
            height: dynamicHeight(0.2),
            color: Colors.white,
            child: TeamNameColumn(translate(context).mafiateam),
          ),
          Container(
            height: dynamicHeight(0.2),
            color: Colors.white,
            child: RolesRow(mafia),
          ),
          SizedBox(
            height: dynamicHeight(0.02),
          ),
          BottomButtonContainerContiune(dynamicHeight(0.08), translate(context).contiune),
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
        Expanded(
          flex: 5,
          child: InkWell(
              onTap: () {
                _rotateDialog(roles[0].GetName, roles[0].GetRoleDefiniton);
              },
              child: RoleContainer(roles[0])),
        ),
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 5,
          child: InkWell(
              onTap: (() {
                _rotateDialog(roles[1].GetName, roles[1].GetRoleDefiniton);
              }),
              child: RoleContainer(roles[1])),
        ),
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 5,
          child: InkWell(
              onTap: (() {
                _rotateDialog(roles[2].GetName, roles[2].GetRoleDefiniton);
              }),
              child: RoleContainer(roles[2])),
        ),
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
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }

  Column RoleContainerInsideColumn(Role role) {
    return Column(
      children: [
        Expanded(flex: 2, child: RoleNameText(role)),
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 2,
          child: CountRow(role),
        ),
      ],
    );
  }

  Row CountRow(Role role) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
            onTap: () {
              setState(() {
                role.decrase();
              });
            },
            child: OperationContainer(" - ")),
        RoleCountText(role),
        InkWell(
            onTap: () {
              setState(() {
                role.increment();
              });
            },
            child: OperationContainer(" + ")),
      ],
    );
  }

  Text RoleCountText(Role role) => Text(role.Getcount.toString());

  Container OperationContainer(String operation) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(90)),
      child: Text(
        operation,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Text RoleNameText(Role role) => Text(role.GetName);
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
            style: TextStyle(color: Colors.red, fontSize: 17),
          ))
    ],
  );
}
