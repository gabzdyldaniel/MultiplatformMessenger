//
//  LoggedUser.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation

open class LoggedUser: Codable {

    public var userId: Int?
    public var name: String?
    public var surname: String?
    public var email: String?
    public var apiKey: String?
    public var mqttClientUuid: String?
    public var employee: LoggedEmployee?

    open var fullName: String? {
        guard let nameUnwrapped = name, let surnameUnwrapped = surname else { return nil }
        return "\(nameUnwrapped) \(surnameUnwrapped)".trimmed
    }

    public init?(data: [String: Any]?) {
        guard let dataUnwrapped = data else { return nil }
        userId = dataUnwrapped.getValue(key: "id")
        name = dataUnwrapped.getValue(key: "name")
        surname = dataUnwrapped.getValue(key: "surname")
        email = dataUnwrapped.getValue(key: "email")
        apiKey = dataUnwrapped.getValue(key: "apiKey")
        mqttClientUuid = dataUnwrapped.getValue(key: "mqttClientUuid")
        employee = LoggedEmployee(id: nil,
                                  name: name,
                                  surname: surname,
                                  personalNr: dataUnwrapped.getValue(key: "personalNr"))
    }

    public init(user: B2aDicoAuthUserLoggedUser) {
        userId = user.id
        name = user.name
        surname = user.surname
        email = user.email
        apiKey = user.apiKey
        mqttClientUuid = user.mqttClient?.uuid
        switch user {
        case let loggedPerson as B2aDicoAuthPersonLoggedPerson:
            guard let person = loggedPerson.person else { break }
            self.employee = LoggedEmployee(person: person)
        case let loggedEmployee as B2aDicoAuthEmployeeLoggedEmployee:
            guard let employee = loggedEmployee.employee else { break }
            self.employee = LoggedEmployee(employee: employee)
        default:
            break
        }
    }

    var asDicoUser: B2aDicoUserUserUser {
        let user = B2aDicoUserUserUser()
        user.id = userId
        user.name = name
        user.surname = surname
        user.email = email
        return user
    }
}

open class LoggedEmployee: Codable {

    public var id: Int?
    public var name: String?
    public var surname: String?
    public var personalNr: String?

    var asDicoEmployee: B2aDicoHRMEmployee {
        let result = B2aDicoHRMEmployee()
        result.id = id
        result.name = name
        result.surname = surname
        result.personalNr = personalNr
        return result
    }

    public init(id: Int?, name: String?, surname: String?, personalNr: String?) {
        self.id = id
        self.name = name
        self.surname = surname
        self.personalNr = personalNr
    }

    public init(employee: B2aDicoAuthEmployee) {
        id = employee.id
        name = employee.name
        surname = employee.surname
        personalNr = employee.personalNr
    }

    public init(person: B2aDicoAuthPerson) {
        id = person.id
        name = person.name
        surname = person.surname
        personalNr = person.personalNr
    }
}
