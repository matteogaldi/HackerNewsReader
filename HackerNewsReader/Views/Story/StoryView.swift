//
//  CommentsView.swift
//  HackerNewsReader
//
//  Created by Matteo Galdi on 10/11/24.
//

import SwiftUI

struct StoryView: View {
    // MARK: - Properties
    let story: Story
    var showLabels: Bool = false
    var nestedStory: Bool = false
    
    // MARK: - View
    var body: some View {
        HStack {
            if (nestedStory) {
                Divider()
                    .frame(maxWidth: 2)
                    .background(.accent)
            }
            VStack { 
                HStack {
                    // User
                    Text(story.by)
                        .font(.headline)
                        .foregroundStyle(.accent)
                    
                    // Time
                    Text(story.timeAgo)
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                }
                
                Text(story.title != "" ? story.title : story.parsedText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if (showLabels) {
                    HStack(spacing: 15) {
                        Label("\(story.score)", systemImage: "hand.thumbsup")
                            .labelStyle(CompactLabelStyle())
                        Label("\(story.descendants ?? 0)", systemImage: "message")
                            .labelStyle(CompactLabelStyle())
                        
                        Spacer()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    .padding(.top, 5)
                }
            }
        }
    }
}


#Preview("Story", traits: .sizeThatFitsLayout) {
    StoryView(story: Story.dummyData[0], showLabels: true)
        .padding()
}

#Preview("Comment", traits: .sizeThatFitsLayout) {
    StoryView(story: Story.dummyData[1], nestedStory: true)
        .padding()
}

