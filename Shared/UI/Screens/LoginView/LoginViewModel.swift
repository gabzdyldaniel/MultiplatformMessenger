//
//  LoginViewModel.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation

extension LoginView {
    class ViewModel: ObservableObject {

        @Published var personalNr: String = .empty
        @Published var pin: String = .empty

        @Published var isLoading: Bool = false
        @Published var showingAlert = false

        func signIn() {
            isLoading = true
            NetworkService.shared
                .makeRequest("/auth/api/v1/employee/personal-nr-and-pin",
                             method: .post,
                             body: [
                                "personalNr": personalNr,
                                "pin": pin,
                                "includeMqttClient": true
                             ])
                .validate()
                .responseJSON { response in
                    self.isLoading = false
                    switch response.result {
                    case .success(let json as [String: Any]):
                        guard let data = json["data"] as? [String: Any] else { fallthrough }

                        UserService.shared.loggedUser = LoggedUser(data: data)
                        UserService.shared.saveToDefaults()
                        break
                    default:
                        self.showingAlert = true
                        break
                    }
                }
        }
    }
}
