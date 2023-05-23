//
//  DatePickerViewController.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/23.
//

import UIKit

import SnapKit

class DatePickerViewController: UIViewController {
    
    // MARK: - UI Components
    
    private var datePickerControl = DatePickerControl()
    private var bottomSheetView = UIView()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("완료", for: .normal)
        button.setTitleColor(UIColor.Gray.gray_900, for: .normal)
        button.titleLabel?.font = .title2Font()
        button.backgroundColor = .Primary.primary
        button.addTarget(self, action: #selector(datePickerDone), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatePickerControl()
    }
    
    func setupDatePickerControl() {
        view.addSubview(bottomSheetView)
        view.backgroundColor = .white
        bottomSheetView.backgroundColor = .white
        
        bottomSheetView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bottomSheetView.addSubviews(datePickerControl, doneButton)
        
        doneButton.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(70)
        }

        datePickerControl.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(doneButton.snp.top)
        }
    }
    
    @objc private func datePickerValueChanged() {
//        let selectedDate = datePicker.date
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy년 MM월"
//        let formattedDate = dateFormatter.string(from: selectedDate)
//        print("Selected Date: \(formattedDate)")
        self.dismiss(animated: false)
    }
    
    @objc private func datePickerDone(_ sender: UIButton) {
        self.dismiss(animated: true)
        print("완료")
    }
}
