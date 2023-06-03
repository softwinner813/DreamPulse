import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());
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
        drawer: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Drawer(
            elevation: 16.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/DreamPulse_Logo.png',
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: 150.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('mainScreen');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    decoration: BoxDecoration(),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('mainScreen');
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 8.0, 8.0, 8.0),
                                            child: Icon(
                                              Icons.now_widgets,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              size: 28.0,
                                            ),
                                          ),
                                          Text(
                                            'Main Board',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 16.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (scaffoldKey.currentState!.isDrawerOpen ||
                                    scaffoldKey.currentState!.isEndDrawerOpen) {
                                  Navigator.pop(context);
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 8.0, 8.0, 8.0),
                                          child: Icon(
                                            Icons.settings_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 28.0,
                                          ),
                                        ),
                                        Text(
                                          'Settings',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.pushNamedAuth('login', context.mounted);
                            },
                            text: 'Logout',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
                          context.safePop();
                        },
                      ),
                    ),
                  ),
                  Expanded(child:
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
                        onPressed: () async {
                          scaffoldKey.currentState!.openDrawer();
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF2B2B30),
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Color(0x00FFFFFF),
                              ),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('accountSettings');
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.settings_outlined,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      'Account',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFFFDFEFF),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF2B2B30),
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Color(0x00FFFFFF),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.settings_outlined,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Text(
                                    'Help Center',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFFDFEFF),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF2B2B30),
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Color(0x00FFFFFF),
                              ),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('eula');
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.settings_outlined,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      'Terms of \nUse',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFFFDFEFF),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF2B2B30),
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Color(0x00FFFFFF),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.settings_outlined,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Text(
                                    'Privacy \nPolicy',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFFDFEFF),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF2B2B30),
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Color(0x00FFFFFF),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.settings_outlined,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Text(
                                    'Licenses',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFFDFEFF),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).error,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Color(0x00FFFFFF),
                              ),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth(
                                    'onBoarding', context.mounted);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      'Signout',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFFFDFEFF),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                child: Text(
                  'App Version 1.44',
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
