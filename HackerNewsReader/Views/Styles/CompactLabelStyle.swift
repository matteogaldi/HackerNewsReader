//
//  CustomLabelStyle.swift
//  HackerNewsReader
//
//  Created by Matteo Galdi on 10/11/24.
//

import SwiftUI

struct CompactLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 4) { // Adjust spacing value as needed
            configuration.icon
            configuration.title
        }
    }
}
