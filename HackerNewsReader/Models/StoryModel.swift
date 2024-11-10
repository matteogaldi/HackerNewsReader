//
//  NewsItem.swift
//  HackerNewsReader
//
//  Created by Matteo Galdi on 04/11/24.
//

import Foundation
import SwiftSoup

struct Story: Identifiable, Codable {
    let id: Int
    let title: String
    let url: String? // Optional since not all stories have URLs
    let by: String // Author as referenced by HackerNews API
    let score: Int
    let descendants: Int // Number of comments
    let time: TimeInterval
    let text: String?
    
    var timeAgo: String {
        let currentDate = Date()
        let postDate = Date(timeIntervalSince1970: time)
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        
        return formatter.localizedString(for: postDate, relativeTo: currentDate)
    }
    
    var storyURL: URL {
        URL(string: url ?? "https://news.ycombinator.com/item?id=\(id)")!
    }
    
    var parsedText: String {
        do {
            let doc: Document = try SwiftSoup.parse(text ?? "")
            return try doc.text()
        } catch {
            return ""
        }
    }
}

extension Story {
    static var dummyData: [Story] {
        return [
            Story(
                id: 123456,
                title: "An Interesting Article on AI",
                url: "https://example.com/interesting-article",
                by: "johndoe",
                score: 150,
                descendants: 45,
                time: 1700000000,
                text: nil
            ),
            Story(
                id: 123460,
                title: "Ask HN: What are the best resources to learn Python?",
                url: nil,
                by: "techenthusiast",
                score: 100,
                descendants: 30,
                time: 1700000200,
                text: "Aw shucks, guys ... you make me blush with your compliments.<p>Tell you what, Ill make a deal: I'll keep writing if you keep reading. K?"
            ),
            Story(
                id: 123463,
                title: "Hiring: Full Stack Developer at Startup XYZ",
                url: nil,
                by: "startupxyz",
                score: 0, // Job postings typically don't have scores like stories do
                descendants: 0, // Job postings typically don't have comments
                time: 1700000300,
                text: "Aw shucks, guys ... you make me blush with your compliments.<p>Tell you what, Ill make a deal: I'll keep writing if you keep reading. K?"
            )
        ]
    }
}
