//
//  Codable+Decodable.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 24.08.2024.
//

import Foundation

extension Decodable {
    static func configure(_ from:Data?) -> Self? {
        guard let from else {
            return nil
        }
        do {
            let decoder = PropertyListDecoder()
            let decodedData = try decoder.decode(Self.self, from: from)
            return decodedData
        } catch {
#if DEBUG
            print("error decoding db data ", error)
#endif
            do {
                let decoder = JSONDecoder()
                
                return try decoder.decode(Self.self, from: from)
            } catch {
#if DEBUG
            print("error2 decoding db data ", error)
#endif
                return nil
            }
        }
    }
}

extension Encodable {
    var decode: Data? {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .binary
        do {
            return try encoder.encode(self)
        }
        catch {
#if DEBUG
            print("error encoding db ", error)
#endif
            return nil
        }
    }
    func dictionary() throws -> [String: Any]? {
        let jsonData = try JSONEncoder().encode(self)
        let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
        return jsonObject as? [String: Any]
    }
}

extension [Encodable] {
    func dictionaryArray() throws -> [[String: Any]]? {
        do {
            return try self.compactMap {
                try $0.dictionary()
            }
        } catch {
            print(error, #file, #line)
            return []
        }
    }
}
