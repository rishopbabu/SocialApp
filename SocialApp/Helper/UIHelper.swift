//
//  UIHelper.swift
//  SocialApp
//
//  Created by Mac-OBS-51 on 04/10/23.
//

import Foundation
import UIKit


extension UITextField {
    func setPlaceholderTextColor(_ color: UIColor) {
        guard let placeholderText = self.placeholder else { return }
        
        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: color])
        self.attributedPlaceholder = attributedPlaceholder
    }
}
