//
//  HNNetworkService.swift
//  HackerNewsReader
//
//  Created by Matteo Galdi on 04/11/24.
//

import Foundation

class HNNetworkService {
    static let shared = HNNetworkService()
    
    private init () {}
    
    func fetchTopStories() async throws -> [Int] {
        let url = URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Int].self, from: data)
    }
    
    func fetchItem(id: Int) async throws -> Story {
        let url = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(id).json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Story.self, from: data)
    }
}
