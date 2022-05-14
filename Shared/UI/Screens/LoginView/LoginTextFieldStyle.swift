//
//  LoginTextFieldStyle.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import SwiftUI

struct LoginTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .disableAutocorrection(true)
            #if os(iOS)
            .keyboardType(.numberPad)
            .textInputAutocapitalization(.never)
            #endif
            .padding()
            .background(Color.lightGray)
            .cornerRadius(5)
    }
}
