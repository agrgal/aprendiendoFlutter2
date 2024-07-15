import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormCard extends StatefulWidget {
  const FormCard({super.key});

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {

  bool _autovalidate = false;

  Color colorValidacion = Colors.black;

  var maskCard = MaskTextInputFormatter(
    mask: "####-####-####-####",
    filter: {"#":RegExp(r'[0-9]')}
  );

  var maskDate = MaskTextInputFormatter(
    mask: "##/##",
    filter: {"#":RegExp(r'[0-9]')}
  );

  var maskCode = MaskTextInputFormatter(
    mask: "###",
    filter: {"#":RegExp(r'[0-9]')}
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:[
            Image.network("https://www.mastercard.co.in/content/dam/public/mastercardcom/sg/en/consumers/find-a-card/images/world-debit-card.png"),
            const SizedBox(height: 20.0,),
            _inputName(), 
            const SizedBox(height: 10.0,),
            _inputCard(),     
            const SizedBox(height: 10.0,),  
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width*0.5,
                  child: _inputDate(),),
                 SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: _inputCode(),)
              ],      
            ) ,
            const SizedBox(height: 10.0,), 
            Container(
              width: MediaQuery.of(context).size.width-30,
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ElevatedButton(
                onPressed: (){}, 
                child: const Text("Pagar"),),
            ),
        ],
      ),
    );
  }

  // Método _inputName
  Container _inputName() {
    return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color: const Color.fromARGB(255, 139, 147, 187),
            border: Border.all(color: Colors.grey),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextFormField(
              style: const TextStyle(fontSize: 20.0),
              decoration: const InputDecoration(   
                hintText: "Ingresa tu nombre",              
                border: InputBorder.none,
              ),
          ),
        );
  }

    // Método _inputCard
  Container _inputCard() {
    return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color: const Color.fromARGB(255, 139, 147, 187),
            border: Border.all(color: Colors.grey),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextFormField(
              inputFormatters: [maskCard],
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 20.0),
              decoration: const InputDecoration(    
                hintText: "0000-0000-0000-0000",             
                border: InputBorder.none,
              ),
          ),
        );      
  }

  //    // Método _inputCard
  Container _inputDate() {
    return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color: const Color.fromARGB(255, 139, 147, 187),
            border: Border.all(color: Colors.grey),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value){
                setState(() {
                  _autovalidate = true;
                });
              },
              validator: (value) {
                if (value!.isEmpty) { return "00/00";} else {
                  final components = value.split("/");
                  if (components.length == 2) {          
                      final month = int.tryParse(components[0]);
                      final year = int.tryParse(components[1]);
                      if ( month!>=0 && month<12 && year!>=0 && year<99) {
                          colorValidacion = Colors.black;
                          return "Fecha correcta";
                      }
                  }
                }
                colorValidacion = Colors.red;
                return "Fecha incorrecta";
              },
              inputFormatters: [maskDate],
              keyboardType: TextInputType.datetime,
              style: TextStyle(fontSize: 20.0, color:colorValidacion),
              decoration: const InputDecoration(   
                hintText: "mm/yy",              
                border: InputBorder.none,
              ),
          ),
        );      
  }

    //    // Método _inputCard
  Container _inputCode() {
    return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color: const Color.fromARGB(255, 139, 147, 187),
            border: Border.all(color: Colors.grey),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextFormField(
              inputFormatters: [maskCode],
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 20.0),
              decoration: const InputDecoration(   
                hintText: "000",              
                border: InputBorder.none,
              ),
          ),
        );      
  }
  
} // FormCard 