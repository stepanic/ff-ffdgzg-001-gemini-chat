import '/components/add_api_key/add_api_key_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'top_header_model.dart';
export 'top_header_model.dart';

class TopHeaderWidget extends StatefulWidget {
  const TopHeaderWidget({super.key});

  @override
  State<TopHeaderWidget> createState() => _TopHeaderWidgetState();
}

class _TopHeaderWidgetState extends State<TopHeaderWidget> {
  late TopHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopHeaderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              valueOrDefault<double>(
                MediaQuery.sizeOf(context).width < kBreakpointSmall
                    ? 16.0
                    : 22.0,
                22.0,
              ),
              14.0,
              valueOrDefault<double>(
                MediaQuery.sizeOf(context).width < kBreakpointSmall
                    ? 16.0
                    : 22.0,
                22.0,
              ),
              12.0),
          child: SafeArea(
            child: Container(
              width: double.infinity,
              height: 36.0,
              decoration: const BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'FFDGZG Gemini Chat',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Builder(
                          builder: (context) => Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 6.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 4.0,
                              buttonSize: 36.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              hoverColor: FlutterFlowTheme.of(context).slate50,
                              hoverIconColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              icon: Icon(
                                Icons.key,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 18.0,
                              ),
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: const AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: const AddApiKeyWidget(),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 4.0,
                            buttonSize: 36.0,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            hoverColor: FlutterFlowTheme.of(context).slate50,
                            hoverIconColor:
                                FlutterFlowTheme.of(context).primaryText,
                            icon: Icon(
                              Icons.sunny_snowing,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 18.0,
                            ),
                            onPressed: () async {
                              if (Theme.of(context).brightness ==
                                  Brightness.dark) {
                                setDarkModeSetting(context, ThemeMode.light);
                                return;
                              } else {
                                setDarkModeSetting(context, ThemeMode.dark);
                                return;
                              }
                            },
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 4.0,
                          buttonSize: 36.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          hoverColor: FlutterFlowTheme.of(context).slate50,
                          hoverIconColor:
                              FlutterFlowTheme.of(context).primaryText,
                          icon: Icon(
                            FFIcons.krotateRefreshLoading3,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 18.0,
                          ),
                          onPressed: () async {
                            FFAppState().prompt = '';
                            FFAppState().chat = [];
                            FFAppState().update(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ].divide(const SizedBox(width: 12.0)),
              ),
            ),
          ),
        ),
        Divider(
          height: 1.0,
          thickness: 0.5,
          color: FlutterFlowTheme.of(context).divider,
        ),
      ],
    );
  }
}
