import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:healthsafe/bloc/distance_list/distance_list_bloc.dart';
import 'package:healthsafe/bloc/distance_list/distance_list_event.dart';
import 'package:healthsafe/bloc/distance_list/distance_state_event.dart';
import 'package:healthsafe/model/distance_model.dart';
import 'package:healthsafe/views/dialogs/generic_dialog.dart';
import 'package:healthsafe/views/widget/base_button.dart';

import '../../utils/utils.dart' as utils;
import '../../values/strings.dart' as strings;

class DistanceListPage extends StatefulWidget {
  const DistanceListPage({Key? key}) : super(key: key);
  @override
  _DistanceListPageState createState() => _DistanceListPageState();
}

class _DistanceListPageState extends State<DistanceListPage> {
  late List<DistanceModel> distanceModelList;
  late DistanceListBloc distanceListBloc;
  final kilometerController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    distanceListBloc = BlocProvider.of<DistanceListBloc>(context);

    return BlocListener<DistanceListBloc, DistanceListState>(
      listener: (context, state) {
        if (state is DeleteDistanceSuccess) {
          Navigator.pop(context);
        }

        if (state is DistanceListLoading) {
          GenericDialog.showLoadingDialog(context);
        }

        if (state is UpdateDistanceSuccess) {
          Navigator.pop(context); // for loading dialog
          Navigator.pop(context); // for bottom sheet
        }
      },
      child: BlocBuilder<DistanceListBloc, DistanceListState>(
          builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Distance List'),
          ),
          body: StreamBuilder<QuerySnapshot>(
              stream: distanceListBloc.kilometerListStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                var modelList = utils.parseSnapshot(snapshot);
                modelList!.sort((a, b) => b.date.compareTo(a.date));

                return ListView.builder(
                  itemCount: modelList.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 16),
                  itemBuilder: (context, index) {
                    return Slidable(
                        key: const ValueKey(0),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                distanceListBloc.add(DeleteDistanceById(
                                    id: modelList[index].id));
                              },
                              backgroundColor: const Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: ListTile(
                            onTap: () => showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: Wrap(
                                        children: [
                                          Center(
                                              child: Text('Update ' +
                                                  modelList[index].kilometer +
                                                  ' kilometer')),
                                          TextField(
                                              controller: kilometerController),
                                          Center(
                                            child: BaseButton(
                                              text: 'Update',
                                              onPressed: () {
                                                distanceListBloc.add(
                                                    UpdateDistanceById(
                                                        id: modelList[index].id,
                                                        kilometer:
                                                            kilometerController
                                                                .text));
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                            leading: const Icon(Icons.list),
                            trailing: Text(
                              utils.dateFormat(modelList[index].date),
                              style: const TextStyle(
                                  color: Color.fromRGBO(76, 175, 80, 1),
                                  fontSize: 15),
                            ),
                            title: Text(
                                modelList[index].kilometer + " kilometer")));
                  },
                );
              }),
        );
      }),
    );
  }
}
