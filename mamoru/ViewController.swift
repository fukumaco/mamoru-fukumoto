//
//  ViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/11.
//

import UIKit

class ViewController: UIViewController,GIDSignInDelegate {
    
    
    
    @IBOutlet weak var mamoru: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
    }
    
    @IBAction func enterButton(_ sender: Any) {
        performSegue(withIdentifier: "Push", sender: self)}
    
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
            if let authentication = user.authentication {
                let idToken = authentication.idToken // Google ID Tokenを取得
                let accessToken = authentication.accessToken // Google Access Tokenを取得
                // ここでidTokenやaccessTokenを使用してアプリの操作を行います
            }
        } else {
            // エラーが発生した場合の処理
            print("Googleログインエラー: \(error.localizedDescription)")
        }
    }
}



