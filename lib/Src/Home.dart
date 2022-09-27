import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myactivities_extension/Src/Activity.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Activity> activities = [
    Activity(
      id: '1',
      type: ActivityType.walking,
      distance: 6.9,
      when: DateTime.parse("2019-10-04T00:06:09"),
      place: 'my-bed'
    ),
  ];

  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.network(
              'https://pbs.twimg.com/media/FdoX1E2UAAEayhR?format=jpg&name=small',
              height: 50,
            )
          ),
          Expanded(
            flex: 4,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices:{
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                }
              ),
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (_,index){
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('#${activities[index].id}'),
                          Text('${activities[index].distance.toStringAsFixed(1)}km',),
                          Text(activities[index].place),
                          GestureDetector(
                            onTap: (){
                              _deleteActivity(activities[index].id);
                            },
                            child: const Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Divider(
                        indent: 8,
                        endIndent: 8,
                        thickness: 1.0,
                      )
                    ],
                  );
                },
              ),
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _addActivity();
        },
        tooltip: 'Add Activity',
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
  void _addActivity(){
    final lastId = activities.isNotEmpty
        ? activities.map((e) => int.tryParse(e.id) ?? 0).toList().reduce(max)
        : 0;

    final newActivity = Activity(
      id: (lastId + 1).toString(),
      type: ActivityType.values[Random.secure().nextInt(ActivityType.values.length)],
      distance: Random.secure().nextDouble()*10,
      when: DateTime.parse("2019-10-04T00:06:09"),
      place: 'Magical Forest',
    );
    setState((){
      activities.add(newActivity);
    });
  }

  void _deleteActivity(String id){
    setState((){
      activities.removeWhere((element) => element.id == id);
    });
  }
}
