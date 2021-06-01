//
//  HttpWebService.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 29/05/21.
//

import Foundation

// MARK: - Http Methods
enum HttpMethod: String {
    case get     = "GET",
         post    = "POST",
         put     = "PUT",
         delete  = "DELETE",
         connect = "CONNECT"

}

// MARK: - Class consume Rest API 
class HttpWebService {
    typealias parameters = [String: Any]
    
    static func consumeService(baseUrl: String,
                               method: HttpMethod = .get,
                               parameters: parameters? = nil,
                               completion: @escaping (HttpStatus) -> Void) {
            
            let header = [Service.headerKey : Service.headerValue]

        
            var request = URLRequest(url: URL(string: baseUrl)!,
                                     timeoutInterval: TimeInterval(Service.timeout))
            request.allHTTPHeaderFields = header
            request.httpMethod = method.rawValue
            
            if let parameters = parameters {
                let parameterData = parameters.reduce(Constant.empty) { (result, param) -> String in
                    return result + "&\(param.key)=\(param.value as! String)"
                }.data(using: .utf8)
                request.httpBody = parameterData
            }
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async {
                    do {
                        if let error = error {
                            print(error)
                            completion(HttpStatus.error(.noNetwork(message: error.localizedDescription)))
                        } else if let data = data, let responseCode = response as? HTTPURLResponse {
                            switch responseCode.statusCode {
                                case 100 ... 102:
                                    completion(HttpStatus.error(.informational(message: responseCode.description)))
                                case 200 ... 226:
                                    if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, Any> {
                                        completion(HttpStatus.success(convertedJsonIntoDict))
                                   }
                                case 300 ... 308:
                                    completion(HttpStatus.error(.redirection(message: responseCode.description)))
                                case 400 ... 451:
                                    completion(HttpStatus.error(.unauthorized(message: responseCode.description ,data)))
                                case 500 ... 511:
                                    completion(HttpStatus.error(.serverError(message: responseCode.description)))
                                default:
                                    completion(HttpStatus.error(.unknownError(message: responseCode.description)))
                                    break
                            }
                        }
                    } catch {
                        
                    }
                }
            }.resume()
        }
        
        static func cancel() {
            URLSession.shared.invalidateAndCancel()
        }
}
