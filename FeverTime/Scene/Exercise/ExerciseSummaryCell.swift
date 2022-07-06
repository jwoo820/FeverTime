//
//  ExerciseSummaryCell.swift
//  FeverTime
//
//  Created by Park Jungwoo on 2022/07/06.
//

import UIKit

class ExerciseSummaryCell: UITableViewCell {
    private lazy var muscleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16.0, weight: .semibold)
        
        return label
    }()
    
    private lazy var exerciseNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16.0, weight: .semibold)
        
        return label
    }()
    
    private lazy var targetLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16.0, weight: .semibold)
        
        return label
    }()
    
    private lazy var repsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16.0, weight: .semibold)
        
        return label
    }()
    
    private lazy var totalVolumeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16.0, weight: .semibold)
        
        return label
    }()
    
    func setup() {
        setupLayout()
        muscleLabel.text = "어깨"
        exerciseNameLabel.text = "페이스 풀"
        targetLabel.text = "20kg X "
        repsLabel.text = "20회"
        totalVolumeLabel.text = "2000kg"
    }
}

private extension ExerciseSummaryCell {
    func setupLayout() {
        [
            muscleLabel,
            exerciseNameLabel,
            targetLabel,
            repsLabel,
            totalVolumeLabel
        ].forEach{ addSubview($0) }
        
        let offset: CGFloat = 6.0
        
        muscleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(offset)
            $0.leading.equalToSuperview().offset(offset)
        }
        
        exerciseNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(offset)
            $0.leading.equalTo(muscleLabel.snp.trailing).offset(offset)
        }
        
        targetLabel.snp.makeConstraints{
            $0.top.equalTo(muscleLabel.snp.bottom).offset(offset)
            $0.leading.equalToSuperview().offset(offset)
        }
        
        repsLabel.snp.makeConstraints{
            $0.top.equalTo(muscleLabel.snp.bottom).offset(offset)
            $0.leading.equalTo(targetLabel.snp.trailing).offset(offset)
        }
        
        totalVolumeLabel.snp.makeConstraints{
            $0.top.equalTo(muscleLabel.snp.bottom).offset(offset)
            $0.trailing.equalToSuperview().offset(offset)
        }
    }
}
