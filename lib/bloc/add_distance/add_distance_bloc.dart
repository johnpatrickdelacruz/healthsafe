import 'package:form_bloc/form_bloc.dart';
import 'package:healthsafe/network/abstract_repositories/distance_repository_providing.dart';
import 'package:healthsafe/network/helper/connectivity_helper.dart';
import 'package:healthsafe/network/repositories/distance_repository.dart';

import '../../locator.dart';

class AddDistanceBloc extends FormBloc<String, String> {
  final DistanceRepositoryProviding _distanceRepositoryProviding =
      serviceLocator<DistanceRepository>();

  final kilometerController = TextFieldBloc();

  AddDistanceBloc() {
    addFieldBlocs(
      fieldBlocs: [
        kilometerController,
      ],
    );
  }

  @override
  void onSubmitting() async {
    if (kilometerController.value.isNotEmpty) {
      if (!(await ConnectionHelper.hasConnection())) {
        emitFailure();
        return;
      }

      try {
        var result = await _distanceRepositoryProviding.addDistance(
            kilometer: kilometerController.value);

        if (result == 'success') {
          emitSuccess(
              successResponse:
                  kilometerController.value + ' Kilometer has been added');
        } else {
          emitFailure();
        }
      } catch (error) {
        emitFailure();
      }
    } else {
      kilometerController.addFieldError('Kilometer is required');
      emitFailure(failureResponse: 'show_field_error');
    }
  }
}
