//
//  RoundButtonView.swift
//  SafiriShop
//
//  Created by Martin Wainaina on 13/11/2023.
//

import SwiftUI

struct RoundButton: View {
    
    @State var title: String = "Title"
    @State var btnColor: Color = Color.primaryApp
    @State var icon: String = ""

    var didTap: (()->())?
    
    var body: some View {
        Button{
            didTap?()
        } label: {
            if(!icon.isEmpty){
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
            }
            
            
            Text(title)
                .font(.customfont(.semibold, fontSize: 18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .background(btnColor)
        .cornerRadius(20)
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton()
            .padding(20)
    }
}
