import 'package:intl/intl.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/account_model.dart';
import '../model/event_model.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../model/stat_event_model.dart';

class AttendeeScannerScreenWidget extends StatefulWidget {
  AttendeeScannerScreenWidget({Key? key, required this.event}) : super(key: key);

  Event event;

  @override
  _AttendeeScannerScreenWidgetState createState() => _AttendeeScannerScreenWidgetState(event);
}

class _AttendeeScannerScreenWidgetState extends State<AttendeeScannerScreenWidget> {
  _AttendeeScannerScreenWidgetState(this.event);

  Event event;
  MobileScannerController cameraController = MobileScannerController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //context.watch<FFAppState>();

    return Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () async {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 32,
            ),
          ),
          title: Text(
            event.name,
            style: FlutterFlowTheme.of(context).title2,
          ),
          actions: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state as CameraFacing) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.switchCamera(),
            ),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: Consumer2<EventModel, StatEventModel>(builder: (context, eventModel, statEventModel, child) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                         "${statEventModel.stats.checkedIn} / ${statEventModel.stats.totalAttendees} at ${statEventModel.stats.lastUpdate}",
                        style: FlutterFlowTheme.of(context).title2,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'b',
                        style: FlutterFlowTheme.of(context).title2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 9,
                child: MobileScanner(
                    fit: BoxFit.scaleDown,
                    allowDuplicates: false,
                    controller: cameraController,
                    onDetect: (barcode, args) {
                      if (barcode.rawValue == null) {
                        debugPrint('Failed to scan Barcode');
                      } else {
                        final String code = barcode.rawValue!;
                        debugPrint('Barcode found! $code');
                        //TODO
                        //Provider.of<AccountModel>(context, listen: false).addAccountFromJson("{\"baseUrl\":\"https://m4.test.alf.io\",\"apiKey\":\"2a47074c-6988-4024-91a2-09d1b9d67996\"}");
                      }
                    }),
              ),
            ],
          );
        }));
  }
}
