import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'create_task_component_model.dart';
export 'create_task_component_model.dart';

class CreateTaskComponentWidget extends StatefulWidget {
  const CreateTaskComponentWidget({
    super.key,
    required this.goalId,
  });

  final int? goalId;

  @override
  State<CreateTaskComponentWidget> createState() =>
      _CreateTaskComponentWidgetState();
}

class _CreateTaskComponentWidgetState extends State<CreateTaskComponentWidget> {
  late CreateTaskComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateTaskComponentModel());

    _model.taskTitleTextController ??= TextEditingController();
    _model.taskTitleFocusNode ??= FocusNode();

    _model.taskDescriptionTextController ??= TextEditingController();
    _model.taskDescriptionFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 501.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Container(
                        width: 50.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0E3E7),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: Text(
                    'Create Task',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Poppins',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: TextFormField(
                    controller: _model.taskTitleTextController,
                    focusNode: _model.taskTitleFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Enter your task title ...',
                      hintStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 32.0, 20.0, 12.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                    textAlign: TextAlign.start,
                    validator: _model.taskTitleTextControllerValidator
                        .asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: TextFormField(
                    controller: _model.taskDescriptionTextController,
                    focusNode: _model.taskDescriptionFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Enter your task description ...',
                      hintStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 32.0, 20.0, 12.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                    textAlign: TextAlign.start,
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    validator: _model.taskDescriptionTextControllerValidator
                        .asValidator(context),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          await TasksTable().insert({
                            'title': _model.taskTitleTextController.text,
                            'description':
                                _model.taskDescriptionTextController.text,
                            'goal_id': widget.goalId,
                            'complete': false,
                            'user_id': currentUserUid,
                          });
                          Navigator.pop(context);
                        },
                        text: 'Create Task',
                        options: FFButtonOptions(
                          width: 270.0,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryButtonText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
