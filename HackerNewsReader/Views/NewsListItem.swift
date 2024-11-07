//
//  NewsListItem.swift
//  HackerNewsReader
//
//  Created by Matteo Galdi on 07/11/24.
//

import SwiftUI

struct NewsListItem: View {
    let story: NewsItem
    var body: some View {
        HStack(alignment:.top) {
            
            ZStack {
                Circle()
                    .fill(Color(red: 0.9, green: 0.9, blue: 0.9))
                    .frame(width: 40, height: 40)
                Image(systemName: "person")
                    .foregroundStyle(.gray)
            }
            
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(story.by)
                        .foregroundStyle(.orange)
                        .font(.headline)
                    
                    Text(story.timeAgo)
                        .foregroundStyle(Color(UIColor.lightGray))
                }
                
                Text(story.title)
                    .padding(.top, 1)
                
                                
                HStack(spacing: 20){
                    Button(action: {}){Image(systemName: "heart")}
                    
                    Button(action: {}){
                        HStack {
                            Image(systemName: "message")
                            Text("\(story.score)")
                        }
                    }
                    
                    Button(action: {}){Image(systemName: "paperplane")}
                }
                .foregroundStyle(.black)
                .padding(.top, 10)
                
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NewsListItem(story: NewsItem.dummyData[1]).padding()
}
