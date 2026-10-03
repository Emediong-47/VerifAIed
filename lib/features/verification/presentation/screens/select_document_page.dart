import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:verif_aled/app/routes/app_router.dart';

@RoutePage()
class SelectDocumentPage extends StatefulWidget {
  const SelectDocumentPage({super.key});

  @override
  State<SelectDocumentPage> createState() => _SelectDocumentPageState();
}

class _SelectDocumentPageState extends State<SelectDocumentPage> {
  String dropDownItem = 'NIN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Document')),
      body: Column(
        children: [
          const SizedBox(height: 8),
          DropdownMenu(
            initialSelection: dropDownItem,
            label: const Text('Documents'),
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 'NIN', label: 'NIN'),
              DropdownMenuEntry(value: 'VOTERS CARD', label: 'VOTERS CARD'),
              DropdownMenuEntry(value: 'STUDENT ID CARD', label: 'STUDENT ID CARD'),
            ],
            onSelected: (value) {
              debugPrint(value);
              dropDownItem = value!;
            },
          ),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            print(dropDownItem);
            context.router.push(CaptureDocumentRoute());
          }, child: const Text('Continue'))
        ],
      ),
    );
  }
}