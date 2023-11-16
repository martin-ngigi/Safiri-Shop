//
//  MainViewModel.swift
//  SafiriShop
//
//  Created by Martin Wainaina on 14/11/2023.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    static var shared: MainViewModel = MainViewModel()
    
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    init() {
      
        #if DEBUG
        txtEmail = "test6@gmail.com"
        txtPassword = "123456"
        #endif
        
    }
    
    ///Mark: ServiceCall
    func serviceCallLogin(){
        
        /// Validate data
        if(txtEmail.isEmpty){
            self.errorMessage = "plesase enter a valid email "
            self.showError = true
            return
        }
        if(txtPassword.isValidEmail){
            self.errorMessage = "plesase enter a valid passwaord "
            self.showError = true
            return
        }
        if(txtPassword.count < 6){
            self.errorMessage = "Password must be at least 6 characters long"
            self.showError = true
            return
        }
        print("Hey there")
        
        ServiceCall.post(
            parameter: [
                "email":txtEmail,
                "password":txtPassword,
            ],
            path: Globs.LOGIN_URL) { responseObj in
                if let response = responseObj as? NSDictionary {
                    print("Login response: \(response)");
                    if response.value(forKey: KKey.status) as? String ?? "" == "1"{
                        print(response);
                        self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Login Success"
                        self.showError = true
                    }
                    else{
                        self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Login Failed"
                        self.showError = false
                    }
                }
                
            } failure: { error in
                self.errorMessage = error?.localizedDescription ?? "Login Failed"
                self.showError = false
            }

    }
}
