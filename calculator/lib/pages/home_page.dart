import 'package:calculator/blocs/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        resizeToAvoidBottomInset: false,
        body: Consumer<HomeBloc>(
          builder: (context,HomeBloc hb,child) =>
           Column(
            children: [
                 Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Selector<HomeBloc,bool>(
                        selector: (context,bloc) => bloc.isNight,
                        shouldRebuild: (pre,next) => pre != next,
                        builder: (context,isNight,child) =>
                         Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 22,right: 20),
                            child: IconButton(
                              onPressed: (){
                                print("press change");
                                HomeBloc bloc = Provider.of(context,listen: false);
                                bloc.changeTheme(isNight == true ? "dark" : "light");
                              },
                              icon:
                              // isNight == false ? 
                              Icon(Icons.dark_mode_outlined,size: 32,color: Theme.of(context).primaryColor,) 
                              //: Icon(Icons.dark_mode,size: 32,color: Theme.of(context).primaryColor,) 
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          //data: ThemeData(primaryColor: Colors.orange[400]),
                          child: TextFormField(
                            controller: hb.userInuptController,
                            enabled: false,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor,
                            ),
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(right: 16),
                              hintText: "0.0",
                              hintStyle: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                              )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
              Divider(
                thickness: 2,
                color: Theme.of(context).primaryColor,
              ),
              Builder(
                builder: (context) {
                  HomeBloc bloc = Provider.of(context,listen: false);
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ///First Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                           IconButtonView(
                            icon: Icon(Icons.calculate_outlined,size: 40,color: Theme.of(context).primaryColor,),
                             iconTouch: (){},
                             ),
                            ButtonView(
                              data: "",
                              touchBtn: (data) {
                                 //hb.insertData("(");
                              },
                            ),
                            ButtonView(
                              data: "",
                              touchBtn: (data) {
                                 //hb.insertData(")");
                              },
                            ),
                            SizedBox(
                              width: 4,
                            ),
                           SignButtonView(
                            image: Image.asset("./asset/image/div.png",fit: BoxFit.cover,),
                            signTocuh: (){
                               hb.insertData("/");
                            },
                            ),
                          ],
                        ),
            
                        ///Second Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonView(
                              data: "7",
                              touchBtn: (data) {
                                 hb.insertData("7");
                              },
                            ),
                            ButtonView(
                              data: "8",
                              touchBtn: (data) {
                                 hb.insertData("8");
                              },
                            ),
                            ButtonView(
                              data: "9",
                              touchBtn: (data) {
                                 hb.insertData("9");
                              },
                            ),
                            SizedBox(
                              width: 4,
                            ),
                           SignButtonView(
                            image: Image.asset("./asset/image/mul.png",fit: BoxFit.cover,),
                            signTocuh: (){
                               hb.insertData("*");
                            },
                            ),
                          ],
                        ),
            
                        ///third Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonView(
                              data: "4",
                              touchBtn: (data) {
                                 hb.insertData("4");
                              },
                            ),
                            ButtonView(
                              data: "5",
                              touchBtn: (data) {
                                 hb.insertData("5");
                              },
                            ),
                            ButtonView(
                              data: "6",
                              touchBtn: (data) {
                                 hb.insertData("6");
                              },
                            ),
                            SizedBox(
                              width: 4,
                            ),
                           SignButtonView(
                            image: Image.asset("./asset/image/plus.png",fit: BoxFit.cover,),
                            signTocuh: (){
                               hb.insertData("+");
                               hb.add();
                            },
                            ),
                          ],
                        ),
            
                        ///Fourth Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonView(
                              data: "1",
                              touchBtn: (data) {
                                hb.insertData("1");
                              },
                            ),
                            ButtonView(
                              data: "2",
                              touchBtn: (data) {
                                hb.insertData("2");
                              },
                            ),
                            ButtonView(
                              data: "3",
                              touchBtn: (data) {
                                hb.insertData("3");
                              },
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            SignButtonView(
                              signTocuh: (){
                                 HomeBloc bloc = Provider.of(context,listen: false);
                                hb.insertData("-");
                                hb.minus();
                              },
                              image: Image.asset("./asset/image/minus.png",fit: BoxFit.cover,)
                            )
                          ],
                        ),
            
                        ///Fifith Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonView(
                              data: "C",
                              touchBtn: (data) {
                                hb.clearAll();
                              },
                            ),
                            ButtonView(
                              data: "0",
                              touchBtn: (data) {
                                hb.insertData("0");
                              },
                            ),
                            ButtonView(
                              data: ".",
                              touchBtn: (data) {
                                hb.insertData(".");
                              },
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            IconButtonView(
                              icon:const Icon(Icons.view_stream_rounded,size: 32,),
                              isEqualBtn: true,
                              iconTouch: (){
                                hb.calculate();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      //),
    );
  }
}

class SignButtonView extends StatelessWidget {

  final Function signTocuh;
  final Widget image;

  SignButtonView({
    required this.image,
    required this.signTocuh,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        signTocuh();
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
        ),
        alignment: Alignment.center,
        child: image,
      ),
    );
  }
}

class IconButtonView extends StatelessWidget {

  final Function iconTouch;
  final Icon icon;
  final bool isEqualBtn;

  IconButtonView({
    required this.icon,
    required this.iconTouch,
    this.isEqualBtn = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: (isEqualBtn) ? Theme.of(context).primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      child: IconButton(
        onPressed: () {
          iconTouch();
        },
        icon: icon,
      ),
    );
  }
}

class ButtonView extends StatelessWidget {
  final Function(String) touchBtn;
  final String data;

  ButtonView({
    required this.touchBtn,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      ),
      child: TextButton(
        onPressed: () {
          touchBtn(data);
        },
        child: Text(
          data,
          style: TextStyle(
              fontSize: (data == "(" || data == ")") ? 26 : 32,
              fontWeight: FontWeight.w400,
              color: (data == "(" || data == ")" || data == "C") ? Colors.black : Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
