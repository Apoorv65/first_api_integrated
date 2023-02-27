import 'package:api_integration/bloc/info_bloc.dart';
import 'package:api_integration/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final InfoBloc _infoBloc = InfoBloc();

  @override
  void initState() {
    _infoBloc.add(GetInfoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: _buildListInfo()

    );
  }

  Widget _buildListInfo() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: BlocProvider(
          create: (_) => _infoBloc,
          child: BlocListener<InfoBloc, InfoState>(
            listener: (context, state) {
           if(state is InfoError){
             ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text(state.msg!)));
           }
          },
            child: BlocBuilder<InfoBloc, InfoState>(
                builder:  (context, state){
                  if(state is InfoInitial){
                    return _buildLoader();
                  }else if
                    (state is InfoLoading){
                    return _buildLoader();
                    }else if(state is InfoLoaded){
                    return _buildCard(context,state.postResponseModel as List<PostResponseModel>);
                    }else if(state is InfoError){
                    return Container();
                  }else {
                    return Container();
                  }
                  }
                  ),
          )
      ),
    );
  }

  Widget _buildLoader() => const Center(
    child: CircularProgressIndicator()
  );

  Widget _buildCard(BuildContext context, List<PostResponseModel> model) {
    return ListView.builder(
        itemCount: model.length,
        itemBuilder: (context,index){
          return Container(
            color: Colors.blueGrey.shade100,
          margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User ID : ${model[index].userId}',
                      style: const TextStyle(fontSize: 10)),
                  const SizedBox(height: 5),
                  Text('ID : ${model[index].id}',
                      style: const TextStyle(fontSize: 10)),
                  const SizedBox(height: 5),
                  Text('Data : ${model[index].title}',
                      style: const TextStyle(fontSize: 10)),
                  const SizedBox(height: 5),
                  Text('${model[index].body}',
                      style: const TextStyle(fontSize: 10)),
                ]),
          ),
        );
      }
    );
  }

}
