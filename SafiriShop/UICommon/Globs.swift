//
//  Globs.swift
//  SafiriShop
//
//  Created by Martin Wainaina on 15/11/2023.
//

import Foundation
import SwiftUI

struct Globs{
    static let AppName = "SafiriShop"
    static let BASE_URL = "http://127.0.0.1:8000"
    static let LOGIN_URL = BASE_URL+"/api/auth/authenticate"
}

struct KKey{
    static let status = "status"
    static let message = "message"
    static let payload = "payload"
}
