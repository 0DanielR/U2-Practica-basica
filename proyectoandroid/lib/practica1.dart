import 'package:flutter/material.dart';

List operaciones = ["SUMA","RESTA","MULTIPLICACION","DIVISION"];



class Practica1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _Practica1();
  }
}

class _Practica1 extends State<Practica1>{
  final num1 =TextEditingController();
  final num2 =TextEditingController();
  String elegido="SUMA";
  String _operacionElegido= operaciones.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Practica 1"),actions: [
        IconButton(onPressed: (){

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Este programa realiza operaciones entre 2 números")));
        }, icon: Icon(Icons.info))
      ],),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Text("Calculadora Auto", style: TextStyle(fontSize: 20,color:Colors.greenAccent)),
          SizedBox(height: 30,),
          Padding(padding: EdgeInsets.all(20),
          child: TextField(controller: num1,
            decoration: InputDecoration(labelText: "Valor 1",border: UnderlineInputBorder()),
          ),
          ),
          Padding(padding: EdgeInsets.all(20),
            child: TextField(controller: num2,
              decoration: InputDecoration(labelText: "Valor 2",border: UnderlineInputBorder()),
            ),
          ),
          SizedBox(height: 30,),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            DropdownButton(
              value: _operacionElegido,
                items: operaciones.map((valor){
                  return DropdownMenuItem(child: Text(valor),value: valor,);
                }).toList(),
                onChanged: (valor){
                  setState(() {
                    _operacionElegido=valor.toString();
                    elegido=valor.toString();
                  });
                }

            ),
            OutlinedButton(onPressed: (){
              resolver(num1.text,num2.text,elegido);
            }, child: Text("RESOLVER"))
          ],)
        ],
      ),
    );
  }

  void resolver(String text, String text2, String ope){
    double n1=double.parse(text);
    double n2=double.parse(text2);
    double resultado=0;
    if(ope=="MULTIPLICACION"){
      resultado=n1*n2;
    }else if(ope=="SUMA"){
      resultado=n1+n2;
    }else if(ope=="RESTA"){
      resultado=n1-n2;
    }else{
      resultado=n1/n2;
    }
    showDialog(context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Resultado "),
          content: Text("El resultado es: ${resultado}"),
          actions: [TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("ok"))],
        );
      }
    );
  }
}