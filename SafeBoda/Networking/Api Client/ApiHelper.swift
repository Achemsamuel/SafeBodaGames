//
//  ApiHelper.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import Foundation


/*------------------------
 Mark: Networking Methods
 ------------------------*/
class ApiClient: NSObject {
    let decoder = JSONDecoder()
    let defaultSession: URLSession
    
    override init() {
           let config = URLSessionConfiguration.default
           config.timeoutIntervalForRequest = 30
           // use saved cache data if exist, else call the web API to retrieve
           config.requestCachePolicy = NSURLRequest.CachePolicy.returnCacheDataElseLoad
           defaultSession = URLSession(configuration: config)
       }
    
    /*------------------------
      Get
     ------------------------*/

    func searchCards(query: String, params: [String:Any], completion: @escaping ((Result<CardListObject, Error>)-> Void)) {
        let urlSuffix = query.replacingOccurrences(of: " ", with: "+")
        get(urlSuffix: urlSuffix, params: params, type: CardListObject.self, completion: completion)
    }
    
    
    
    func get(urlSuffix: String, params: [String:Any], completion: @escaping (Result<Data, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: HTTPEndPointResources.searchCards+urlSuffix) else {
            completion(.failure(AppError.badUrl))
            return
        }
        //add params to the url
        urlComponents.queryItems = params.map { (arg) -> URLQueryItem in
            let (key, value) = arg
            return URLQueryItem(name: key, value: "\(value)")
        }
        /*
         Most web services need + character percent escaped (because they'll interpret that as a space character as
         dictated by the application/x-www-form-urlencoded specification). But URLComponents will not percent
         escape it. Apple contends that + is a valid character in a query and therefore shouldn't be escaped.
         Technically, they are correct, that it is allowed in a query of a URI, but it has a special meaning in
         application/x-www-form-urlencoded requests and really should not be passed unescaped.
         
         Apple acknowledges that we have to percent escaping the + characters, but advises that we do it manually:
         */
        //urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery?.replacingOccurrences(of: "+", with: "+")
        
        guard let url = urlComponents.url else {
            completion(.failure(AppError.badUrl))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        let task = defaultSession.dataTask(with: urlRequest) { data, response, error in
            
            
            guard error == nil else {
                print ("error: \(error!)")
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
                return
            }
            guard let content = data else {
                print("get(): No data")
                DispatchQueue.main.async {
                    completion(.failure(error ?? AppError.emptyResponseData))
                }
                return
            }
            print("Apiclient \(url) \n\(String(data: content, encoding: .utf8))")
            DispatchQueue.main.async {
                completion(.success(content))
            }
            
        }
        task.resume()
    }
    
    private func get<T: Decodable>(urlSuffix: String, params: [String:Any], type: T.Type, completion: @escaping (Result<T, Error>) ->Void) {
            get(urlSuffix: urlSuffix, params: params){
                [weak self] result in
                self?.handleResponse(result: result, completion: completion)
            }
        }
    
    private func handleResponse<T: Decodable>(result: Result<Data, Error>, completion: ((Result<T, Error>) -> Void)? = nil) {
        
        
        switch result {
        case .success(let data):
            print("ApiClient \(String(data: data, encoding: .utf8))")
            do {
                guard let rawDict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],
                    let response = JSONDecoder().decodeDictionary(ApiResponse<T>.self, from: rawDict) else {
                        completion?(.failure(AppError.unDecodableResponse))
                        return
                }
                
                guard response.status == true else {
                    print("ApiClient message: \(response.details ?? "No excuse for failure")")
                    completion?(.failure(AppError.endpointError(message: response.details ?? "An error occured")))
                    return
                }
                guard let data = response.data else {
                    completion?(.failure(AppError.unDecodableResponse))
                    return
                }
                
                completion?(.success(data))
            }
            catch {
                print(error)
                print("ApiClient handleResponse() catch: \(String(data: data, encoding: .utf8) ?? "nil")")
                completion?(.failure(AppError.unDecodableResponse))
            }
        case .failure(let error):
            print("ApiClient error: \(error)")
            completion?(.failure(error))
        }
    }
}
