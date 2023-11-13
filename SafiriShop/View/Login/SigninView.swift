//
//  SigninView.swift
//  SafiriShop
//
//  Created by Martin Wainaina on 13/11/2023.
//

import SwiftUI
import CountryPicker

struct SigninView: View {
    
    @State var textMobile: String = ""
    @State var isShowPicker: Bool = false
    @State var countryObj: Country?
    
    var body: some View {
        ZStack(){
            ///Bacground image
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)

            VStack{
                Image("sign_in_top")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenWidth)
                
                Spacer()
            }
            
            ScrollView{
                VStack(alignment: .leading){
                    
                    Text("Get your groceries\nwith our Shop at affordable price")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 25)
                    
                    HStack{
                        Button{
                            isShowPicker = true
                        } label: {
                            //Image("")
                            
                            if let countryObj = countryObj{
                                
                                ///Country flag
                                Text("\(countryObj.isoCode.getFlag())")
                                    .font(.customfont(.medium, fontSize: 35))
                                
                                ///Country code
                                Text("+\(countryObj.phoneCode)")
                                    .font(.customfont(.medium, fontSize: 18))
                                    .foregroundColor(.primaryText)
                            }
                            
                            
                            
                        }
                        TextField("Enter mobile",
                        text: $textMobile)
                        .foregroundColor(.primaryText)
                        .keyboardType(.numberPad)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .onTapGesture {
                            // Dismiss the keyboard when tapped outside the text field
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            
                        }
                        .padding()
                       
                        
                    }
                    Divider()
                        .padding(.bottom, 26)
                    
                    Text("Or connect with social meadia")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.textTitle)
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 25)
                    
                    /// Google
                    RoundButton(title: "Continue with Google.",
                                btnColor: Color(hex: "5383EC"),
                    icon: "google_logo"){
                        
                    }
                    .padding(.bottom, 8)
                    
                    /// Facebook
                    RoundButton(title: "Continue with facebook.",
                                btnColor: Color(hex: "4A66AC"),
                    icon: "fb_logo"){
                        
                    }
                    
                    
                    
                    
                }
                .padding(.horizontal, 20)
                .frame(width: .infinity, alignment: .leading)
                .padding(.top, .topInsets + .screenWidth )
            }

        }
        .sheet(isPresented: $isShowPicker, content: {
            CountryPickerUI(country: $countryObj)
        })
        .onAppear{
            self.countryObj = Country(phoneCode: "254", isoCode: "KE")
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .background(Color.white)
        .onTapGesture {
            // Dismiss the keyboard when tapped outside the text field
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            
        }
        .padding()
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
