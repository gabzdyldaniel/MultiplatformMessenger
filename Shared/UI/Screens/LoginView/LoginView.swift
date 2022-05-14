//
//  LoginView.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import SwiftUI

struct LoginView: View {

    @StateObject private var viewModel = ViewModel()

    var body: some View {
        VStack {
            TextField("Osobní číslo", text: $viewModel.personalNr)
                .textFieldStyle(LoginTextFieldStyle())

            SecureField("Pin", text: $viewModel.pin)
                .textFieldStyle(LoginTextFieldStyle())

            Button(action: {
                viewModel.signIn()
            }, label: {
                Text("Přihlásit se")
            })
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
