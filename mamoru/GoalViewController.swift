//
//  GoalViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/11.
//

import UIKit

class GoalViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textView.delegate = self
        
        // UserDefaultsから前回保存したテキストを取得して表示する
        let savedText = UserDefaults.standard.string(forKey: "savedText") ?? ""
        textView.text = savedText
    }
    
    // TextViewに何か入力されたら動作します
    func textViewDidChange(_ textView: UITextView) {
        // UserDefaultsにテキストを保存する
        let newText = textView.text ?? ""
        UserDefaults.standard.set(newText, forKey: "savedText")
    }
    
    // saveButtonが押されたら動作します
    @IBAction func saveButtonTapped(_ sender: Any) {
        // UserDefaultsにテキストを保存する
        let newText = textView.text ?? ""
        UserDefaults.standard.set(newText, forKey: "savedText")
        
        // 保存完了のメッセージを表示する
        let alert = UIAlertController(title: "保存完了", message: "テキストが保存されました", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
/*
 
 import UIKit
 
 class GoalViewController: UIViewController, UITextViewDelegate {
 
 var textArray = [String]()
 
 @IBOutlet weak var textView: UITextView!
 
 @IBOutlet weak var saveButton: UIButton!
 
 override func viewDidLoad() {
 super.viewDidLoad()
 // Do any additional setup after loading the view.
 
 textView.delegate = self
 }
 
 // TextViewに何か入力されたら動作します
 
 func textViewDidChange(_ textView: UITextView) {
 if let newText = textView.text {
 textArray.append(newText)
 
 // SceneDelegateが持っている前回の内容を呼び出してTextViewに表示されるようにします。
 if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
 sceneDelegate.lastText = newText
 }
 }
 }
 
 
 }
 */
