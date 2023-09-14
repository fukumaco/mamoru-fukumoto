//
//  ToDoInputViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/13.
//
import UIKit

class ToDoInputViewController: UIViewController {
    // 残日数と残時間を受け取るプロパティ（String型）
    var remainingDaysText = ""
    var remainingTimeText = ""
    
    @IBOutlet weak var remainingDays: UITextField!//残日を表示
    @IBOutlet weak var remainingTime: UITextField!     //残時間を表示
    @IBOutlet weak var inputText: UITextView!  //テキスト入力
    
    override func viewDidLoad() {
        super.viewDidLoad()

    // Do any additional setup after loading the view.
        //残日数と残時間を表示する
            remainingDays.text = remainingDays.text
            remainingTime.text = remainingTime.text
        
    }
        //入力を保存する
    @IBAction func saveButton(_ sender: Any) {
        // UserDefaultsのインスタンスを作成
        let userDefaults = UserDefaults.standard
        // 入力したテキストをキーと値のペアで保存する（キーは"inputText"と仮定）
        userDefaults.set(inputText.text, forKey: "inputText")
        // UserDefaultsに反映させる
        userDefaults.synchronize()
    }
    //次のページへ遷移
    @IBAction func ToDoListEditorButton(_ sender: Any) {
    }
}

/*
 // ToDoInputViewController
 import UIKit

 class ToDoInputViewController: UIViewController {
     // 残日数と残時間を受け取るプロパティ（String型）
     var remainingDaysText = ""
     var remainingTimeText = ""
     
     // 残日数と残時間を表示するテキストフィールド
     @IBOutlet weak var remainingDays: UITextField!
     @IBOutlet weak var remainingTime: UITextField!
     
     // テキスト入力するテキストビュー
     @IBOutlet weak var inputText: UITextView!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         // テキストフィールドに残日数と残時間を表示する
         remainingDays.text = remainingDaysText
         remainingTime.text = remainingTimeText
     }
     
     // 入力を保存するボタンが押された時の処理
     @IBAction func saveButton(_ sender: Any) {
         // UserDefaultsのインスタンスを作成
         let userDefaults = UserDefaults.standard
         // 入力したテキストをキーと値のペアで保存する（キーは"inputText"と仮定）
         userDefaults.set(inputText.text, forKey: "inputText")
         // UserDefaultsに反映させる
         userDefaults.synchronize()
     }
     
     // 次のページへ遷移するボタンが押された時の処理（省略）
 }
 */
