import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kredit_app/blocs/credit/credit_bloc.dart';
import 'package:kredit_app/model/credit_model.dart';
import 'package:kredit_app/views/approve.dart';
import 'package:kredit_app/views/dropdown.dart';
import 'package:kredit_app/views/reject.dart';
import 'package:kredit_app/views/text_field.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final incomeController = TextEditingController();
  final homeOwnershipController = TextEditingController();
  final empLenghtController = TextEditingController();
  final loanIntentController = TextEditingController();
  final loanGradeController = TextEditingController();
  final loanAmtController = TextEditingController();
  final loanIntRateController = TextEditingController();
  final percentIncomeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> homeOwnershipItems = <String>[
    'OWN',
    'RENT',
    'MORTGAGE',
    'OTHER'
  ];
  final List<String> loanGradeItems = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G'
  ];
  final List<String> loanIntentItems = <String>[
    'DEBTCONSOLIDATION',
    'EDUCATION',
    'HOMEIMPROVEMENT',
    'MEDICAL',
    'PERSONAL',
    'VENTURE'
  ];

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    incomeController.dispose();
    homeOwnershipController.dispose();
    empLenghtController.dispose();
    loanIntentController.dispose();
    loanGradeController.dispose();
    loanAmtController.dispose();
    loanIntRateController.dispose();
    percentIncomeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    homeOwnershipController.text = homeOwnershipItems[0];
    loanGradeController.text = loanGradeItems[0];
    loanIntentController.text = loanIntentItems[0];
    context.read<CreditBloc>().add(CreditInitialEvent());
    super.initState();
  }

  // validator
  String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'data harus diisi';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Row(
              children: <Widget>[
                SizedBox(
                  height: 70,
                  child: Image(image: AssetImage('assets/logo.png')),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Form Pengajuan Kredit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Isi data dengan benar sistem akan mengecek kelayakan kredit anda.',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextField(
                        controller: nameController,
                        label: 'Nama',
                        hint: 'exp : I Made Rian Wijaya',
                        vlidator: required,
                        keyboardType: TextInputType.text,
                        onTap: () {},
                        isReadOnly: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyTextField(
                        controller: ageController,
                        label: 'Umur (Tahun)',
                        hint: 'exp : 22',
                        vlidator: required,
                        keyboardType: TextInputType.number,
                        onTap: () {},
                        isReadOnly: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyTextField(
                        controller: incomeController,
                        label: 'Pendapatan Per Tahun (\$)',
                        hint: 'exp : 1000000',
                        vlidator: required,
                        keyboardType: TextInputType.number,
                        onTap: () {},
                        isReadOnly: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyTextField(
                        controller: empLenghtController,
                        label: 'Lama Bekerja (Tahun)',
                        hint: 'exp : 2',
                        vlidator: required,
                        keyboardType: TextInputType.number,
                        onTap: () {},
                        isReadOnly: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyTextField(
                        controller: loanAmtController,
                        // dollar sign
                        label: 'Jumlah Pinjaman (\$)',
                        hint: 'exp : 1000000',
                        vlidator: required,
                        keyboardType: TextInputType.number,
                        onTap: () {},
                        isReadOnly: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyTextField(
                        controller: loanIntRateController,
                        label: 'Bunga Pinjaman (%)',
                        hint: 'exp : 10',
                        vlidator: required,
                        keyboardType: TextInputType.number,
                        onTap: () {},
                        isReadOnly: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyTextField(
                        controller: percentIncomeController,
                        label: 'Rasio Pendapatan dan Hutang',
                        hint: 'exp : 0.5',
                        vlidator: required,
                        keyboardType: TextInputType.number,
                        onTap: () {},
                        isReadOnly: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyDropdown(
                        value: homeOwnershipController.text,
                        label: 'Kepemilikan Rumah',
                        items: homeOwnershipItems,
                        onChanged: (String? value) {
                          setState(() {
                            homeOwnershipController.text = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyDropdown(
                        value: loanIntentController.text,
                        label: 'Tujuan Kredit',
                        items: loanIntentItems,
                        onChanged: (String? value) {
                          setState(() {
                            loanIntentController.text = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyDropdown(
                        value: loanGradeController.text,
                        label: 'Grade Kredit',
                        items: loanGradeItems,
                        onChanged: (String? value) {
                          setState(() {
                            loanGradeController.text = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final data = CreditModel(
                              name: nameController.text,
                              age: int.parse(ageController.text),
                              income: int.parse(incomeController.text),
                              empLength: int.parse(empLenghtController.text),
                              loanAmount: int.parse(loanAmtController.text),
                              interestRate:
                                  double.parse(loanIntRateController.text),
                              percentIncome:
                                  double.parse(percentIncomeController.text),
                              homeOwnership: homeOwnershipController.text,
                              loanIntent: loanIntentController.text,
                              loanGrade: loanGradeController.text,
                            );
                            context
                                .read<CreditBloc>()
                                .add((CreditPostEvent(credit: data)));
                          }
                        },
                        child: BlocConsumer<CreditBloc, CreditState>(
                          builder: (context, state) {
                            if (state is CreditLoading) {
                              // close keyboard
                              FocusScope.of(context).unfocus();
                              return LoadingAnimationWidget.stretchedDots(
                                color: Colors.white,
                                size: 40,
                              );
                            } else {
                              return const Text('Cek Kelayakan Kredit',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white));
                            }
                          },
                          listener: (context, state) {
                            if (state is CreditError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.message),
                                ),
                              );
                            }
                            if (state is CreditSuccess) {
                              if (state.prediction == true) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const ApproveScreen(),
                                  ),
                                );
                              }
                              if (state.prediction == false) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const RejectScreen(),
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
