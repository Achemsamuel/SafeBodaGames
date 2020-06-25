//
//  ApiResponse.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import Foundation

//Model for all endpoints responses, whether success or failure
class ApiResponse<T: Decodable>: Decodable {
    
    var error: String?
    var details: String?
    var status: Bool?
    var data: T?
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.error = try? values.decodeIfPresent(String.self, forKey: CodingKeys.error)
        self.details = try? values.decodeIfPresent(String.self, forKey: CodingKeys.details)
        self.status = try? values.decodeIfPresent(Bool.self, forKey: CodingKeys.status)
        
        do {
            self.data = try values.decodeIfPresent(T.self, forKey: CodingKeys.data)
        }
        catch {
            print(error)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case error, details
        case status = "success"
        case data
    }
}
