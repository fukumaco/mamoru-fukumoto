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

                //残日数と残時間を表示する
                // プロパティの値をテキストフィールドに代入する
                remainingDays.text = remainingDaysText
                remainingTime.text = remainingTimeText
        
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
