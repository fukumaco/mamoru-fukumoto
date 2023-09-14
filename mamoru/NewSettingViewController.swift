//
//  NewSettingViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/12.
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
        
        let components = calendar.dateComponents([.day, .hour], from: start, to: end)
        
        let days = components.day ?? 0
        let hours = components.hour ?? 0
        
        remainingDays.text = "\(days) days"
        remainingTime.text = "\(hours) hours"
    }
    
    @IBAction func ToTodolistButton(_ sender: Any) {
        
        // segueを実行する
        //performSegue(withIdentifier: "showToDoInput", sender: self)
        // ToDoInputViewControllerのインスタンスを作成
        let toDoInputVC = storyboard?.instantiateViewController(withIdentifier: "ToDoInputViewController") as! ToDoInputViewController
        // 残日数と残時間を渡す
        toDoInputVC.remainingDaysText = remainingDays.text ?? ""
        toDoInputVC.remainingTimeText = remainingTime.text ?? ""
        // 遷移する（セグエのIDは"showToDoInput"）
        performSegue(withIdentifier: "showToDoInput", sender: toDoInputVC)
    }
    
}


/*
 //segueが実行される前に呼ばれる関数
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 //segueのIdentifierが"showToDoInput"であれば
 if segue.identifier == "showToDoInput" {
 //遷移先のToDoInputViewControllerを取得する
 let toDoInputVC = segue.destination as! ToDoInputViewController
 //遷移先の残日数と残時間に値を渡す
 toDoInputVC.remainingDays.text = remainingDays.text
 toDoInputVC.remainingTime.text = remainingTime.text
 }
 }
 */



