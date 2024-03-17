import 'package:bloc/bloc.dart';
import 'package:kredit_app/model/credit_model.dart';
import 'package:kredit_app/service/credit_api.dart';
import 'package:meta/meta.dart';

part 'credit_event.dart';
part 'credit_state.dart';

class CreditBloc extends Bloc<CreditEvent, CreditState> {
  CreditBloc() : super(CreditInitial()) {
    final api = CreditApi();

    on<CreditPostEvent>(
      (event, emit) async {
        try {
          emit(CreditLoading());
          final bool data = await api.predict(credit: event.credit);
          emit(CreditSuccess(data));
        } catch (e) {
          emit(CreditError(e.toString()));
        }
      },
    );

    on<CreditInitialEvent>(
      (event, emit) async {
        final String _ = await api.check();
        emit(CreditInitial());
      },
    );
  }
}
