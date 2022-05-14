//
//  LoadingView.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.01)
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .frame(width: 100, height: 100)
                .overlay() {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
        }
        .ignoresSafeArea()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
