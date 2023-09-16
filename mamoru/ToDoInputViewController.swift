//
//  ToDoInputViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/13.

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
     
        // 改行ごとにテキストを分割して配列に格納する
        let inputTextLines = inputText.text!.split(whereSeparator: \.isNewline)
        print(inputTextLines)
        //as! [String]//.map { String($0) }
        
        var inputTextArray: [String] = []
        for inputTextLine in inputTextLines {
            let inputText = String(inputTextLine)
            inputTextArray.append(inputText)
        }
        
        // 配列の各要素を箇条書き文字列に変換
        let bulletedText = inputTextLines.map { "• \($0)" }.joined(separator: "\n")
        
        //変換した箇条書き文字列を次の画面に渡すための準備
        let toDoInputVC = storyboard?.instantiateViewController(withIdentifier: "ToDoListNew") as! ToDoListNewViewController
//        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "ToDoListNew") as! ToDoListNewViewController
        toDoInputVC.bulletedText = bulletedText
        toDoInputVC.taskArray = inputTextArray
        
        // 画面遷移
      
//        navigationController?.pushViewController(nextViewController, animated: true)
//        present(nextViewController, animated: true)
        
        
        //navigationControllerを使った場合のコード
        // ToDoInputViewControllerのインスタンスを作成
//        let toDoInputVC = storyboard?.instantiateViewController(withIdentifier: "ToDoListNew") as! ToDoListNewViewController
        // 残日数と残時間を渡す
        toDoInputVC.remainingDaysText = remainingDays.text ?? ""
        toDoInputVC.remainingTimeText = remainingTime.text ?? ""
        // モーダルビューとして表示する（アニメーションはtrueとする）
//        present(toDoInputVC, animated: true, completion: nil)
       navigationController?.pushViewController(toDoInputVC, animated: true)

        
}
//次のページへ遷移
@IBAction func ToDoListEditorButton(_ sender: Any) {
}
}
