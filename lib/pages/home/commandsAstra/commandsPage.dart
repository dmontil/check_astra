import 'package:check_astra/blocs/bloc.dart';
import 'package:check_astra/pages/home/commandsAstra/widgets/buttons.dart';
import 'package:check_astra/pages/home/gps/mapPage.dart';
import 'package:check_astra/provider/commands_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommandsPage extends StatefulWidget {
  @override
  _CommandsPageState createState() => _CommandsPageState();
}

class _CommandsPageState extends State<CommandsPage> {
  CommandsBloc _commandsBloc;
  Size _screenSize;
  TextEditingController _commandController;
  bool _isOn;
  String _imei;
  String _responseAstra;
  String _lastConnection;
  @override
  void initState() {
    super.initState();
    _commandsBloc = CommandsBloc(logic: AstraProvider());
    _isOn = false;
    _imei = "";
    _responseAstra = "";
    _lastConnection = "";
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => _commandsBloc,
      child: BlocListener<CommandsBloc, CommandsState>(
        listener: (context, state) {
          if (state is ErrorCommandsState) {}
          if (state is PostedCommandsState) {
            _responseAstra = state.response;
          }
          if (state is PostinCommandsState) {}
          if (state is ScanedCommandsState) {
            _imei = state.barcode;
          }
          if(  state is ScootedCommandState){
            Navigator.of(context).push(MaterialPageRoute(builder: (_){
              return MapPage(position: state.position);
            }));
          }

        },
        child:
            BlocBuilder<CommandsBloc, CommandsState>(builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("TORROT"),
              actions: <Widget>[
                FlatButton(
                  child: Icon(
                    Icons.select_all,
                    size: 40,
                  ),
                  onPressed: _scan,
                ),
              ],
            ),
            floatingActionButton: Buttons().bSpeedDial(),
            body: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    rowImei(),
                    imageScooter(),
                    rowLastConnect(),
                    rowIndicators(60, 30, 90),
                    rowInfoCommand(),
                  ],
                ),
                Positioned(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: rowButtons(),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  _open() {
    _commandsBloc.add(PostCommandsEvent("\$TCOP,1", ""));
  }

  _powerOn() {
    _commandsBloc.add(PostCommandsEvent("\$PWON,1", ""));
  }

  _powerOff() {
    _commandsBloc.add(PostCommandsEvent("\$PWON,0", ""));
  }

  _find() {
    _commandsBloc.add(findScootEvent(_imei));
  }
  _scan() {
    _commandsBloc.add(ScanEvent());
  }

  rowImei() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        "IMEI: $_imei",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  imageScooter() {
    return Container(
      child: Image.network(
        "https://torrot.com/uploads/images/torrot-business/msg.jpg",
        height: _screenSize.height * 0.3,
      ),
    );
  }

  rowLastConnect() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        "La ultima conexion fue: $_lastConnection",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  rowInfoCommand() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Text("Consola: $_responseAstra"),
      ),
    );
  }

  rowButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _isOn
              ? Buttons()
                  .bFloatAction("off", Colors.red, Icons.flash_off, _powerOff)
              : Buttons()
                  .bFloatAction("on", Colors.green, Icons.flash_on, _powerOn),
          Buttons().bFloatAction("oopen", Colors.blue, Icons.lock_open, _open),
          Buttons().bFloatAction("find", Colors.blue, Icons.search, _find)
        ],
      ),
    );
  }
}

rowIndicators(int percent1, int percent2, int autonomy) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Buttons().bCircularPercentIndicator(
          percent1, "Bateria uno", Icons.battery_charging_full),
      Buttons().bCircularPercentIndicator(
          percent2, "Bateria dos", Icons.battery_charging_full),
      Buttons()
          .bCircularPercentIndicator(autonomy, "Autonomia /km", Icons.power),
    ],
  );
}
