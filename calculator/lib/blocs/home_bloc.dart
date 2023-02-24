import 'package:calculator/resources/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBloc extends ChangeNotifier{

  TextEditingController userInuptController = TextEditingController();
  double? finalData;
  String firstNum="";
  String secondNum ="";
  String? operator;
  double temp = 0.0;
  bool isFirstdone = false;

  HomeBloc(){
    checkTheme();
  }


  insertData(String data){
     userInuptController.text += data;
    if(data == "1" || data == "2" || data == "3" || data == "4" || data == "5"
     || data == "6" || data == "7" || data == "8" || data == "9" || data == "0" || data == "."){
         if(operator == null){
          firstNum += data;
         }else{
          secondNum += data;
         } 
     }
     else{
    if(data == "+"){
        add(operator: operator ?? "");
      }else if(data == "-"){
        minus(operator: operator ?? "");
      }else if(data == "*"){
        multi(operator: operator ?? "");
      }else if(data == "/"){
        div(operator : operator ?? "");
      }
      operator = data;
     }

    print("first in insert "+firstNum);
    print("second in insert "+secondNum);
    print("operator in insert "+operator.toString());
    print("________________________________________");

    notifyListeners();
  }

  clearAll({bool isFromEndProcess = false}){
    if(!isFromEndProcess){
       userInuptController.clear();
    }
    isFirstdone = false;
    firstNum = "";
    secondNum = "";
    operator = null;
  }


  calculate({bool isFromEndProcess = true}){
      if(operator == "+"){
        add();
      }else if(operator == "-"){
        minus();
      }else if(operator == "*"){
        multi();
      }else if(operator == "/"){
        div();
      }
      if(isFromEndProcess == true){
    userInuptController.text = firstNum.toString();
     clearAll(isFromEndProcess: true);
      notifyListeners();
      }
  }

  add({String operator = ""}){
    print("ope in add "+operator);
    double data = 0.0;
    if(secondNum != "" && firstNum != "" && operator == ""){
       data =  double.parse(firstNum) + double.parse(secondNum);
      firstNum = data.toString();
      print("first num in add "+firstNum);
      secondNum = "";
    }else if(secondNum != "" && firstNum != "" ){
      calculateData(data: data);
    }
  }

    minus({String operator = ""}){
    print("ope in minus "+operator);
    double data = 0.0;
    if(secondNum != "" && firstNum != "" && operator == ""){
       data =  double.parse(firstNum) - double.parse(secondNum);
      firstNum = data.toString();
      print("first num in minus "+firstNum);
      secondNum = "";
    }else if(secondNum != "" && firstNum != "" ){
      calculateData(data: data);
    }
  }

    multi({String operator = ""}){
    print("ope in mult "+operator);
    double data = 0.0;
    if(secondNum != "" && firstNum != "" && operator == ""){
       data =  double.parse(firstNum) * double.parse(secondNum);
      firstNum = data.toString();
      print("first num in mult "+firstNum);
      secondNum = "";
    }else if(secondNum != "" && firstNum != "" ){
      calculateData(data: data);
    }
  }  

    div({String operator = ""}){
    print("ope in div "+operator);
    double data = 0.0;
    if(secondNum != "" && firstNum != "" && operator == ""){
       data =  double.parse(firstNum) / double.parse(secondNum);
      firstNum = data.toString();
      print("first num in div "+firstNum);
      secondNum = "";
    }else if(secondNum != "" && firstNum != "" ){
      calculateData(data: data);
    }
  }

  void calculateData({double data = 0.0}){
    if(operator == "+"){
     data =  double.parse(firstNum) + double.parse(secondNum);
      firstNum = data.toString();
      print("first num in add step + "+firstNum);
      secondNum = "";
      }else if(operator == "-"){
    data =  double.parse(firstNum) - double.parse(secondNum);
      firstNum = data.toString();
      print("first num in add step - "+firstNum);
      secondNum = "";
      }else if(operator == "*"){
    data =  double.parse(firstNum) * double.parse(secondNum);
      firstNum = data.toString();
      print("first num in add step * "+firstNum);
      secondNum = "";
      }else if(operator == "/"){
    data =  double.parse(firstNum) / double.parse(secondNum);
      firstNum = data.toString();
      print("first num in add step / "+firstNum);
      secondNum = "";
      }
  }

  ///For theme
   ThemeMode chooseTheme = ThemeMode.light;
   bool isNight = false;

    void checkTheme(){
      SharedPref.getData(key: "theme").then((value){
        if(value != null){
          if(value == "dark"){
          chooseTheme = ThemeMode.dark;
        }else{
          chooseTheme = ThemeMode.light;
        }
        print("value "+value);
        }
      notifyListeners();
      });
    }

    void changeTheme(String color){
        isNight = !isNight;
        notifyListeners();
        if(color == "dark"){
          SharedPref.saveData(key: "theme", value: "dark");
          chooseTheme = ThemeMode.dark;
        }else if(color == "light"){
          SharedPref.saveData(key: "theme", value: "light");
          chooseTheme = ThemeMode.light;
        }
        print("work change theme"+color);
        notifyListeners();
    }
  

  @override
  void dispose() {
    userInuptController.dispose();
    super.dispose();
  }

}