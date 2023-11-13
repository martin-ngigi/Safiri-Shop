//
//  WelcomeView.swift
//  SafiriShop
//
//  Created by Martin Wainaina on 13/11/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack{
            ///Background image.
            Image("welcom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Spacer()
                
                Image("app_logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 8)
                
                /// Welcome text
                Text("Welcome\nto our store")
                    .font(.customfont(.semibold, fontSize: 40))
                    .foregroundColor(.white)
                    .padding(.bottom, 8)
                
                /// Get your groceries Text
                Text("Get your groceries in as fast as one hour")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                ///Get started button
                NavigationLink{
                    SigninView()
                } label: {
                    RoundButton(title: "Get started"){
                        
                    }
                }
                
                Spacer()
                    .frame(height: 80)
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()

    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            WelcomeView()
        }
    }
}
