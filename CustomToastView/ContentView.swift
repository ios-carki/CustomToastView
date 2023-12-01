//   Created on 2023/12/01
//   Using Swift 5.0
//   ContentView.swift
//   Created by Owen
  

import SwiftUI

struct ContentView: View {
    @State private var toast: CustomToast?
    
    var body: some View {
        HStack(spacing: 24) {
            CustomButton(title: "성공", backgroundColor: .green)
                .click {
                    toast = CustomToast(type: .success, message: "Wallet name was updated!")
                }
            
            CustomButton(title: "에러", backgroundColor: .red)
                .click {
                    toast = CustomToast(type: .fail, message: "Creation has failed..")
                }
        }
        .padding(.horizontal, 16)
        .toastView(toast: $toast)
    }
}

#Preview {
    ContentView()
}
