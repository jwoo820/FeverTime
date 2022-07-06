//
//  ExerciseViewController.swift
//  FeverTime
//
//  Created by Park Jungwoo on 2022/07/05.
//

import UIKit
import SnapKit
import Charts

class ExerciseViewController: UIViewController {
    private var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .date
        
        return datePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupLayout()
    }
}

private extension ExerciseViewController {
    func setupNavigationController() {
        navigationItem.title = "운동"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLayout() {
        
        [
            datePicker,
//            barChartView
        ].forEach{
            view.addSubview($0)
        }
        
        let offset: CGFloat = 6.0
        
        datePicker.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().inset(offset)
        }
        
    }
}
