//
//  SelectDateCollectionView.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/22.
//

import UIKit

class SelectDateCollectionView: UICollectionView {

    // MARK: - Properties
    
    private let flowLayout = UICollectionViewFlowLayout()
    private let paddingSize: CGFloat = 10
    private let lineSpacing: CGFloat = 4.5
    private let itemCount: Int = 7
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setStyle() {
        
        self.backgroundColor = .clear
        self.isScrollEnabled = false
        self.collectionViewLayout = flowLayout
        
        flowLayout.do{
            $0.itemSize = CGSize(width: ((UIScreen.main.bounds.width - ((paddingSize * 2) + (lineSpacing * CGFloat(itemCount - 1)))) / CGFloat(itemCount)) , height: 65)
            $0.minimumLineSpacing = lineSpacing
            
            $0.scrollDirection = .horizontal
            $0.headerReferenceSize = CGSize(width: paddingSize, height: 65)
            $0.footerReferenceSize = CGSize(width: paddingSize, height: 65)
        }
    }
}
