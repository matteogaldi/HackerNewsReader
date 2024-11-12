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
    let descendants: Int? // Number of comments
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

extension Story {
    static var dummyComments: [Story] {
        return [
            Story(
                id: 234567,
                title: "", // Comments don't have titles
                url: nil,  // Comments don't have URLs
                by: "commentUser1",
                score: 45,
                descendants: 2, // Number of child comments
                time: Date().timeIntervalSince1970 - 3600, // 1 hour ago
                text: "This is a really interesting point. I've worked with similar systems before and found that the approach mentioned in the article has some limitations. <p>For example, when dealing with large scale deployments, you need to consider factors like load balancing and failover strategies."
            ),
            Story(
                id: 234568,
                title: "",
                url: nil,
                by: "techexpert",
                score: 23,
                descendants: 0,
                time: Date().timeIntervalSince1970 - 7200, // 2 hours ago
                text: "I disagree with the main premise. While the implementation is clever, it doesn't address the fundamental issues with this approach. <p>Here's why:<p>1. Performance implications in high-load scenarios<p>2. Maintenance overhead<p>3. Scaling limitations"
            ),
            Story(
                id: 234569,
                title: "",
                url: nil,
                by: "developer123",
                score: 12,
                descendants: 1,
                time: Date().timeIntervalSince1970 - 1800, // 30 minutes ago
                text: "Thanks for sharing this! I've implemented something similar in my project. Here's a useful addition I made:<p>```<p>function optimizeProcess() {<p>  // Additional optimization logic<p>  return enhancedResult;<p>}```"
            ),
            Story(
                id: 234570,
                title: "",
                url: nil,
                by: "newbie",
                score: 5,
                descendants: 0,
                time: Date().timeIntervalSince1970 - 900, // 15 minutes ago
                text: "Could someone explain how this would work in a microservices architecture? I'm particularly interested in how the data consistency is maintained across services."
            ),
            Story(
                id: 234571,
                title: "",
                url: nil,
                by: "seniordev",
                score: 34,
                descendants: 3,
                time: Date().timeIntervalSince1970 - 5400, // 1.5 hours ago
                text: "Great write-up! A few additional considerations:<p>1. Security implications - especially regarding the authentication flow<p>2. Error handling strategies<p>3. Monitoring and observability<p>I've written a detailed blog post about this at example.com/blog-post"
            )
        ]
    }
}
