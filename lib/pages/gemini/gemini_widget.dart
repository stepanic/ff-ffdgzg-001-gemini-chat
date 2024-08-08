import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_api_key/add_api_key_widget.dart';
import '/components/chat_bubble/chat_bubble_widget.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/components/top_header/top_header_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'gemini_model.dart';
export 'gemini_model.dart';

class GeminiWidget extends StatefulWidget {
  const GeminiWidget({super.key});

  @override
  State<GeminiWidget> createState() => _GeminiWidgetState();
}

class _GeminiWidgetState extends State<GeminiWidget> {
  late GeminiModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GeminiModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().geminiApiKey == 'NOT_SET') {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: const AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () => FocusScope.of(dialogContext).unfocus(),
                child: const AddApiKeyWidget(),
              ),
            );
          },
        );
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              VerticalDivider(
                width: 1.0,
                thickness: 0.5,
                color: FlutterFlowTheme.of(context).divider,
              ),
              Expanded(
                child: Container(
                  width: 100.0,
                  height: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.topHeaderModel,
                        updateCallback: () => setState(() {}),
                        child: const TopHeaderWidget(),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: const BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final message =
                                              FFAppState().chat.toList();
                                          if (message.isEmpty) {
                                            return const Center(
                                              child: SizedBox(
                                                width: 150.0,
                                                height: 150.0,
                                                child: EmptyStateWidget(),
                                              ),
                                            );
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.fromLTRB(
                                              0,
                                              0,
                                              0,
                                              valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                            .width <
                                                        kBreakpointSmall
                                                    ? 105.0
                                                    : 150.0,
                                                150.0,
                                              ),
                                            ),
                                            scrollDirection: Axis.vertical,
                                            itemCount: message.length,
                                            itemBuilder:
                                                (context, messageIndex) {
                                              final messageItem =
                                                  message[messageIndex];
                                              return Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        1.0, 0.0, 0.0, 0.0),
                                                child: ChatBubbleWidget(
                                                  key: Key(
                                                      'Keyr3n_${messageIndex}_of_${message.length}'),
                                                  message: messageItem,
                                                ),
                                              );
                                            },
                                            controller:
                                                _model.chatListviewScrollable,
                                          );
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 3.0,
                                            sigmaY: 3.0,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .backgroundAlpha,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  child: Container(
                                                    constraints: const BoxConstraints(
                                                      maxWidth: 850.0,
                                                    ),
                                                    decoration: const BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          30.0,
                                                                          0.0),
                                                              child: SizedBox(
                                                                width: 222.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textController,
                                                                  focusNode: _model
                                                                      .textFieldFocusNode,
                                                                  onFieldSubmitted:
                                                                      (_) async {
                                                                    FFAppState()
                                                                            .prompt =
                                                                        _model
                                                                            .textController
                                                                            .text;
                                                                    FFAppState()
                                                                        .addToChat(
                                                                            MessageStruct(
                                                                      text: _model
                                                                          .textController
                                                                          .text,
                                                                      role:
                                                                          'user',
                                                                    ));
                                                                    setState(
                                                                        () {});
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .textController
                                                                          ?.clear();
                                                                    });
                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            500));
                                                                    await _model
                                                                        .chatListviewScrollable
                                                                        ?.animateTo(
                                                                      _model
                                                                          .chatListviewScrollable!
                                                                          .position
                                                                          .maxScrollExtent,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              300),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                    FFAppState()
                                                                        .addToChat(
                                                                            MessageStruct(
                                                                      text: '',
                                                                      role:
                                                                          'model',
                                                                    ));
                                                                    setState(
                                                                        () {});
                                                                    _model.response =
                                                                        await GeminiCall
                                                                            .call(
                                                                      messagesJson: functions.formatMessages(FFAppState()
                                                                          .chat
                                                                          .toList()),
                                                                      systemMessage:
                                                                          FFAppState()
                                                                              .systemMessage,
                                                                      apiKey: FFAppState()
                                                                          .geminiApiKey,
                                                                    );
                                                                    if (_model
                                                                            .response
                                                                            ?.succeeded ??
                                                                        true) {
                                                                      _model
                                                                          .response
                                                                          ?.streamedResponse
                                                                          ?.stream
                                                                          .transform(utf8
                                                                              .decoder)
                                                                          .transform(
                                                                              const LineSplitter())
                                                                          .transform(
                                                                              ServerSentEventLineTransformer())
                                                                          .map((m) =>
                                                                              ResponseStreamMessage(message: m))
                                                                          .listen(
                                                                        (onMessageInput) async {
                                                                          FFAppState()
                                                                              .updateChatAtIndex(
                                                                            FFAppState().chat.length -
                                                                                1,
                                                                            (e) => e
                                                                              ..text = '${FFAppState().chat[FFAppState().chat.length - 1].text}${GeminiCall.segment(
                                                                                onMessageInput.serverSentEvent.jsonData,
                                                                              )}',
                                                                          );
                                                                          setState(
                                                                              () {});
                                                                          unawaited(
                                                                            () async {
                                                                              await _model.chatListviewScrollable?.animateTo(
                                                                                _model.chatListviewScrollable!.position.maxScrollExtent,
                                                                                duration: const Duration(milliseconds: 150),
                                                                                curve: Curves.ease,
                                                                              );
                                                                            }(),
                                                                          );
                                                                        },
                                                                        onError:
                                                                            (onErrorInput) async {
                                                                          FFAppState()
                                                                              .addToChat(MessageStruct(
                                                                            text:
                                                                                'Oops, sorry that didn\'t go through. Try again or refresh!',
                                                                            role:
                                                                                'model',
                                                                          ));
                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        onDone:
                                                                            () async {
                                                                          await _model
                                                                              .chatListviewScrollable
                                                                              ?.animateTo(
                                                                            _model.chatListviewScrollable!.position.maxScrollExtent,
                                                                            duration:
                                                                                const Duration(milliseconds: 300),
                                                                            curve:
                                                                                Curves.ease,
                                                                          );
                                                                        },
                                                                      );
                                                                    }

                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            300));
                                                                    await _model
                                                                        .chatListviewScrollable
                                                                        ?.animateTo(
                                                                      _model
                                                                          .chatListviewScrollable!
                                                                          .position
                                                                          .maxScrollExtent,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              300),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintText:
                                                                        'Write your prompt here...',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    enabledBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    focusedBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    errorBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    focusedErrorBorder:
                                                                        InputBorder
                                                                            .none,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                  cursorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  validator: _model
                                                                      .textControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            borderRadius: 6.0,
                                                            buttonSize: 40.0,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            hoverColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            hoverIconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            icon: Icon(
                                                              FFIcons
                                                                  .kimagePictureAddPlus,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                            onPressed: () {
                                                              print(
                                                                  'IconButton pressed ...');
                                                            },
                                                          ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                          ))
                                                            FlutterFlowIconButton(
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              borderRadius: 6.0,
                                                              buttonSize: 40.0,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              hoverIconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              icon: Icon(
                                                                FFIcons
                                                                    .kattachmentLink,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 20.0,
                                                              ),
                                                              onPressed: () {
                                                                print(
                                                                    'IconButton pressed ...');
                                                              },
                                                            ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                          ))
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                borderRadius:
                                                                    6.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                hoverColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                hoverIconColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                icon: Icon(
                                                                  FFIcons
                                                                      .kmicRec,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 21.0,
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      'IconButton pressed ...');
                                                                },
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
