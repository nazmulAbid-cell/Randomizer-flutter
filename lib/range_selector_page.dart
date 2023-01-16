import 'package:flutter/material.dart';
import 'package:randomizer/randomizer_page.dart';
import 'package:randomizer/range_selector_form.dart';
class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({Key? key}) : super(key: key);

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  int _min = 0;
  int _max = 0;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Range'),
        ),
        body: RangeSelectorForm(
          formKey: formKey,
          minValueSetter: (value) => _min = value,
          maxValueSetter: (value) => _max = value,
        ),
        floatingActionButton: FloatingActionButton(
          child:  const Icon(Icons.arrow_forward),
          onPressed: (){
            //TODO: validate the form
            if(formKey.currentState?.validate() == true){
              formKey.currentState?.save();
              // TODO: Navigate to the randomizer  generator page
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>RandomizerPage(
                    min: _min, max: _max)
                ),
              );
              
            }
            

          },
        )
    );
  }
}




