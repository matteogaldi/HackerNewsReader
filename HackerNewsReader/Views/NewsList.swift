//
//  NewsList.swift
//  HackerNewsReader
//
//  Created by Matteo Galdi on 07/11/24.
//

import SwiftUI

struct NewsList: View {
    @StateObject private var viewModel = NewsViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.stories) { story in
                NavigationLink(destination: {}) {
                    NewsListItem(story: story)
                }
                
            }
            .listStyle(.inset)
            
            .task {
                viewModel.loadTopStories_Preview()
            }
        }
    }
}

#Preview {
    NewsList()
}
