//
//  StoryView.swift
//  HackerNewsReader
//
//  Created by Matteo Galdi on 08/11/24.
//

import SwiftUI

struct StoryPageView: View {
    let story: Story
    @StateObject var viewModel = StoryViewModel()
    @State private var showingSheet = false
    var body: some View {
        VStack {
            StoryView(story: story, showLabels: true)
            Spacer()
            List(viewModel.comments) { comment in
                StoryView(story: comment)
            }
            .listStyle(.plain)
        }
        .padding()
        
    }
}

#Preview {
    StoryPageView(story: Story.dummyData[2], viewModel: StoryViewModel_Previews.withComments)
}
