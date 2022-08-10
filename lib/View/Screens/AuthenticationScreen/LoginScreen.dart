import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/Cubit.dart';
import 'Cubit/States.dart';
import 'RegisterScreen.dart';
class LoginScreen extends StatelessWidget {
 var formkey=GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LOGIN",
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.black
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Login now to browse our hot offers",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextFormField(
                          controller:emailController ,
                          keyboardType:TextInputType.emailAddress ,
                          validator:(value)
                          {
                            if(value!.isEmpty)
                            {
                              return "please enter your email address";
                            }
                          } ,
                          decoration: InputDecoration(
                              prefixIcon:Icon(Icons.email_outlined) ,
                              labelText:"Enter Email Address",
                              border: OutlineInputBorder()
                          ),


                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller:passwordController ,
                          keyboardType:TextInputType.visiblePassword ,
                          validator:(value)
                          {
                            if(value!.isEmpty)
                            {
                              return "Invalid Password";
                            }
                          } ,
                          decoration: InputDecoration(
                            prefixIcon:Icon(Icons.lock_open_outlined) ,
                            suffixIcon:IconButton(
                              icon:Icon(Icons.visibility_outlined),
                              onPressed: (){},
                            ),
                            labelText:"Enter Password",
                            border: OutlineInputBorder(),



                          ),




                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(
                                3.0
                            ),
                          ),

                          child: ConditionalBuilder(
                            condition:state is! ShopLoginLoadingState ,
                            builder:(context)=>MaterialButton(
                              child: Text(
                                "LOGIN",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: (){
                                if (formkey.currentState!.validate()){
                                  ShopLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text
                                  );
                                }

                              },
                            ),
                            fallback: (context)=>Center(child: CircularProgressIndicator()),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "don\’t have an account ? "
                            ),
                            TextButton(
                                onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (BuildContext context) {
                                        return RigesterScreen();
                                      })
                                  );
                                },
                                child: Text("Register Now "))
                          ],
                        ),




                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
