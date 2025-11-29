import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'buy_crypto_state.dart';

class BuyCryptoCubit extends Cubit<BuyCryptoState> {
  BuyCryptoCubit() : super(BuyCryptoInitial());
}
