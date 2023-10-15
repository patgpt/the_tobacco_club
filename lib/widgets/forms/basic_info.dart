import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _dob;
  DateTime? _startDate;
  int _smokesPerDay = 0;
  double _moneySpent = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: TextButton.icon(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _dob ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    setState(() {
                      _dob = date;
                    });
                  }
                },
                icon: const Icon(Icons.calendar_today),
                label: Text(
                  _dob != null
                      ? 'DOB: ${DateFormat('d MMM y').format(_dob!)}'
                      : 'Select DOB',
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextButton.icon(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _startDate ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    setState(() {
                      _startDate = date;
                    });
                  }
                },
                icon: const Icon(Icons.calendar_today),
                label: Text(
                  _startDate != null
                      ? 'Start Date: ${DateFormat('d MMM y').format(_startDate!)}'
                      : 'Select Start Date',
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SliderTheme(
                data: const SliderThemeData(
                    trackHeight: 5,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                    showValueIndicator: ShowValueIndicator.always,
                    tickMarkShape: RoundSliderTickMarkShape(),
                    trackShape: RoundedRectSliderTrackShape()),
                child: Slider(
                  value: _smokesPerDay.toDouble(),
                  min: 0,
                  max: 50,
                  divisions: 50,
                  label: _smokesPerDay.toString(),
                  onChanged: (value) {
                    setState(() {
                      _smokesPerDay = value.toInt();
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Money Spent per Week',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _moneySpent = double.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Form submitted'),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
