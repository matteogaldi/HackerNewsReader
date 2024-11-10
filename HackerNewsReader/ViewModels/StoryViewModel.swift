//
//  NewsViewModel.swift
//  HackerNewsReader
//
//  Created by Matteo Galdi on 04/11/24.
//
import Foundation

class StoryViewModel: ObservableObject {
    @Published var stories: [Story] = []
    @Published var isLoading: Bool = false
    
    private let cache = NSCache<NSString, NSArray>()
    
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
    
    func loadTopStories_Preview() async {
        stories = Story.dummyData
    }
}

