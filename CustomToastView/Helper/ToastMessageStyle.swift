//   Created on 2023/12/01
//   Using Swift 5.0
//   ToastMessageStyle.swift
//   Created by Owen
  

import SwiftUI

enum ToastMessageStyle {
    case success
    case fail
}

extension ToastMessageStyle {
    var backgroundColor: Color {
        switch self {
        case .success:
            return Color.green
        case .fail:
            return Color.red
        }
    }
    
    var iconName: String {
        switch self {
        case .success:
            return "checkmark.circle.fill"
        case .fail:
            return "xmark.circle.fill"
        }
    }
}
