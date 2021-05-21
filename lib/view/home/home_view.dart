import 'package:currencyconverter/components/my_divider.dart';
import 'package:currencyconverter/components/my_text_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  num tryUsd = 8.40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
          buildTextField('$tryUsd TRY', t1),
          MyDivider(),
          buildTextField('1 USD', t2),
          buildBtnSide()
        ],
      ),
    );
  }

  Expanded buildBtnSide() {
    return Expanded(
      flex: 3,
      child: Container(
        color: Colors.transparent,
        child: Container(
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(32.0),
                  topRight: const Radius.circular(32.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildRowNumber('1', '2', '3'),
              buildRowNumber('4', '5', '6'),
              buildRowNumber('7', '8', '9'),
              buildBuildEndRow('.', '0', '<='),
            ],
          ),
        ),
      ),
    );
  }

  Row buildBuildEndRow(String btnText1, String btnText2, String btnText3) {
    btnPress1() {
      setState(() {
        if (t1.text.contains('TRY')) {
          t1.text = t1.text.replaceAll(' TRY', '');
        }
        t1.text += btnText1;
        t2.text = (double.parse(t1.text) / tryUsd).toStringAsFixed(3) + ' USD';
        t1.text = t1.text + ' TRY';
      });
    }

    btnPress2() {
      setState(() {
        if (t1.text.contains('TRY')) {
          t1.text = t1.text.replaceAll(' TRY', '');
        }
        t1.text += btnText2;
        t2.text = (double.parse(t1.text) / tryUsd).toStringAsFixed(3) + ' USD';
        t1.text = t1.text + ' TRY';
      });
    }

    btnPress3() {
      setState(() {
        t1.clear();
        t2.clear();
      });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyTextButton(btnText1, () => btnPress1()),
        MyTextButton(btnText2, () => btnPress2()),
        MyTextButton(btnText3, () => btnPress3()),
      ],
    );
  }

  Expanded buildTextField(String text, TextEditingController t) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          enabled: false,
          decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
          ),
          style: TextStyle(fontSize: 64),
          controller: t,
        ),
      ),
    );
  }

  Row buildRowNumber(String btnText1, String btnText2, String btnText3) {
    btnPress1(String addingText) {
      setState(() {
        if (t1.text.contains('TRY')) {
          t1.text = t1.text.replaceAll(' TRY', '');
        }
        t1.text += addingText;
        t2.text = (double.parse(t1.text) / tryUsd).toStringAsFixed(3) + ' USD';
        t1.text = t1.text + ' TRY';
      });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyTextButton(btnText1, () => btnPress1(btnText1)),
        MyTextButton(btnText2, () => btnPress1(btnText2)),
        MyTextButton(btnText3, () => btnPress1(btnText3)),
      ],
    );
  }
}
