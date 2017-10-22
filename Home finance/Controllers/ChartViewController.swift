//
//  ChartViewController.swift
//  Home finance
//
//  Created by mac6 on 10/21/17.
//  Copyright © 2017 Богдан Гуцул. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController {

    @IBOutlet var pieChart: PieChartView!
    @IBOutlet weak var transactionType: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chart"
        self.transactionType.tintColor = Defaults.Colors.INCOME_BTN_BG_COLOR
        
        self.setChartData(transactionType: .income)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChartData(transactionType: TransactionType) {
        let transactions = StoreManager.sharedInstance.allTransactions()
        
        let categories = StoreManager.sharedInstance.allCategories()
        var pieChartEntry = [PieChartDataEntry]()
        categories.forEach { (category) in
            var suma = 0
            transactions.forEach({ (transaction) in
                if category.id == transaction.idCategory && transaction.transactionType == transactionType.rawValue {
                    suma += transaction.cost ?? 0
                }
                if transactions.last == transaction && suma > 0 {
                    pieChartEntry.append(PieChartDataEntry(value: Double(suma), label: category.name))
                }
            })
        }

        let pieChartDataSet = PieChartDataSet(values: pieChartEntry, label: "Test")
        pieChartDataSet.drawIconsEnabled = false
        pieChartDataSet.sliceSpace = 2.0
        
        var colors = [NSUIColor]()
        colors.append(contentsOf: ChartColorTemplates.liberty())
        colors.append(contentsOf: ChartColorTemplates.joyful())
        colors.append(contentsOf: ChartColorTemplates.pastel())
        colors.append(contentsOf: ChartColorTemplates.colorful())
        colors.append(contentsOf: ChartColorTemplates.vordiplom())
        colors.append(contentsOf: ChartColorTemplates.material())
        
        pieChartDataSet.colors = colors
        
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        self.pieChart.data = pieChartData
        
    }
    
    @IBAction func segmentValueDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case TransactionType.income.rawValue:
            self.setChartData(transactionType: .income)
        case TransactionType.expense.rawValue:
            self.setChartData(transactionType: .expense)
        default:
            print("")
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
