import 'package:flutter/material.dart';
import 'package:flutter_exchange_currency/core/constant/currency_codes.dart';
import 'package:flutter_exchange_currency/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController baseAmountTextEditingController = TextEditingController();
  TextEditingController targetAmountTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final viewModel = context.read<HomeViewModel>();
      await viewModel.getCurrency(baseCode: viewModel.state.baseCode, targetCode: viewModel.state.targetCode);
      viewModel.calcTargetAmount(viewModel.state.baseAmount);
      baseAmountTextEditingController.text = viewModel.state.baseAmount.toString();
      targetAmountTextEditingController.text = viewModel.state.targetAmount.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: baseAmountTextEditingController,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          targetAmountTextEditingController.text = '0';
                          return;
                        }
                        viewModel.calcTargetAmount(num.parse(value));
                        targetAmountTextEditingController.text = viewModel.state.targetAmount.toString();
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.purpleAccent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.cyanAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  DropdownButton<String>(
                    value: viewModel.state.baseCode,
                    hint: const Text('Choose a code'),
                    onChanged: (baseCode) async {
                      await viewModel.getCurrency(
                          baseCode: baseCode!, targetCode: viewModel.state.targetCode);

                      viewModel.calcTargetAmount(viewModel.state.baseAmount);
                      targetAmountTextEditingController.text = viewModel.state.targetAmount.toString();
                    },
                    items: currencyCodes
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: targetAmountTextEditingController,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          baseAmountTextEditingController.text = '0';
                          return;
                        }
                        viewModel.calcBaseAmount(num.parse(value));
                        baseAmountTextEditingController.text = viewModel.state.baseAmount.toString();
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.purpleAccent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.cyanAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  DropdownButton<String>(
                    value: viewModel.state.targetCode,
                    hint: const Text('Choose a code'),
                    onChanged: (targetCode) async {
                      await viewModel.getCurrency(
                          baseCode: viewModel.state.baseCode, targetCode: targetCode!);
                      viewModel.calcBaseAmount(viewModel.state.targetAmount);
                      baseAmountTextEditingController.text = viewModel.state.baseAmount.toString();
                    },
                    items: currencyCodes
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
