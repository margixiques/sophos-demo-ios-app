//
//  UIApplication+Extension.swift
//  AppSophos
//
//  Created by Margarita Xiques on 14/12/22.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
