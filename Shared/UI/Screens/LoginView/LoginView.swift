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
        BaseView(isLoading: $viewModel.isLoading) {
            VStack {
                Text("Přihlášení")
                    .font(.largeTitle)
                    .bold()

                TextField("Osobní číslo", text: $viewModel.personalNr)
                    .iOS {
                        $0.textFieldStyle(LoginTextFieldStyle())
                    }

                SecureField("Pin", text: $viewModel.pin)
                    .iOS {
                        $0.textFieldStyle(LoginTextFieldStyle())
                    }

                Button(action: {
                    viewModel.signIn()
                }, label: {
                    Text("Přihlásit se")
                })
            }
            .padding()
        }
        .macOS {
            $0.frame(width: 500, height: 300)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
