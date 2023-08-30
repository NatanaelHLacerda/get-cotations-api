import 'package:flutter/material.dart';

class HomeViewData extends StatefulWidget {
  final Map snapShot;

  const HomeViewData({
    required this.snapShot,
    super.key,
  });

  @override
  State<HomeViewData> createState() => _HomeViewDataState();
}

class _HomeViewDataState extends State<HomeViewData> {
  late TextEditingController usdController;
  late TextEditingController eurController;
  late TextEditingController brlController;

  @override
  void initState() {
    usdController = TextEditingController();
    eurController = TextEditingController();
    brlController = TextEditingController();

    super.initState();
  }

  calculateBrl(double value, double usdValue, double eurValue) {
    final usd = value / usdValue;
    final eur = value / eurValue;

    usdController.text = usd.toStringAsFixed(2);
    eurController.text = eur.toStringAsFixed(2);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    
    final usdName = widget.snapShot["results"]["currencies"]["USD"]['name'];
    final usdValue = widget.snapShot["results"]["currencies"]["USD"]['buy'];

    final eurName = widget.snapShot["results"]["currencies"]["EUR"]['name'];
    final eurValue = widget.snapShot["results"]["currencies"]["EUR"]['buy'];

    return Column(children: [
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(usdName),
          const SizedBox(
            width: 6,
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: usdController,
              onChanged: (v) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(eurName),
          const SizedBox(
            width: 6,
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: eurController,
              onChanged: (v) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Real'),
          const SizedBox(
            width: 6,
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: brlController,
              onChanged: (v) {
                calculateBrl(double.tryParse(v) ?? 0.0, usdValue, eurValue);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          )
        ],
      ),
    ]);
  }
}
