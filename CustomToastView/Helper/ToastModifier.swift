//   Created on 2023/12/01
//   Using Swift 5.0
//   ToastModifier.swift
//   Created by Owen
  

import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var toast: CustomToast?
    @State private var workItem: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    mainToastView()
                        .offset(y: -16)
                }.animation(.spring(), value: toast)
            )
            .onChange(of: toast) { value in
                showToast()
            }
    }
    
    @ViewBuilder func mainToastView() -> some View {
        if let toast = toast {
            VStack {
                Spacer()
                CustomToastView(
                    type: toast.type,
                    message: toast.message) {
                        dismissToast()
                    }
                    .padding(.horizontal, 12)
            }
            .transition(.move(edge: .bottom))
        }
    }
        
    private func showToast() {
        guard let toast = toast else { return }
        
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        if toast.duration > 0 {
            workItem?.cancel()
            
            let task = DispatchWorkItem {
               dismissToast()
            }
            
            workItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
        }
    }
        
    private func dismissToast() {
        withAnimation {
            toast = nil
        }
        
        workItem?.cancel()
        workItem = nil
    }
}

extension View {
    func toastView(toast: Binding<CustomToast?>) -> some View {
        self.modifier(ToastModifier(toast: toast))
    }
}
