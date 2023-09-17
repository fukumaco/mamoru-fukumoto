//
//  NewSettingViewController.swift
//  mamoru
//
// NewSettingViewController

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
        
        //let components = calendar.dateComponents([.day, .hour], from: start, to: end)
        let components = calendar.dateComponents([.day], from: start, to: end)
        let componentshour = calendar.dateComponents([.hour], from: start, to: end)
        
        print(components)
        
        let days = components.day ?? 0
        let hours = componentshour.hour ?? 0
        
        remainingDays.text = "\(days) days"
        remainingTime.text = "\(hours) hours"
        // UserDefaultsのインスタンスを作成
        let userDefaults = UserDefaults.standard

        // 締切日を保存する
        userDefaults.set(deadline.date, forKey: "deadline")
        
        // 開始日を保存する
        userDefaults.set(startDate.date, forKey: "startDate")

        // 残日数を保存する
        userDefaults.set(remainingDays.text, forKey: "remainingDays")

        // 残時間を保存する
        userDefaults.set(remainingTime.text, forKey: "remainingTime")

        // UserDefaultsに反映させる
        userDefaults.synchronize()
    }
    @IBAction func ToTodolistButton(_ sender: Any) {
        // ToDoInputViewControllerのインスタンスを作成
        let toDoInputVC = storyboard?.instantiateViewController(withIdentifier: "ToDoInputViewController") as! ToDoInputViewController
        // 残日数と残時間を渡す
        toDoInputVC.remainingDaysText = remainingDays.text ?? ""
        toDoInputVC.remainingTimeText = remainingTime.text ?? ""
        // モーダルビューとして表示する（アニメーションはtrueとする）
//        present(toDoInputVC, animated: true, completion: nil)
        navigationController?.pushViewController(toDoInputVC, animated: true)
    }
    @IBAction func calenderButton(_ sender: Any) {
    }
}
