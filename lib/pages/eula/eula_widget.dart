import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'eula_model.dart';
export 'eula_model.dart';

class EulaWidget extends StatefulWidget {
  const EulaWidget({Key? key}) : super(key: key);

  @override
  _EulaWidgetState createState() => _EulaWidgetState();
}

class _EulaWidgetState extends State<EulaWidget> {
  late EulaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EulaModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          25.0, 25.0, 25.0, 25.0),
                      child: FlutterFlowIconButton(
                        borderColor: Color(0x80FFFFFF),
                        borderRadius: 50.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: Color(0x4C000000),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('mainScreen');
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Text(
                      'Settings',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Outfit',
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          25.0, 25.0, 25.0, 25.0),
                      child: FlutterFlowIconButton(
                        borderColor: Color(0x80FFFFFF),
                        borderRadius: 50.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: Color(0x4C000000),
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 15.0, 15.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF484848),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'FlutterFlow',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  text: ' is pretty cool, huh?',
                                  style: TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                child: Text(
                  'www.DreamVizApps.com',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Gilroy',
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
