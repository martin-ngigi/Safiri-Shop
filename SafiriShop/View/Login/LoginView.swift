//
//  LoginView.swift
//  SafiriShop
//
//  Created by Martin Wainaina on 14/11/2023.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var loginVM = MainViewModel.shared
    
    var body: some View {
        ZStack{
            ///Bacground image
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            VStack{
                Image("color_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .padding(.bottom, .screenWidth * 0.1)


                
                Text("Login")
                    .font(.customfont(.semibold, fontSize: 26))
                    .foregroundColor(.primary)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 4)

                
                Text("Enter your email and password")
                    .font(.customfont(.semibold, fontSize: 18))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                /**
                VStack{
                    
                    /// Email
                    Text("Email")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.textTitle)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    TextField("Enter your email address", text: $loginVM.txtEmail)
                    
                    Divider()
                    
                }
                **/
                
                /// Email
                LineTextField(
                    title: "Email",
                    placeholder: "Enter your email address",
                    txt: $loginVM.txtEmail,
                    keyboardType: .emailAddress
                )
                .padding(.bottom, .screenWidth * 0.07)
                
                /// Password
                LineSecureField(
                    title: "Password",
                    placeholder: "Enter your password ",
                    txt: $loginVM.txtPassword,
                    isShowPassword: $loginVM.isShowPassword
                )
                .padding(.bottom, .screenWidth * 0.07)

                
                Button{
                    
                } label : {
                    Text("Forgot password ?")
                        .font(.customfont(.medium, fontSize: 18))
                        .foregroundColor(.primary)
                                                
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, .screenWidth*0.03)
                
                RoundButton(title: "Login"){
                    loginVM.serviceCallLogin()
                }
                .padding(.bottom, .screenWidth*0.03)
                
                HStack{
                    Text("Don't have an account ? ")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.primary)
//                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Text("Signup ")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.primaryApp)
                                                
                }
                
                Spacer()

            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)
            
            VStack{
                HStack{
                    
                    ///Back button
                    Button{
                        
                    }label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(
                            width: 20, height: 20)
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)

            
        }
        .alert(isPresented: $loginVM.showError,  content: {
            Alert(title: Text(Globs.AppName), message: Text(loginVM.errorMessage), dismissButton: .default(Text("OK")))
        })
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
