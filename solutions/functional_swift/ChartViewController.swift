//
//  ChartViewController.swift
//  functional_swift
//
//  Created by Callum McColl on 25/4/17.
//  Copyright © 2017 Callum McColl. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let phoneData = numberForEachPhone(fromData: data)
        let chartData = self.createChartData(fromData: phoneData, withLabel: "Phone Usage")
        self.barChartView.data = chartData
        self.barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: phoneData.map { $0.0.rawValue })
    }
    
    func createChartData(fromData data: [(Phone, Int)], withLabel label: String) -> BarChartData {
        let dataEntries = data.enumerated().map {
            BarChartDataEntry(x: Double($0.0), y: Double($0.1.1), data: $0.1.0 as AnyObject)
        }
        let set = BarChartDataSet(values: dataEntries, label: label)
        set.colors = ChartColorTemplates.colorful()
        return BarChartData(dataSet: set)
    }


}

