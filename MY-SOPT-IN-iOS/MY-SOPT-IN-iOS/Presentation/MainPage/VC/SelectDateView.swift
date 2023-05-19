//
//  SelectDateView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/18.
//

import UIKit

class SelectDateView: UICollectionView {

    // MARK: - Properties

    // MARK: - View Life Cycle
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setStyle() {
        self.backgroundColor = .Mono.white
    }
    
    func setLayout() {}

    // MARK: - @objc Function


}
