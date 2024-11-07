//
//  NewsViewModel.swift
//  HackerNewsReader
//
//  Created by Matteo Galdi on 04/11/24.
//
import Foundation

class NewsViewModel: ObservableObject {
    @Published var stories: [NewsItem] = []
    
    func loadTopStories() async {
        do {
            let ids = try await HNNetworkService.shared.fetchTopStories()
            
            for id in ids.prefix(30) {
                let story = try await HNNetworkService.shared.fetchItem(id: id)
                await MainActor.run {
                    stories.append(story)
                }
            }
        } catch {
            print("Error loading stories: \(error)")
        }
    }
    
    func loadTopStories_Preview() {
        stories = NewsItem.dummyData
    }
}

