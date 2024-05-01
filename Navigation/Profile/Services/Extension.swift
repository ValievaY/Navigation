//
//  Extension.swift
//  Navigation
//
//  Created by Apple Mac Air on 09.04.2024.
//

import UIKit

extension UIColor {
    static func createColor(lightMode: UIColor, darkMode: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else {
            return lightMode
        }
        return UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? darkMode : lightMode
        }
    }
}
