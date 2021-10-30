
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/main.dart';

class MoshafDetails extends StatefulWidget {
  static const MoshafDetailsRoute='MoshafDetailsRoute';

  @override
  _MoshafDetailsState createState() => _MoshafDetailsState();
}

class _MoshafDetailsState extends State<MoshafDetails> {
  List<String> verses=[];

  @override
  Widget build(BuildContext context) {
    var data=ModalRoute.of(context).settings.arguments as DataSura;
    SuraNameFile(data.index);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('اسلامي',style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
      ),
      body:Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.transparent,
            width: double.infinity,
            child: Image.asset('assets/images/bg3.png',fit: BoxFit.fill,),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 300,
                height: 500,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.5),

                  borderRadius: BorderRadius.circular(20),
                ),
                child:  Column(
                  children: [
                    Text(data.SuraName,style: TextStyle(
                        fontSize: 25
                    ),),
                    Divider(thickness: 2,color: AppTheme.primaryColor,),
                    verses.isEmpty?
                    Center(
                      child: CircularProgressIndicator(
                        valueColor:AlwaysStoppedAnimation<Color>(AppTheme.primaryColor) ,
                      ),
                    ):
                    Expanded(
                      child: ListView.builder(
                          itemCount: verses.length,
                          itemBuilder: (ctx,idx)=>
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  verses[idx]+'{${idx}}',
                                  textAlign:TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                ),
                              )
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void SuraNameFile(int index)async {
    String fileContent =await rootBundle.loadString('assets/files/ayat/${index+1}.txt');
    List<String> ayat =fileContent.split('\n');
    for(int i=0;i<ayat.length;i++)
    this.verses=ayat;
    setState(() {

    });
  }
}



class DataSura{
  String SuraName;
  int index;
  DataSura(this.SuraName,this.index);
}
