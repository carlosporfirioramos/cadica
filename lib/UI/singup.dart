import 'package:cadica/contants.dart';
import 'package:flutter/material.dart';
import '../Model/user.dart';
import '../main.dart';
import 'concluido.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key,required this.user}) : super(key: key);
  final User? user;
  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  TextEditingController _nameFormController = TextEditingController();
  TextEditingController _emailFormController = TextEditingController();
  TextEditingController _passwordFormController = TextEditingController();
  TextEditingController _repeatPasswordFormController = TextEditingController();
  TextEditingController _surnameFormController = TextEditingController();
  TextEditingController _phoneFormController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: kPrimaryDelivery2,
        // leading: InkWell(
        //   onTap: () {
        //     Navigator.of(context).pop();
        //   },
        //   child: Icon(
        //     Icons.arrow_back,
        //     color: Colors.white,
        //   ),
        // ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          // height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 28.0, bottom: 30, top: 10),
                  child: Text(
                    "Registar-se",
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600)
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12))),
                    child: Column(
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Campo obrigatório";
                                    }
                                  },
                                  controller: _nameFormController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 10),
                                      labelText: "Nome",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(50))),
                                ),
                                height:
                                MediaQuery.of(context).size.height / 16,
                                width:
                                MediaQuery.of(context).size.width / 2.5,
                                // width: 306,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Campo obrigatório";
                                    }
                                  },
                                  controller: _surnameFormController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      labelText: "Sobrenome",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(50))),
                                ),
                                height:
                                MediaQuery.of(context).size.height / 16,
                                width:
                                MediaQuery.of(context).size.width / 2.5,
                                // width: 306,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Campo obrigatório";
                                    }
                                  },
                                  controller: _emailFormController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      labelText: "E-mail",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                ),
                                height: MediaQuery.of(context).size.height / 16,
                                // width: 306,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Campo obrigatório";
                                    }
                                  },
                                  controller: _phoneFormController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      labelText: "Telefone",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                ),
                                height: MediaQuery.of(context).size.height / 16,
                                // width: 306,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Campo obrigatório";
                                    }
                                  },
                                  controller: _passwordFormController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.vpn_key,
                                        size: 22,
                                      ),
                                      labelText: "Palavra-passe",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                ),
                                height: MediaQuery.of(context).size.height / 16,
                                // width: 306,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Campo obrigatório";
                                    } else if (value !=
                                        _passwordFormController.text) {
                                      return "A palavra passe não coincide";
                                    }
                                  },
                                  controller: _repeatPasswordFormController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.vpn_key,
                                        size: 22,
                                      ),
                                      labelText: "Confirma palavra-passe",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                ),
                                height: MediaQuery.of(context).size.height / 16,
                                // width: 306,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Wrap(
                                  children: [
                                    Text(
                                        "Ao continuar, você concorda com os nossos"),
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             PoliticsAndPrivacy()));
                                      },
                                      child: Text(
                                        " Termos de uso",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                    Text(" e "),
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             PoliticsAndPrivacy()));
                                      },
                                      child: Text(
                                        "Política de Privacidade.",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      backgroundColor: Colors.black,
                                      minimumSize: Size(
                                          600,
                                          MediaQuery.of(context).size.height /
                                              16)),
                                  onPressed: () {

                                    if (formKey.currentState!.validate()) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Concluido()));
                                    }
                                  },
                                  child: Text(
                                    "CONTINUAR",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class CreateUserAddressPage extends StatefulWidget {
//   // const CreateUserAddressPage({Key? key}) : super(key: key);
//
//   // Usuario user;
//   CreateUserAddressPage();
//
//   @override
//   _CreateUserAddressPageState createState() => _CreateUserAddressPageState();
// }
//
// class _CreateUserAddressPageState extends State<CreateUserAddressPage> {
//
//   TextEditingController _provinceFormController = TextEditingController();
//   TextEditingController _cityFormController = TextEditingController();
//   TextEditingController _districtFormController = TextEditingController();
//   TextEditingController _streetFormController = TextEditingController();
//   TextEditingController _houseNumberFormController = TextEditingController();
//   TextEditingController _phoneNumberFormController = TextEditingController();
//   TextEditingController _referencePointsFormController = TextEditingController();
//
//   final GlobalKey<FormState> formKey = GlobalKey();
//
//   bool _isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kPrimaryDelivery2,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: kPrimaryDeliveryLightColor2,
//         leading: InkWell(
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//           child: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           child: SingleChildScrollView(
//             physics: NeverScrollableScrollPhysics(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(left: 28.0, bottom: 30, top: 10),
//                   child: Text(
//                     "Adicionar endereço",
//                     // style: AppTextSyles.title,
//                   ),
//                 ),
//                 Container(
//                   height: MediaQuery.of(context).size.height / 1.25,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius:
//                           BorderRadius.vertical(top: Radius.circular(12))),
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         top: 28.0, left: 28.0, right: 28.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Form(
//                           key: formKey,
//                           child: Column(
//                             children: [
//                               Container(
//                                 child: TextFormField(
//                                   controller: _provinceFormController,
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return "Campo obrigatorio";
//                                     }
//                                   },
//                                   keyboardType: TextInputType.emailAddress,
//                                   decoration: InputDecoration(
//                                       contentPadding:
//                                           const EdgeInsets.symmetric(
//                                               vertical: 20, horizontal: 10),
//                                       labelText: "Província",
//                                       border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(50))),
//                                 ),
//                                 height: MediaQuery.of(context).size.height / 16,
//                                 // width: 306,
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Container(
//                                 child: TextFormField(
//                                   controller: _cityFormController,
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return "Campo obrigatorio";
//                                     }
//                                   },
//                                   keyboardType: TextInputType.emailAddress,
//                                   decoration: InputDecoration(
//                                       labelText: "Município",
//                                       border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(50))),
//                                 ),
//                                 height: MediaQuery.of(context).size.height / 16,
//                                 // width: 306,
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Container(
//                                 child: TextFormField(
//                                   controller: _districtFormController,
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return "Campo obrigatorio";
//                                     }
//                                   },
//                                   keyboardType: TextInputType.emailAddress,
//                                   decoration: InputDecoration(
//                                       labelText: "Bairro",
//                                       border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(50))),
//                                 ),
//                                 height: MediaQuery.of(context).size.height / 16,
//                                 // width: 306,
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Container(
//                                 child: TextFormField(
//                                   controller: _streetFormController,
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return "Campo obrigatorio";
//                                     }
//                                   },
//                                   keyboardType: TextInputType.emailAddress,
//                                   decoration: InputDecoration(
//                                       labelText: "Rua",
//                                       border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(50))),
//                                 ),
//                                 height: MediaQuery.of(context).size.height / 16,
//                                 // width: 306,
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Container(
//                                 child: TextFormField(
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return "Campo obrigatorio";
//                                     }
//                                   },
//                                   controller: _houseNumberFormController,
//                                   keyboardType: TextInputType.emailAddress,
//                                   decoration: InputDecoration(
//                                       labelText: "Casa | Edificio",
//                                       border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(50))),
//                                 ),
//                                 height: MediaQuery.of(context).size.height / 16,
//                                 // width: 306,
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Container(
//                                 child: TextFormField(
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return "Campo obrigatorio";
//                                     }
//                                   },
//                                   controller: _referencePointsFormController,
//                                   keyboardType: TextInputType.emailAddress,
//                                   decoration: InputDecoration(
//                                       labelText: "Ponto de Referência",
//                                       border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(50))),
//                                 ),
//                                 height: MediaQuery.of(context).size.height / 16,
//                                 // width: 306,
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Container(
//                                 child: TextFormField(
//                                   controller: _phoneNumberFormController,
//                                   keyboardType: TextInputType.phone,
//                                   decoration: InputDecoration(
//                                       labelText: "Contacto",
//                                       border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(50))),
//                                 ),
//                                 height: MediaQuery.of(context).size.height / 16,
//                                 // width: 306,
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               TextButton(
//                                   style: TextButton.styleFrom(
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(50)),
//                                       backgroundColor: kPrimaryDelivery2,
//                                       minimumSize: Size(
//                                           600,
//                                           MediaQuery.of(context).size.height /
//                                               16)),
//                                   onPressed: () async {
//                                     if (formKey.currentState!.validate()) {
//                                       _setLoading(true);
//                                       }
//                                   },
//                                   child: _isLoading
//                                       ? Container(
//                                           width: 20,
//                                           height: 20,
//                                           child: CircularProgressIndicator(
//                                             valueColor:
//                                                 AlwaysStoppedAnimation<Color>(
//                                                     Colors.white),
//                                           ),
//                                         )
//                                       : Text(
//                                           "REGISTAR",
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 18),
//                                         ))
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   _setLoading(value) {
//     setState(() {
//       _isLoading = value;
//     });
//   }
// }