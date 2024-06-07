import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/create_goal_component/create_goal_component_widget.dart';
import '/components/empty_list_component/empty_list_component_widget.dart';
import '/components/filter_dropdown/filter_dropdown_widget.dart';
import '/components/update_goal_component/update_goal_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, -5.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 2.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: const SizedBox(
                  height: 380.0,
                  child: CreateGoalComponentWidget(),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));

          setState(() => _model.requestCompleter = null);
          await _model.waitForRequestCompleted();
        },
        backgroundColor: FlutterFlowTheme.of(context).primary,
        elevation: 8.0,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.of(context).primaryButtonText,
          size: 24.0,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Lottie.asset(
                    'assets/lottie_animations/Target_Icon.json',
                    width: 70.0,
                    height: 70.0,
                    fit: BoxFit.cover,
                    repeat: false,
                    animate: true,
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: Text(
                        'My Goals',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Poppins',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.logout,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth('LoginPage', context.mounted);
                    },
                  ),
                  Builder(
                    builder: (context) => FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.filter_list,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        await showAlignedDialog(
                          context: context,
                          isGlobal: false,
                          avoidOverflow: true,
                          targetAnchor: const AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          followerAnchor: const AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          builder: (dialogContext) {
                            return const Material(
                              color: Colors.transparent,
                              child: SizedBox(
                                height: 150.0,
                                width: 260.0,
                                child: FilterDropdownWidget(),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));

                        setState(() => _model.requestCompleter = null);
                        await _model.waitForRequestCompleted();
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FutureBuilder<List<GoalsRow>>(
                      future: (_model.requestCompleter ??=
                              Completer<List<GoalsRow>>()
                                ..complete(GoalsTable().queryRows(
                                  queryFn: (q) => q
                                      .eq(
                                        'archived',
                                        FFAppState().filters.archived,
                                      )
                                      .order('created_at'),
                                )))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<GoalsRow> listViewGoalsRowList = snapshot.data!;
                        if (listViewGoalsRowList.isEmpty) {
                          return SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.8,
                            child: const EmptyListComponentWidget(),
                          );
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewGoalsRowList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewGoalsRow =
                                listViewGoalsRowList[listViewIndex];
                            return Stack(
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if (listViewGoalsRow.status ==
                                          'COMPLETED') {
                                        return FlutterFlowTheme.of(context)
                                            .secondary;
                                      } else if (listViewGoalsRow.status ==
                                          'IN PROGRESS') {
                                        return const Color(0xFFFC8A0C);
                                      } else {
                                        return const Color(0x00000000);
                                      }
                                    }(),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.goNamed(
                                        'TasksPage',
                                        queryParameters: {
                                          'goalId': serializeParam(
                                            listViewGoalsRow.id,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 200),
                                          ),
                                        },
                                      );
                                    },
                                    onLongPress: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: SizedBox(
                                              height: 380.0,
                                              child: UpdateGoalComponentWidget(
                                                goal: listViewGoalsRow,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      setState(
                                          () => _model.requestCompleter = null);
                                      await _model.waitForRequestCompleted();
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              listViewGoalsRow
                                                                  .title!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              listViewGoalsRow
                                                                  .description!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    lineHeight:
                                                                        1.4,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 5.0, 10.0, 5.0),
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: Stack(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  LinearPercentIndicator(
                                                    percent: (int numberTasks,
                                                            int completedTasks) {
                                                      return numberTasks != 0
                                                          ? (completedTasks /
                                                                  numberTasks) *
                                                              1.0
                                                          : 0.0;
                                                    }(
                                                        listViewGoalsRow
                                                            .noTasks,
                                                        listViewGoalsRow
                                                            .noTasksCor),
                                                    lineHeight: 5.0,
                                                    animation: true,
                                                    animateFromLastPercent:
                                                        true,
                                                    progressColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent4,
                                                    barRadius:
                                                        const Radius.circular(5.0),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  Container(
                                                    width: 40.0,
                                                    height: 25.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                      ),
                                                    ),
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.05),
                                                    child: Text(
                                                      '${valueOrDefault<String>(
                                                        formatNumber(
                                                          (int numberTasks,
                                                                  int
                                                                      completedTasks) {
                                                            return numberTasks !=
                                                                    0
                                                                ? (completedTasks /
                                                                        numberTasks) *
                                                                    100
                                                                : 0.0;
                                                          }(
                                                              listViewGoalsRow
                                                                  .noTasks,
                                                              listViewGoalsRow
                                                                  .progress),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '##0',
                                                          locale: '',
                                                        ),
                                                        '0',
                                                      )}%',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 10.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.tasks,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 16.0,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '${listViewGoalsRow.noTasks.toString()} / ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: Icon(
                                                    Icons.calendar_today,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 16.0,
                                                  ),
                                                ),
                                                Text(
                                                  dateTimeFormat(
                                                      'd/M/y',
                                                      dateTimeFromSecondsSinceEpoch(
                                                          valueOrDefault<int>(
                                                        listViewGoalsRow
                                                            .createdAt
                                                            ?.secondsSinceEpoch,
                                                        0,
                                                      ))),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation']!),
                                ),
                              ],
                            ).animateOnPageLoad(
                                animationsMap['stackOnPageLoadAnimation']!);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
