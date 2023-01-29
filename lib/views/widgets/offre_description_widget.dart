import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescTextWidget extends StatefulWidget{
  final String text ;
  const DescTextWidget({Key? key, required this.text}): super(key: key);

  @override
  _DescTextWidgetState createState()=>
  _DescTextWidgetState();
}
class _DescTextWidgetState extends State<DescTextWidget>{
  late String firstHalf;
  late String secondHalf;
  bool hiddenText=true;
  double textHeight = 100;
  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    }else {
      firstHalf = widget.text;
      secondHalf="";
    }
    
  }
    @override
  Widget build (BuildContext context){
      return Container(
        child: secondHalf.isEmpty? Text(firstHalf,style:TextStyle(fontSize: 12,color: Colors.black,height: 1.6)):Column(
          children :[
            Text(hiddenText?firstHalf+".....":firstHalf+secondHalf, style:TextStyle(fontSize: 12,color: Colors.black,height: 1.6),),
            InkWell(
              onTap: (){
                setState(() {
                  hiddenText=!hiddenText;

                });
              },
              child: Row(
                children: [
                  Text(hiddenText? "voir plus" :"voir moins",style: TextStyle(fontSize: 12,color: Colors.deepPurple),),
                  Icon(hiddenText? Icons.arrow_drop_down:Icons.arrow_drop_up,color: Colors.deepPurple,)
                ],
              ),
            )
          ]

        ),
        
      );
  }
  }
