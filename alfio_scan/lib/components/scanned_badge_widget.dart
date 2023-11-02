import 'package:alfio_scan/components/event_widget.dart';
import 'package:alfio_scan/model/event_model.dart';
import 'package:alfio_scan/model/sponsor_scan_model.dart';
import 'package:alfio_scan/screens/event_list.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/account_model.dart';

class ScannedBadgeWidget extends StatefulWidget {
  ScannedBadgeWidget({Key? key, required this.sponsorScan}) : super(key: key);

  SponsorScan sponsorScan;

  @override
  _ScannedBadgeWidgetState createState() => _ScannedBadgeWidgetState(sponsorScan);
}

class _ScannedBadgeWidgetState extends State<ScannedBadgeWidget> {

  _ScannedBadgeWidgetState(this.sponsorScan);

  SponsorScan sponsorScan;


  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.3,
        // A motion is a widget used to control how the pane animates.
        motion: ScrollMotion(),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (_) {
              Provider.of<SponsorScanModel>(context, listen: false).deleteSponsorScan(sponsorScan);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          )
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap:  () {
            //TODO edit sponsor scan

          },
          title: Text(
            sponsorScan.attendeeFullName,
            style: FlutterFlowTheme
                .of(context)
                .title3,
          ),
          subtitle: Text(
            sponsorScan.badgeCode,
            style: FlutterFlowTheme
                .of(context)
                .subtitle2,
          ),
          leading: Icon(Icons.star, color: Colors.yellow[700], size: 20,),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.yellow[700]),
              SizedBox(width: 8.0),
              Icon(Icons.email, color: Colors.blue),
              SizedBox(width: 8.0),
              Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF303030),
                size: 20,
              ),
            ],
          ),

          tileColor: Color(0xFFF5F5F5),
          dense: false,
    ),
      ),);
  }

   /*


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Provider.of<EventModel>(context, listen: false).setAccountData(account);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EventListWidget()),
        );
      },
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
        child: Container(
          width: 100,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 0,
                color: Color(0xFFE0E3E7),
                offset: Offset(0, 1),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Color(0xFF4B39EF),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(44),
                      child: Image.network(
                        'https://picsum.photos/seed/183/600',
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: Text(
                            account.description,
                            style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF101213),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          account.baseUrl,
                          style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFF57636C),
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

    */


}
