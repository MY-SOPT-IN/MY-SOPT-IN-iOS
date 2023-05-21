//
//  MainPageRoutineBorderView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/21.
//

import UIKit

class MainPageRoutineBorderView: UIView {
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        print(self.frame.minY)
        let path = UIBezierPath(rect: CGRect(x: 1.5, y: 1.5, width: self.frame.width - 3, height: self.frame.height - 3))
        UIColor.Primary.primary.setStroke()
        path.lineWidth = 3
        path.stroke()
    }
}
