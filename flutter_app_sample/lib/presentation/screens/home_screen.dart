import 'package:flutter/material.dart';
import 'package:flutter_app_sample/bloc/home_screen_bloc/home_bloc.dart';
import 'package:flutter_app_sample/bloc/home_screen_bloc/home_event.dart';
import 'package:flutter_app_sample/bloc/home_screen_bloc/home_state.dart';
import 'package:flutter_app_sample/data/repo/home_data.dart';
import 'package:flutter_app_sample/presentation/widgets/custom_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context)
                            .add(ShowTwoDataEvent());
                      },
                      child: Text(
                        '2 Items',
                        style: TextStyle(color: Colors.black),
                      ),
                      color: Colors.white,
                      shape: new RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color(0xfff1A4869),
                            width: 2,
                            style: BorderStyle.solid),
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context)
                            .add(ShowThreeDataEvent());
                      },
                      child: Text(
                        '3 Items',
                        style: TextStyle(color: Colors.black),
                      ),
                      color: Colors.white,
                      shape: new RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color(0xfff1A4869),
                            width: 2,
                            style: BorderStyle.solid),
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context)
                            .add(ShowAllDataEvent());
                      },
                      child: Text(
                        'All Items',
                        style: TextStyle(color: Colors.black),
                      ),
                      color: Colors.white,
                      shape: new RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color(0xfff1A4869),
                            width: 2,
                            style: BorderStyle.solid),
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeErrorState) {
                  return Container(
                    child: Center(
                      child: Text(
                        'Unable to retrieve any details, please try again after sometime...',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                } else if (state is HomeFetchingState) {
                  return Container(
                      child: Center(child: CircularProgressIndicator()));
                } else if (state is HomeFetchedState) {
                  List<HomeDataList> _list = state.list;
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      //itemExtent: 100.0,
                      itemCount: _list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomListView(
                          index: index,
                          title: _list[index].name,
                          imageURL: _list[index].url,
                        );
                      });
                } else if (state is HomeUninitializedState) {
                  return Center(
                      child: Container(
                    child: Text(
                      'Please Click on any button to display list',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ));
                } else {
                  return Container(
                    child: Center(
                      child: Text(
                        'No Data To Show',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
