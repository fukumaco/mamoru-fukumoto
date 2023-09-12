//
//  SettingViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/12.
//
import Foundation
import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var deadline: UIDatePicker!


    @IBOutlet weak var deadline: UITextField!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var ngDates: UITextField!
    @IBOutlet weak var hoursOfWorkPerDay: UITextField!
    @IBOutlet weak var adjustedRemainingDays: UITextField!
    @IBOutlet weak var totalTimeRequired: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateButton(_ sender: Any) {
        // カレンダーを取得
        let calendar = Calendar.current
        
        // 締切日 (yyyy/MM/dd) のテキストを Date に変換
        if let deadlineText = deadline.text, let deadlineDate = DateFormatter.dateFromCustomString(deadlineText) {
            // 開始日 (yyyy/MM/dd) のテキストを Date に変換
            if let startDateText = startDate.text, let startDate = DateFormatter.dateFromCustomString(startDateText) {
                // NG日 (yyyy/MM/dd) のテキストを複数の日付に変換
                if let ngDatesText = ngDates.text {
                    let ngDateStrings = ngDatesText.components(separatedBy: ",")
                    var ngDates = [Date]()
                    
                    for ngDateString in ngDateStrings {
                        if let ngDate = DateFormatter.dateFromCustomString(ngDateString) {
                            ngDates.append(ngDate)
                        }
                    }
                    
                    // 一日の作業時間 (hours) を取得
                    if let hoursOfWorkPerDayText = hoursOfWorkPerDay.text, let hours = Double(hoursOfWorkPerDayText) {
                        // 現在の日付を取得
                        let currentDate = Date()
                        
                        // 残りの日数を計算
                        let remainingDays = calendar.dateComponents([.day], from: currentDate, to: deadlineDate).day ?? 0
                        
                        // NG日を除外
                        var adjustedDeadlineDate = deadlineDate
                        for ngDate in ngDates {
                            if ngDate <= adjustedDeadlineDate {
                                adjustedDeadlineDate = calendar.date(byAdding: .day, value: -1, to: adjustedDeadlineDate)!
                            }
                        }
                        
                        // NG日を過ぎていたら、開始日を更新
                        let effectiveStartDate = currentDate > adjustedDeadlineDate ? currentDate : startDate
                        
                        // 平日のみを考慮して残りの日数を再計算
                        var adjustedRemainingDays = 0
                        var currentDateToCheck = effectiveStartDate
                        
                        while currentDateToCheck <= adjustedDeadlineDate {
                            let dayOfWeek = calendar.component(.weekday, from: currentDateToCheck)
                            if dayOfWeek != 1 && dayOfWeek != 7 { // 日曜日または土曜日でない場合
                                adjustedRemainingDays += 1
                            }
                            currentDateToCheck = calendar.date(byAdding: .day, value: 1, to: currentDateToCheck)!
                        }
                        
                        // 締切までの作業時間を計算
                        let totalTimeRequired = Double(adjustedRemainingDays) * hours
                        
                        // 計算結果をテキストフィールドに表示
                        self.adjustedRemainingDays.text = "\(adjustedRemainingDays)日"
                        self.totalTimeRequired.text = "\(totalTimeRequired)時間"
                    }
                }
            }
        }
    }
}

extension DateFormatter {
    static func dateFromCustomString(_ dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.date(from: dateString)
    }
}

/*import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var deadline: UITextField!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var ngDate: UITextField!
    @IBOutlet weak var hoursOfWorkPerDay: UITextField!
    @IBOutlet weak var adjustedRemainingDays: UITextField!
    @IBOutlet weak var totalTimeRequired: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        // カレンダーを取得
        let calendar = Calendar.current
        
        // 締切日 (yyyy/MM/dd) のテキストを Date に変換
        if let deadlineText = deadline.text, let deadlineDate = DateFormatter.dateFromCustomString(deadlineText) {
            // 開始日 (yyyy/MM/dd) のテキストを Date に変換
            if let startDateText = startDate.text, let startDate = DateFormatter.dateFromCustomString(startDateText) {
                // NG日 (yyyy/MM/dd) のテキストを Date に変換
                if let ngDateText = ngDate.text, let ngDate = DateFormatter.dateFromCustomString(ngDateText) {
                    // 一日の作業時間 (hours) を取得
                    if let hoursOfWorkPerDayText = hoursOfWorkPerDay.text, let hours = Double(hoursOfWorkPerDayText) {


                        // 現在の日付を取得
                        let currentDate = Date()
                        
                        // 残りの日数を計算
                        let remainingDays = calendar.dateComponents([.day], from: currentDate, to: deadlineDate).day ?? 0
                        
                        // NG日を引く
                        let adjustedDeadlineDate = calendar.date(byAdding: .day, value: -1, to: deadlineDate) // NG日は締切日から除外
                        
                        // NG日を過ぎていたら、開始日を更新
                        let effectiveStartDate = currentDate > ngDate ? currentDate : startDate
                        
                        // 残りの日数を再計算
                        let adjustedRemainingDays = calendar.dateComponents([.day], from: effectiveStartDate, to: adjustedDeadlineDate!).day ?? 0
                        
                        // 締切までの作業時間を計算
                        let totalTimeRequired = Double(adjustedRemainingDays) * hours
                        
                        // 計算結果をテキストフィールドに表示
                        self.adjustedRemainingDays.text = "\(adjustedRemainingDays)日"
                        self.totalTimeRequired.text = "\(totalTimeRequired)時間"
                    }
                }
            }
        }
    }
}

extension DateFormatter {
    static func dateFromCustomString(_ dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.date(from: dateString)
    }
}
 */
/*
 import UIKit
 
 class SettingViewController: UIViewController {
 
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 // Do any additional setup after loading the view.
 }
 */

