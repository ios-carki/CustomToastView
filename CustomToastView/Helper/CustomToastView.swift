//   Created on 2023/12/01
//   Using Swift 5.0
//   CustomToastView.swift
//   Created by Owen
  

import SwiftUI

struct CustomToastView: View {
    
    var type: ToastMessageStyle
    var message: String
    var dismissAction: (() -> ())?
    
    var body: some View {
        ZStack {
            HStack(spacing: 12) {
                Image(systemName: type.iconName)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                
                Text(message)
                    .foregroundColor(.white)
                    .font(.headline)
                    .lineLimit(1)
                    .truncationMode(.middle)
                
                Spacer()
                
                HStack {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.all, 16)
                .onTapGesture {
                    dismissAction?()
                }
                
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 12)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 64)
        .background(type.backgroundColor)
        .cornerRadius(8)
    }
}

#Preview {
    CustomToastView(type: .fail, message: "Wallet name was updated!")
}
