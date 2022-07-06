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
    let numberOfCell = 10

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        [datePicker, buttonStackView, exerciseSummaryTableView].forEach{ stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko-KR")
        
        datePicker.layer.borderWidth = 0.3
        datePicker.layer.cornerRadius = 12.0
        
        return datePicker
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10.0
        
        [copyButton, deleteButton].forEach{
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    
    private lazy var copyButton: UIButton = {
        let button = UIButton()
        button.setTitle("복사", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .tertiarySystemGroupedBackground
        button.layer.cornerRadius = 0.7
        
        return button
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("삭제", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        button.setTitleColor(.systemRed, for: .normal)
        button.backgroundColor = .tertiarySystemGroupedBackground
        button.layer.cornerRadius = 0.7
        
        return button
    }()
    
    private lazy var exerciseSummaryTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ExerciseSummaryCell.self, forCellReuseIdentifier: "ExerciseSummaryCell")
        tableView.rowHeight = 50
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupLayout()
    }
}

extension ExerciseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseSummaryCell", for: indexPath) as? ExerciseSummaryCell
        cell?.setup()
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfCell
    }
    
    
}

extension ExerciseViewController: UITableViewDelegate {
    
}

private extension ExerciseViewController {
    func setupNavigationController() {
        navigationItem.title = "운동"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLayout() {
        
        view.addSubview(scrollView)
    
        let offset: CGFloat = 6.0
        
        scrollView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        datePicker.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().inset(offset)
        }
        
        buttonStackView.snp.makeConstraints{
            $0.top.equalTo(datePicker.snp.bottom).offset(offset*2)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().inset(offset)
        }
        exerciseSummaryTableView.snp.makeConstraints{
            $0.top.equalTo(buttonStackView.snp.bottom).offset(offset*3)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().inset(offset)
            $0.bottom.equalToSuperview()

        }
        
    }
}
