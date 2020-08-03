import 'package:TodoAppBloc/blocs/blocs.dart';
import 'package:TodoAppBloc/models/models.dart';
import 'package:TodoAppBloc/widgets/statistics_widget.dart';
import 'package:TodoAppBloc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, MyAppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Todolist with Firestore,Bloc'),
            actions: [
              FilterButton(visible: activeTab == MyAppTab.todos),
              ExtraActions(),
            ],
          ),
          body: activeTab == MyAppTab.todos ? FilteredTodos() : StatisticsWidget(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/addTodo');
            },
            child: Icon(Icons.add),
            tooltip: 'Add Todo',
          ),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(TabEventChangeTab(tab)),
          ),
        );
      },
    );
  }
}
