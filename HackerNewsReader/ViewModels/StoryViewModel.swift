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
    @Published var comments: [Story] = []
    
    private let cache = NSCache<NSString, NSArray>()
    
    @MainActor
    func loadTopStories() async {
        do {
            isLoading = true
            let topStories = try await HNNetworkService.shared.fetchTopStories()
            let items = try await withThrowingTaskGroup(of: Story.self) { group in
                for id in topStories.prefix(30) {
                    group.addTask {
                        try await HNNetworkService.shared.fetchItem(id: id)
                    }
                }
                var stories: [Story] = []
                for try await story in group {
                    stories.append(story)
                }
                return stories
            }
            stories.append(contentsOf: items)
            isLoading = false
        } catch {
            print("Error loading stories: \(error)")
        }
    }
}

