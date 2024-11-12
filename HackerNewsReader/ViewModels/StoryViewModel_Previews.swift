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
#endif
