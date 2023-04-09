import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Constants/Color.dart';




class CnicForm extends StatelessWidget {
  CnicForm({Key? key}) : super(key: key);
  final _cnicFormKey = GlobalKey<FormState>();
  final _cnicNumberController = TextEditingController();
  TextEditingController _dateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration",style: Theme.of(context).textTheme.headline3!.copyWith(color: TGreen),),
        centerTitle: true,
        elevation: 0.0,
        leading:  IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
          color: TGreen,
          iconSize: 25.0,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(

            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Welcome to Zindigi",style: Theme.of(context).textTheme.headline3!.copyWith(color: TGreen),),
                SizedBox(height: 4.0,),
                Text("Enter yout CNIC number",style: Theme.of(context).textTheme.headline4,),
                SizedBox(height: 25.0,),

                SingleChildScrollView(
                  child: Form(
                    key: _cnicFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("CNIC Number*"),
                              TextFormField(
                                controller: _cnicNumberController,
                                decoration: InputDecoration(labelText: 'Enter CNIC Number*',
                                  labelStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.6), // set the alpha value to 0.6 (60% opacity)
                                  ),
                                ),
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your CNIC number';
                                  }
                                  if (value.length != 13) {
                                    return 'Please enter a valid 13-digit cnic number';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Enter CNIC Date Of Issue*"),
                            TextFormField(
                            controller: _dateController,
                            decoration: InputDecoration(
                              labelText: 'yyyy-MM-dd',
                              labelStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.6), // set the alpha value to 0.6 (60% opacity)
                              ),
                              suffixIcon: InkWell(
                                onTap: () async {
                                  final DateTime? selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100),
                                  );
                                  if (selectedDate != null) {
                                    _dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                                  }
                                },
                                child: Icon(Icons.calendar_today),
                              ),
                            ),
                            keyboardType: TextInputType.datetime,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a date';
                              }
                              return null;
                            },
                          ),
                          ]
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width*0.3,
                            child: ElevatedButton(

                              onPressed: () {
                                if (_cnicFormKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CnicForm(),
                                    ),
                                  );
                                }
                                else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Please insert valid info')));
                                }
                              },
                              child: Text('NEXT',style: TextStyle(color: TGreen)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: TBgWhite,// background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30), // rounded border
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
