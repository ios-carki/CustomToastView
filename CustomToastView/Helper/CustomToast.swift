//   Created on 2023/12/01
//   Using Swift 5.0
//   CustomToast.swift
//   Created by Owen
  

import Foundation

struct CustomToast: Equatable {
    var type: ToastMessageStyle
    var message: String
    var duration: Double = 2
}
