//
//  NewSettingViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/12.
//
import UIKit

class NewSettingViewController: UIViewController {

    //締切日時を入力
    @IBOutlet weak var deadline: UIDatePicker!
    //開始日時を入力
    @IBOutlet weak var startDate: UIDatePicker!

    //平日のみか全日程か
    @IBOutlet weak var workDay: UISegmentedControl!
    //一日あたり何時間働くか
    @IBOutlet weak var hoursOfWorkPerDay: UITextField!

    //残日数を表示
    @IBOutlet weak var remainingDays: UITextField!
    //残時間を表示
     @IBOutlet weak var remainingTime: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //入力後、計算するボタン
    @IBAction func culculate(_ sender: Any) {
        let calendar = Calendar.current

        let start = startDate.date
        let end = deadline.date

        let components = calendar.dateComponents([.day, .hour], from: start, to: end)

        let days = components.day ?? 0
        let hours = components.hour ?? 0

        remainingDays.text = "\(days) days"
        remainingTime.text = "\(hours) hours"
    }
}

/*
import UIKit

class NewSettingViewController: UIViewController {

    
    @IBOutlet weak var deadline: UIDatePicker!
    
    @IBOutlet weak var startDate: UIDatePicker!

    @IBOutlet weak var workDay: UISegmentedControl!
    @IBOutlet weak var hoursOfWorkPerDay: UITextField!
    
    @IBOutlet weak var remainingDays: UITextField!
    
    @IBOutlet weak var remainingTime: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func culculate(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
*/

