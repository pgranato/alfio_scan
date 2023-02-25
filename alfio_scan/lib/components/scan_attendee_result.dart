import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



class ScanAttendeeResultWidget extends StatefulWidget {
  const ScanAttendeeResultWidget({Key? key}) : super(key: key);

  @override
  _ScanAttendeeResultWidgetState createState() =>
      _ScanAttendeeResultWidgetState();
}

class _ScanAttendeeResultWidgetState extends State<ScanAttendeeResultWidget> {


  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).secondaryBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/729/600',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              'Hello World',
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
            Text(
              'Hello World',
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
            Text(
              'Hello World',
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
            Spacer(),
            FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: 'Button',
              options: FFButtonOptions(
                width: 130,
                height: 40,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 8.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
