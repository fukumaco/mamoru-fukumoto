//
//  ViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/11.
//

//
//  ViewController.swift
//  MemoApp
//
//  Created by Fukumoto Asako on 2023/08/26.
//


import UIKit

class ViewController: UIViewController , UITextViewDelegate{
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textView.delegate = self
        
        
        // SceneDelegateが持っている前回の内容を呼び出してTextViewに表示されるようにします。
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        textView.text = sceneDelegate.lastText
        
    }
     //TextViewに何か入力されたら動作します
    func textViewDidChange(_ textView: UITextView) {
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
//        textView.text = sceneDelegate.lastText
        sceneDelegate.lastText = textView.text
    
    }
    
    
    //textView.text = ""
    

}

/*
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mamoru: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }


}

*/


