//
//  ViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/11.
//

import UIKit
import GoogleSignIn
//import GoogleSignIn

class ViewController: UIViewController {
    //class ViewController: UIViewController, GIDSignInDelegate
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        GIDSignIn.sharedInstance.delegate = self
    }
    @IBAction func enterButton(_ sender: Any) {
        
        performSegue(withIdentifier: "Push", sender: self)}
    //  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //pushの時に値を次の　次のテキストフィールドの変数を渡す
    //  }
    
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
      
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { result, error in
            guard error == nil else {
                return
            }
            
            guard let user = result?.user            else { return }
            //print(user.accessToken)
            //AUTHORISERを保存して　userdefault に保存しておく
            self.performSegue(withIdentifier: "Push", sender: self)
        }
    }
}
