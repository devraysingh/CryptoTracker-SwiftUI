//
//  UIApplication.swift
//  CryptoTracker
//
//  Created by ray on 7/31/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
