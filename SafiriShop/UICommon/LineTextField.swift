//
//  LineTextField.swift
//  SafiriShop
//
//  Created by Martin Wainaina on 14/11/2023.
//

import SwiftUI

struct LineTextField: View {
    
    @State var title: String = "Title"
    @State var placeholder: String = "This is placeholder"
    @Binding var txt: String
    @State var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack{

            /// Email
            Text(title)
                .font(.customfont(.semibold, fontSize: 18))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            
                TextField(placeholder, text: $txt)
                    .keyboardType(keyboardType)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(height: 40)
            

            
            Divider()
            
        }
    }
}



struct LineSecureField: View {
    @State var title: String = "Title"
    @State var placeholder: String = "This is placeholder"
    
    @Binding var txt: String
    @Binding var isShowPassword: Bool

    
    var body: some View {
        VStack{

            /// Email
            Text(title)
                .font(.customfont(.semibold, fontSize: 18))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if(isShowPassword){
                TextField(placeholder, text: $txt)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .modifier(ShowButton(isShow: $isShowPassword))
                    .frame(height: 40)
                
                
            }
            else{
                SecureField(placeholder, text: $txt)
                    .modifier(ShowButton(isShow: $isShowPassword))
                    
            }
            
            Divider()
            
        }
    }
}


struct LineTextField_Previews: PreviewProvider {
    @State static var txt: String = ""
    static var previews: some View {
        LineTextField(txt: $txt)
            .padding(20)
    }
}
