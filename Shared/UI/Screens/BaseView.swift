//
//  BaseView.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import SwiftUI

struct BaseView<Content>: View where Content: View {

    var content: Content
    @Binding var isLoading: Bool

    public init(
        isLoading: Binding<Bool>,
        @ViewBuilder content: () -> Content
    ) {
        self._isLoading = isLoading
        self.content = content()
    }

    var body: some View {
        ZStack {
            content
            if isLoading {
                HStack {
                    Spacer()
                    LoadingView()
                    Spacer()
                }
            }
        }
    }
}
