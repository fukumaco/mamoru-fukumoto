//
//  GoalViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/11.
//
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
