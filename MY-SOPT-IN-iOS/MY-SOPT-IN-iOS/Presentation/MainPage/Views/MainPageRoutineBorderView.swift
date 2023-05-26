//
//  MainPageRoutineBorderView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/21.
//

import UIKit

class MainPageRoutineBorderView: UIView {
    
    // MARK: - Properties
    
    private let borderLine: CGFloat = 3
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath(rect: CGRect(x: borderLine / 2, y: borderLine / 2,
                                             width: self.frame.width - borderLine,
                                             height: self.frame.height - borderLine))
        UIColor.Primary.primary.setStroke()
        path.lineWidth = borderLine
        path.stroke()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView: UIView? = super.hitTest(point, with: event)
        if (self == hitView) { return nil }
        return hitView
    }
}
