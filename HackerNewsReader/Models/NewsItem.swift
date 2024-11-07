//
//  NewsItem.swift
//  HackerNewsReader
//
//  Created by Matteo Galdi on 04/11/24.
//

import Foundation

struct NewsItem: Identifiable, Codable {
    let id: Int
    let title: String
    let url: String? // Optional since not all stories have URLs
    let by: String // Author as referenced by HackerNews API
    let score: Int
    let descendants: Int // Number of comments
    let time: TimeInterval
    
    var timeAgo: String {
        let currentDate = Date()
        let postDate = Date(timeIntervalSince1970: time)
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        
        return formatter.localizedString(for: postDate, relativeTo: currentDate)
    }
}

extension NewsItem {
    static var dummyData: [NewsItem] {
        return [
            NewsItem(
                id: 123456,
                title: "An Interesting Article on AI",
                url: "https://example.com/interesting-article",
                by: "johndoe",
                score: 150,
                descendants: 45,
                time: 1700000000
            ),
            NewsItem(
                id: 123460,
                title: "Ask HN: What are the best resources to learn Python?",
                url: nil,
                by: "techenthusiast",
                score: 100,
                descendants: 30,
                time: 1700000200
            ),
            NewsItem(
                id: 123463,
                title: "Hiring: Full Stack Developer at Startup XYZ",
                url: nil,
                by: "startupxyz",
                score: 0, // Job postings typically don't have scores like stories do
                descendants: 0, // Job postings typically don't have comments
                time: 1700000300
            )
        ]
    }
}
