//
//  DatePickerControl.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/23.
//

import UIKit

import SnapKit

final class DatePickerControl: UIControl {
    
    // MARK: - Properties
    
    private var months: [Int] = []
    
    // MARK: - UIComponents
    
    private lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    private var date = Date()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setLayout()
    }
    
    // MARK: - Methods
    
    func setLayout() {
        backgroundColor = .white
        
        addSubview(picker)
        picker.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(300)
        }
        picker.dataSource = self
        picker.delegate = self
        
        setCurrentMonth()
    }
    
    
    func setCurrentMonth() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M"
        let currentMonth = Int(dateFormatter.string(from: Date())) ?? 0
        
        for month in 1...currentMonth {
            months.append(month)
        }
        
        if let currentMonth = months.last {
            picker.selectRow(currentMonth - 1, inComponent: 0, animated: true)
        }
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate

extension DatePickerControl : UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return months.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("23년도", months[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 51
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let month = months[row]
            let title = "23년 \(month)월"
            let attributes: [NSAttributedString.Key: Any] = [
        
                .font: UIFont.title2Font(),
                .foregroundColor: UIColor.Gray.gray_900.cgColor
            ]
            return NSAttributedString(string: title, attributes: attributes)
    }
}
