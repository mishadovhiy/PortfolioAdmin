//
//  APIManager.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 26.08.2024.
//

import Foundation

struct APIManager {
    func loadContent(completion:@escaping(_ content:PortfolioContent?)->()) {
        guard let url:URL = .init(string: PrivateKeys.contentURL.rawValue) else {
            completion(nil)
            return
        }
        var request = URLRequest(url: url)
      //  let task = URLSession.shared.
    }
    
    func updateContent(content:PortfolioContent, completion:@escaping()->()) {
        do {
            guard let dictionary: [String: Any] = try content.dictionary() else {
                completion()
                return
            }
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
                
            guard let jsonString = String(data: jsonData, encoding: .utf8)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)?.replacingOccurrences(of: "&", with: "_q_") else {
                    completion()
                    return
                }
            guard let url:URL = .init(string: PrivateKeys.editorURL.rawValue + "?content=" + jsonString)
            else {
                completion()
                return
            }

            var request = URLRequest(url: url)
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
        } catch {
            print(error)
            completion()
        }
    }
}
