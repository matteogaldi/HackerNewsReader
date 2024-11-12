//
//  NewsList.swift
//  HackerNewsReader
//
//  Created by Matteo Galdi on 07/11/24.
//

import SwiftUI

struct StoriesList: View {
    @StateObject var viewModel = StoryViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.stories) { story in
                NavigationLink(destination: StoryPageView(story: story)) {
                    StoryView(story: story, showLabels: true)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Top Stories")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.accent, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
//            .refreshable {
//                await viewModel.loadTopStories()
//            }
//            .task {
//                await viewModel.loadTopStories()
//            }
            
        }
        
    }
}

#Preview {
    StoriesList(viewModel: StoryViewModel_Previews.withComments)
}
