import '/flutter_flow/flutter_flow_util.dart';
import 'update_goal_component_widget.dart' show UpdateGoalComponentWidget;
import 'package:flutter/material.dart';

class UpdateGoalComponentModel
    extends FlutterFlowModel<UpdateGoalComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for GoalTitle widget.
  FocusNode? goalTitleFocusNode;
  TextEditingController? goalTitleTextController;
  String? Function(BuildContext, String?)? goalTitleTextControllerValidator;
  String? _goalTitleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for GoalDescription widget.
  FocusNode? goalDescriptionFocusNode;
  TextEditingController? goalDescriptionTextController;
  String? Function(BuildContext, String?)?
      goalDescriptionTextControllerValidator;
  String? _goalDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    goalTitleTextControllerValidator = _goalTitleTextControllerValidator;
    goalDescriptionTextControllerValidator =
        _goalDescriptionTextControllerValidator;
  }

  @override
  void dispose() {
    goalTitleFocusNode?.dispose();
    goalTitleTextController?.dispose();

    goalDescriptionFocusNode?.dispose();
    goalDescriptionTextController?.dispose();
  }
}
