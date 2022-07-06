//
//  HomeViewController.swift
//  FeverTime
//
//  Created by Park Jungwoo on 2022/07/05.
//

import UIKit
import Charts
import SnapKit

class HomeViewController: UIViewController {
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "이번주 볼륨량"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private lazy var barChartView: BarChartView = {
        let charView = BarChartView()

        let weeks = ["월", "화", "수", "목", "금", "토", "일"]
        let volume = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0]
        
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<weeks.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: volume[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "라잇웨잇")
        
        chartDataSet.colors = [.systemMint]
        
        let chartData = BarChartData(dataSet: chartDataSet)
        charView.data = chartData
        
        charView.xAxis.labelPosition = .bottom
        charView.xAxis.valueFormatter = IndexAxisValueFormatter(values: weeks)
        charView.rightAxis.enabled = false
        charView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        let todayGoal = ChartLimitLine(limit: 10.0, label: "라잇웨잇")
        charView.leftAxis.addLimitLine(todayGoal)
        
        return charView
    }()
    
    private lazy var lineChartView: LineChartView = {
        let charView = LineChartView()
        charView.backgroundColor = .systemBlue
        
        return charView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupLayout()
    }
}

private extension HomeViewController {
    func setupNavigationController() {
        navigationItem.title = "홈"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLayout() {
        [
            mainLabel,
            barChartView
        ].forEach{view.addSubview($0)}

        let offset: CGFloat = 6.0
        
        mainLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().offset(offset*2)
            $0.trailing.equalToSuperview().inset(offset)
        }
        
        barChartView.snp.makeConstraints{
            $0.top.equalTo(mainLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().inset(offset)
            $0.height.equalTo(200)
        }
    }
}
