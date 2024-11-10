//
//  NewsListItem.swift
//  HackerNewsReader
//
//  Created by Matteo Galdi on 07/11/24.
//

import SwiftUI

struct StoryListItemView: View {
    let story: Story
    var body: some View {
        HStack(alignment:.top) {
            VStack(alignment: .leading) {
                HStack {
                    Text(story.by)
                        .foregroundStyle(.accent)
                        .font(.headline)
                    
                    Text(story.timeAgo)
                        .foregroundStyle(Color(UIColor.lightGray))
                }
                Text(story.title)

                
                                
                HStack(spacing: 15) {
                    Label("\(story.score)", systemImage: "hand.thumbsup")
                        .labelStyle(CompactLabelStyle())
                    Label("\(story.descendants)", systemImage: "message")
                        .labelStyle(CompactLabelStyle())
                }
                .font(.subheadline)
                .foregroundStyle(.black)
                .padding(.top, 5)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}




#Preview(traits: .sizeThatFitsLayout) {
    StoryListItemView(story: Story.dummyData[1]).padding()
}
