import 'package:dokkan_firebase/components/text_field_widget.dart';
import 'package:dokkan_firebase/controller/get_date_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';

class GetHomeData extends StatelessWidget {
  const GetHomeData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GetDataProvider>(
        builder: (context, state, child) {
          print('${state.depositeModel?.status}');
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFieldWidget(
                  validator: (value) {},
                  controller: state.inputController,
                  hintText: 'Add Date',
                  obscureText: false,
                  change: (value) {}),
              ElevatedButton(
                  onPressed: () {
                    state.getData();
                    // print('${state.depositeModel!.data.the20231212.length}');

                  },
                  child: const Text('Add')),
              Expanded(
                  child: state.status == Status.LOADING ? const Center(child: CircularProgressIndicator()) : ListView.builder(
                      itemCount: state.depositeModel?.data.the20231212.length,
                    // itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(
                                '${state.depositeModel?.data.the20231212[index].date}'),
                            subtitle: Text(
                                '${state.depositeModel?.data.the20231212[index].time}'),
                            tileColor: Colors.deepPurple,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          ),
                        );
                      })),
            ],
          ),
        ),
      );
    });
  }
}
