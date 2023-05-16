//
//  FontLiteral.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/15.
//

import UIKit

extension UIFont {
    
    static func title1Font() -> UIFont{
        return UIFont(name: "Pretendard-Bold", size: 16)!
    }
    
    static func title2Font() -> UIFont{
        return UIFont(name: "Pretendard-ExtraBold", size: 15)!
    }
    
    static func subtitleFont() -> UIFont{
        return UIFont(name: "Pretendard-Bold", size: 13)!
    }
    
    static func bodyFont() -> UIFont{
        return UIFont(name: "Pretendard-ExtraBold", size: 13)!
    }
    
    static func body2Font() -> UIFont{
        return UIFont(name: "Pretendard-Bold", size: 12)!
    }
    
    static func caption1Font() -> UIFont{
        return UIFont(name: "Pretendard-ExtraBold", size: 11)!
    }
    
    static func caption2Font() -> UIFont{
        return UIFont(name: "Pretendard-Bold", size: 10)!
    }
    
    static func badgeFont() -> UIFont{
        return UIFont(name: "Pretendard-ExtraBold", size: 7)!
    }
    

}

