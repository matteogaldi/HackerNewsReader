//
//  StoryViewModel_Previews.swift
//  HackerNewsReader
//
//  Created by Assistant on 12/11/24.
//

import Foundation

#if DEBUG
class StoryViewModel_Previews {
    static let loading: StoryViewModel = {
        let vm = StoryViewModel()
        vm.isLoading = true
        vm.stories = []
        return vm
    }()
    
    static let populated: StoryViewModel = {
        let vm = StoryViewModel()
        vm.isLoading = false
        vm.stories = Story.dummyData
        return vm
    }()
    
    static let error: StoryViewModel = {
        let vm = StoryViewModel()
        vm.isLoading = false
        vm.stories = []
        return vm
    }()
    
    static let empty: StoryViewModel = {
        let vm = StoryViewModel()
        vm.isLoading = false
        vm.stories = []
        return vm
    }()
    
    static let withComments: StoryViewModel = {
        let vm = StoryViewModel()
        vm.isLoading = false
        vm.stories = Story.dummyData
        vm.comments = Story.dummyComments
        return vm
    }()
}
<<<<<<< HEAD

// Example usage in SwiftUI previews:
/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(viewModel: StoryViewModel_Previews.loading)
                .previewDisplayName("Loading State")
            
            ContentView(viewModel: StoryViewModel_Previews.populated)
                .previewDisplayName("Populated State")
            
            ContentView(viewModel: StoryViewModel_Previews.error)
                .previewDisplayName("Error State")
            
            ContentView(viewModel: StoryViewModel_Previews.empty)
                .previewDisplayName("Empty State")
            
            ContentView(viewModel: StoryViewModel_Previews.withComments)
                .previewDisplayName("With Comments")
        }
    }
}
*/
=======
>>>>>>> 9457f8b (* Adds preview)
#endif
