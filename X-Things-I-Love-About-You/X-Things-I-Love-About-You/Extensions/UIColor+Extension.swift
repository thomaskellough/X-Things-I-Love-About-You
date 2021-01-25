//
//  UIColor+Extension.swift
//  X-Things-I-Love-About-You
//
//  Created by Thomas Kellough on 1/24/21.
//

import UIKit

extension UIColor {
    enum App {
        static var Primary: UIColor  {
            let color = UIColor(named: "Primary")
            if color != nil {
                return color!
            } else {
                return UIColor.black
            }
        }
        static var Secondary: UIColor {
            let color = UIColor(named: "Secondary")
            if color != nil {
                return color!
            } else {
                return UIColor.white
            }
        }
    }
}
