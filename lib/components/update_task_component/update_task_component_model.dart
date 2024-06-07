import '/flutter_flow/flutter_flow_util.dart';
import 'update_task_component_widget.dart' show UpdateTaskComponentWidget;
import 'package:flutter/material.dart';

class UpdateTaskComponentModel
    extends FlutterFlowModel<UpdateTaskComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TaskTitle widget.
  FocusNode? taskTitleFocusNode;
  TextEditingController? taskTitleTextController;
  String? Function(BuildContext, String?)? taskTitleTextControllerValidator;
  String? _taskTitleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TaskDescription widget.
  FocusNode? taskDescriptionFocusNode;
  TextEditingController? taskDescriptionTextController;
  String? Function(BuildContext, String?)?
      taskDescriptionTextControllerValidator;
  String? _taskDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    taskTitleTextControllerValidator = _taskTitleTextControllerValidator;
    taskDescriptionTextControllerValidator =
        _taskDescriptionTextControllerValidator;
  }

  @override
  void dispose() {
    taskTitleFocusNode?.dispose();
    taskTitleTextController?.dispose();

    taskDescriptionFocusNode?.dispose();
    taskDescriptionTextController?.dispose();
  }
}
