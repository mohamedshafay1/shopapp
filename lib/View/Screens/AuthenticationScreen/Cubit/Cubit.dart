import 'package:bloc/bloc.dart';
import 'package:shopapp/Controller/Network/endpoint.dart';
import 'package:shopapp/View/Screens/AuthenticationScreen/Cubit/States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Controller/Remote/Dio_Helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{
  ShopLoginCubit():super(ShopLoginInitialState());

  static ShopLoginCubit get(context)=>BlocProvider.of(context);

  void userLogin({required String email,required String password}){
    emit(ShopLoginLoadingState());
    DioHelper.PostData(
        url: Login,
        data:{
          "email":email,
          "password":password
        }).then((value){
          print(value.data);
          emit(ShopLoginSuccessState());
    }).catchError((error){
      emit(ShopLoginErrorState(error.toString()));
      print(error.toString());
    });
  }

}