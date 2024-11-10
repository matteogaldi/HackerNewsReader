//
//  NewsList.swift
//  HackerNewsReader
//
//  Created by Matteo Galdi on 07/11/24.
//

import SwiftUI

struct StoriesList: View {
    @StateObject private var viewModel = StoryViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.stories) { story in
                NavigationLink(destination: StoryPageView(story: story)) {
                    StoryView(story: story, showLabels: true)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Hacker News")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.accent, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .task {
                await viewModel.loadTopStories_Preview()
            }
            
        }
        
    }
}

#Preview {
    StoriesList()
}
