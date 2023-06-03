import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'on_boarding_model.dart';
export 'on_boarding_model.dart';

class OnBoardingWidget extends StatefulWidget {
  const OnBoardingWidget({Key? key}) : super(key: key);

  @override
  _OnBoardingWidgetState createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  late OnBoardingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnBoardingModel());
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 75.0, 0.0, 0.0),
                child: Container(
                  width: 100.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: Text(
                    'Welcome to Dream Pulse',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dreamer-chat-bm9zw7/assets/5yjmcj1rh1bk/Logo_With_Pulse.png',
                      width: 300.0,
                      height: 667.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                child: Text(
                  'Simply. Beautiful AI\n Chat',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 38.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                child: Text(
                  'When simplicity meets the infinite potential of AI, dreams pulse.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(150.0, 15.0, 150.0, 15.0),
                    // EdgeInsetsDirectional.fromSTEB(150.0, 75.0, 150.0, 75.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('login');
                  },
                  text: 'Begin',
                  options: FFButtonOptions(
                    width: 0.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF09A5FC),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
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
