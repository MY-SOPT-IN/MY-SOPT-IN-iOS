//
//  NSObject+.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/20.
//

import UIKit

extension NSObject {
    
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
}
