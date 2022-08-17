import 'package:qcmapp/core/classes/statusrequest.dart';

StatusRequest handlingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.sucess;
  }
}
