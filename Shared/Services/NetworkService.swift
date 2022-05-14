//
//  NetworkService.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 13.05.2022.
//

import Foundation
import Alamofire

class NetworkService {

    static let shared = NetworkService()

    static let baseUrl = "https://b2a-backend.dico.dev06.b2a.cz"

    open func prepareHeaders(_ headers: HTTPHeaders?) -> HTTPHeaders {
        var result = headers ?? [:]

        if let userApiKey = UserService.shared.loggedUser?.apiKey {
            result["Authorization"] = "Token token=\"\(userApiKey)\""
        }

        return result
    }

    open func prepareUrl(_ url: URLConvertible) -> URLConvertible {
        var result = url
        if let urlString = url as? String {
            result = "\(Self.baseUrl)\(urlString)"
        }
        return result
    }

    public func makeRequest(_ url: URLConvertible,
                            method: HTTPMethod = .get,
                            encoding: ParameterEncoding = URLEncoding.default,
                            headers: HTTPHeaders? = nil,
                            body: [String: Any]) -> DataRequest {
        guard var urlRequest = try? URLRequest(url: prepareUrl(url).asURL()) else {
            fatalError("Error: Cannot create URLRequest from \(url)")
        }

        for (key, header) in prepareHeaders(headers).dictionary {
            urlRequest.setValue(header, forHTTPHeaderField: key)
        }

        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue

        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)

        return AF.request(urlRequest)
    }

    public func makeRequest(_ url: URLConvertible,
                            method: HTTPMethod = .get,
                            parameters: Parameters? = nil,
                            encoding: ParameterEncoding = URLEncoding.default,
                            headers: HTTPHeaders? = nil) -> DataRequest {
        return AF.request(prepareUrl(url),
                          method: method,
                          parameters: parameters,
                          headers: prepareHeaders(headers))
    }
}
