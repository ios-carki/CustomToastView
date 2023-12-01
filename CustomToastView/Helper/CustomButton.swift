//   Created on 2023/12/01
//   Using Swift 5.0
//   CustomButton.swift
//   Created by Owen
  

import SwiftUI

struct CustomButton: View {
    
    
    var title: String
    var backgroundColor: Color
    var clickAction: (() -> ())?
    
    var body: some View {
        Button {
            clickAction?()
        } label: {
            Text(title)
                .foregroundColor(.white)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(backgroundColor)
        .cornerRadius(12)
    }
}

extension CustomButton {
    func click(_ click: (() -> ())?) -> Self {
        var copy = self
        copy.clickAction = click
        return copy
    }
}

#Preview {
    CustomButton(title: "", backgroundColor: .red)
}
