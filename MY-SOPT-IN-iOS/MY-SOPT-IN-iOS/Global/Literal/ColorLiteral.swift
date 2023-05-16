//
//  ColorLiteral.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/16.
//

import UIKit

extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int, a: CGFloat = 1) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}

extension UIColor {
    
    struct Primary {
        static var primary_700: UIColor {
            return UIColor(r: 81, g: 169, b: 106)
        }
        static var primary: UIColor {
            return UIColor(r: 95, g: 202, b: 123)
        }
        static var primary_900: UIColor {
            return UIColor(r: 53, g: 74, b: 53)
        }
    }
    
    struct Semantic {
        static var semantic_green: UIColor {
            return UIColor(r: 111, g: 206, b: 61)
        }
        static var semantic_orange: UIColor {
            return UIColor(r: 241, g: 191, b: 65)
        }
        static var semantic_red: UIColor {
            return UIColor(r: 214, g: 87, b: 70)
        }
    }
    
    struct Tag {
        static var pastel_green: UIColor {
            return UIColor(r: 240, g: 251, b: 224)
        }
        static var pastel_purple: UIColor {
            return UIColor(r: 230, g: 205, b: 251)
        }
        static var pastel_skyblue: UIColor {
            return UIColor(r: 215, g: 243, b: 242)
        }
        static var pastel_blue: UIColor {
            return UIColor(r: 208, g: 220, b: 245)
        }
    }
    
    struct Gray {
        static var gray_50: UIColor {
            return UIColor(r: 245, g: 246, b: 246)
        }
        static var gray_100: UIColor {
            return UIColor(r: 237, g: 239, b: 240)
        }
        static var gray_200: UIColor {
            return UIColor(r: 221, g: 224, b: 228)
        }
        static var gray_400: UIColor {
            return UIColor(r: 204, g: 204, b: 204)
        }
        static var gray_500: UIColor {
            return UIColor(r: 179, g: 182, b: 186)
        }
        static var gray_700: UIColor {
            return UIColor(r: 124, g: 128, b: 132)
        }
        static var gray_800: UIColor {
            return UIColor(r: 100, g: 104, b: 107)
        }
        static var gray_900: UIColor {
            return UIColor(r: 52, g: 55, b: 57)
        }
    }
    
    struct Mono {
        static var white: UIColor {
            return UIColor(r: 255, g: 255, b: 255)
        }
        static var black: UIColor {
            return UIColor(r: 0, g: 0, b: 0)
        }
        static var dimmed_black70: UIColor {
            return UIColor(r: 0, g: 0, b: 0, a: 0.7)
        }
        static var dimmed_black35: UIColor {
            return UIColor(r: 208, g: 220, b: 245, a: 0.35)
        }
    }
}

