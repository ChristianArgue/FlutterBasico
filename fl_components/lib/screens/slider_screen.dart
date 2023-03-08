import 'package:flutter/material.dart';

import 'package:fl_components/theme/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _sliderValue = 100;
  bool _sliderEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders & Checks'),
      ),
      body: Column(
        children: [
          Slider.adaptive(
            min: 50,
            max: 400,
            activeColor: AppTheme.primary,
            value: _sliderValue, 
            onChanged: _sliderEnable 
            ? (value) {
              setState(() {
                _sliderValue = value;
              });
            }
            : null
          ),
          // Checkbox(
          //   value: _sliderEnable, 
          //   onChanged: (value) {
          //     setState(() {
          //       _sliderEnable = value ?? true;
          //     });
          //   },
          // ),
          // Switch(
          //   value: _sliderEnable, 
          //   onChanged: (value) {
          //     setState(() {
          //       _sliderEnable = value ?? true;
          //     });
          //   },
          // ),
          CheckboxListTile(
            activeColor: AppTheme.primary,
            title: const Text('Habilitar para mover la Imagen'),
            value: _sliderEnable, 
            onChanged: (value) {
              setState(() {
                _sliderEnable = value ?? true;
              });
            },
          ),
          SwitchListTile(
            activeColor: AppTheme.primary,
            title: const Text('Habilitar para mover la Imagen'),
            value: _sliderEnable, 
            onChanged: (value) {
              setState(() {
                _sliderEnable = value;
              });
            },
          ),
          const AboutListTile(),
          const SizedBox(height: 15),
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage('https://i.dailymail.co.uk/1s/2021/09/08/23/47678837-9971721-image-a-47_1631141991032.jpg'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          )
        ],
      ),
   );
  }
}