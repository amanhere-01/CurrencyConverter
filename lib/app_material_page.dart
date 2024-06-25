import 'package:flutter/material.dart';

class AppMaterialPage extends StatefulWidget{
  const AppMaterialPage({super.key});

  @override
  State<AppMaterialPage> createState() => _AppMaterialPageState();
}

class _AppMaterialPageState extends State<AppMaterialPage>{

  double result=0;
  final TextEditingController textEditingController= TextEditingController();

  @override
  Widget build(BuildContext context) {

    const borderDesign = OutlineInputBorder(    // borderDesign is variable we create to reduce redundancy from setting TextField border
        borderSide: BorderSide(
            color: Colors.black,
            width: 2,
            strokeAlign: BorderSide.strokeAlignInside
        ),
        borderRadius: BorderRadius.all(Radius.circular(20))
    );

    void convert(){
      result = double.parse(textEditingController.text) * 83.44;
      setState(() {});
    }

    return  Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Currency Converter',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28
          ) ,
        ),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                result!=0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0),  // it means if result!=0 then show 3 digit after decimal but if result is 0 then show 0
                style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                    color: Colors.black
                ),
              ),
               TextField(
                   controller: textEditingController,
                   style: const TextStyle(
                       color: Colors.black
                   ),
                   decoration: const InputDecoration(
                       hintText: 'Please enter amount in USD',
                       hintStyle: TextStyle(
                           color: Colors.black
                       ),
                       prefixIcon: Icon(Icons.monetization_on_outlined),
                       prefixIconColor: Colors.black,
                       filled: true,
                       fillColor: Colors.white,
                       focusedBorder: borderDesign,   // focused border things act on we click on the text field
                       enabledBorder: borderDesign   // if we want to look TextField same when it is focused or not we have to set enabledBorder
                   ),
                   keyboardType: TextInputType.number
               ),
              const SizedBox(height: 12,),
              TextButton(
                onPressed: convert,
                // style:  const ButtonStyle(
                //   backgroundColor: WidgetStatePropertyAll(Colors.black),
                //   foregroundColor: WidgetStatePropertyAll(Colors.white),
                //   minimumSize: WidgetStatePropertyAll(Size(double.infinity , 50)),
                //   shape: WidgetStatePropertyAll(
                //       RoundedRectangleBorder(
                //           borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //   ),
                // ),
                // if we use style: TextButton.styleFrom then we don't have to write WidgetStatePropertyAll everytime
                // if we use ElevatedButton then it will be ElevatedButton.styleFrom. Also Elevated and Text Button is almost similar
                style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
                child: const Text('Convert'),
              ),
            ],
          ),
        ),
      ),
    );

  }

}
