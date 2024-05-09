//
//  NetworkManager.swift
//  ReadingBooks2
//
//  Created by 강태영 on 5/10/24.
//
import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let session: URLSession
    
    private init() {
        session = URLSession(configuration: .default)
    }
    
    func searchBooks(query: String, completion: @escaping (Result<[Document], Error>) -> Void) {
        let baseURL = "https://dapi.kakao.com/v3/search/book"
        let queryItems = [
            URLQueryItem(name: "query", value: query)
        ]
        
        var urlComponents = URLComponents(string: baseURL)!
        urlComponents.queryItems = queryItems
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("202f3199096ad42f72faaf4e7eac3da2", forHTTPHeaderField: "Authorization")
    }
}
