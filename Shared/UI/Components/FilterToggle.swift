//
//  FilterToggle.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import SwiftUI

struct FilterToggle: View {

    @Binding var isOn: Bool
    private var title: String

    init(title: String, isOn: Binding<Bool>) {
        self.title = title
        self._isOn = isOn
    }

    var body: some View {
        Toggle(title, isOn: $isOn)
            .frame(maxWidth: .infinity)
            #if os(macOS)
            .toggleStyle(.checkbox)
            #else
            .toggleStyle(.button)
            #endif
            .tint(Color.primary)
    }
}

struct FilterToggle_Previews: PreviewProvider {

    @State static var isOn = false

    static var previews: some View {
        FilterToggle(title: "Filter", isOn: $isOn)
    }
}
