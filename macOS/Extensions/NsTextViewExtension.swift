//
//  NsTextViewExtension.swift
//  MultiplatformMessenger (macOS)
//
//  Created by Daniel Gabzdyl on 17.05.2022.
//

import SwiftUI

extension NSTextView {
  open override var frame: CGRect {
    didSet {
      backgroundColor = .clear
      drawsBackground = true
    }
  }
}
