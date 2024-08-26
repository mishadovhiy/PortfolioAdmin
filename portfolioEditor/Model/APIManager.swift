//
//  APIManager.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 26.08.2024.
//

import Foundation

struct APIManager {
    func updateContent(content:PortfolioContent, completion:@escaping()->()) {
        let dictionary: [String: Any] = ["key1": "value1", "key2": "value2"]
        let queryItems = dictionary.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        guard let jsonData = try? JSONSerialization.data(withJSONObject: dictionary) else {
            completion()
            print("Failed to serialize JSON")
            return
        }
        var urlComponent:URLComponents? = .init(string: PrivateKeys.editorURL.rawValue + "?content=gg")
        guard let url = urlComponent?.url
        else {
            completion()
            return
        }
     //   urlComponent?.queryItems = queryItems

        var request = URLRequest(url: urlComponent!.url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion()
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Server error")
                completion()
                return
            }
            
            if let data = data,
               let responseString = String(data: data, encoding: .utf8) {
                print("Response: \(responseString)")
                completion()
            } else {
                completion()
            }
        }

        task.resume()
    }
}
