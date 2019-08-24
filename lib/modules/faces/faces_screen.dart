import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openfacevault_mobile/modules/faces/bloc/bloc.dart';
import 'package:openfacevault_mobile/modules/faces/bloc/faces_bloc.dart';
import 'package:openfacevault_mobile/modules/faces/bloc/faces_event.dart';

class FacesScreen extends StatefulWidget {
  @override
  _FacesScreenState createState() => _FacesScreenState();
}

class _FacesScreenState extends State<FacesScreen> {

  final _facesBloc = FacesBloc();

  @override
  void initState(){
    super.initState();
    _facesBloc.dispatch(FacesFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(bloc: _facesBloc, builder: (context, FacesState state){
        if(state is InitialFacesState){
          return Center(child: CircularProgressIndicator(),);
        }

        if(state is FacesLoaded){
          final items = state.persons;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(items[index].name),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('http://+'+state.endpoint+'/storage/'+items[index].photo),
                ),
              );
            },
          );
        }

        if(state is FacesError){
          return Center(child: Text('Error'),);
        }

        return Center(child: Text('default'),);
      },
      ),
    );
  }
}