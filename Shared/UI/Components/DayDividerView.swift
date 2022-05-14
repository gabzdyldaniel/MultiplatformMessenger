//
//  DayDividerView.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import SwiftUI

struct DayDividerView: View {

    var date: String

    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
            HStack {
                Spacer()
                    .frame(height: 1)
                    .background(Color.lightGray)
                    .padding([.leading])

                Text(date)
                    .padding([.leading, .trailing])
                    .padding([.top, .bottom], 5)

                Spacer()
                    .frame(height: 1)
                    .background(Color.lightGray)
                    .padding([.trailing])
            }
        }
    }
}

struct DayDividerView_Previews: PreviewProvider {
    static var previews: some View {
        DayDividerView(date: "2. 5. 1999")
    }
}
