import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/features/profile/presentation/view_model/change_password_cubit/change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
}
