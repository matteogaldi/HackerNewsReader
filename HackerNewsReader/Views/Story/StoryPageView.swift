//
//  StoryView.swift
//  HackerNewsReader
//
//  Created by Matteo Galdi on 08/11/24.
//

import SwiftUI

struct StoryPageView: View {
    let story: Story
    @State private var showingSheet = false
    var body: some View {
        VStack {
            StoryView(story: story, showLabels: true)
            Spacer()
        }
        .padding()
        
    }
}

#Preview {
    StoryPageView(story: Story.dummyData[2])
}
