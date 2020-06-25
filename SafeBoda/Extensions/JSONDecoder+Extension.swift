//
//  JSONDecoder+Extension.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import Foundation

extension JSONDecoder {
    
    /**
     To remove the step of first converting to Data before calling JSONDecoder.decode() everywhere
     */
    func decodeString<T: Decodable>(_ type: T.Type, from source: String) -> T? {
        do {
            if let data = source.data(using: .utf8) {
                return try decode(type, from: data)
            }
            return nil
        }
        catch {
            print(error)
            return nil
        }
    }
    
    /**
     To remove the step of first converting to Data before calling JSONDecoder.decode() everywhere
     */
    func decodeDictionary<T: Decodable>(_ type: T.Type, from dictionary: Dictionary<String, Any?>) -> T? {
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions.prettyPrinted)
            return try decode(type, from: data)
        }
        catch {
            print(error)
            return nil
        }
    }
    
    /**
     To remove the step of first converting to Data before calling JSONDecoder.decode() everywhere
     */
    func decodeDictionaryArray<T>(_ type: T.Type, from source: [Dictionary<String, Any?>]) -> T? where T : Decodable {
        do {
            let data = try JSONSerialization.data(withJSONObject: source, options: JSONSerialization.WritingOptions.prettyPrinted)
            return try decode(type, from: data)
        }
        catch {
            print(error)
            return nil
        }
    }
}
