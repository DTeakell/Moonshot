//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Dillon Teakell on 5/19/24.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' - '\(context.debugDescription)'")
        } catch DecodingError.typeMismatch(_, _) {
            fatalError("Failed to decode \(file) from bundle due to incorrect type.")
        } catch DecodingError.valueNotFound(let type, _) {
            fatalError("Failed to decode \(file) due to missing \(type) value.")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) due to corrupt data.")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
