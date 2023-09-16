//
//  ViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/11.
//

import UIKit
import GoogleSignIn
//import GoogleSignIn
import GoogleAPIClientForREST_Calendar


class ViewController: UIViewController {
    //class ViewController: UIViewController, GIDSignInDelegate
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        GIDSignIn.sharedInstance.delegate = self
    }
    @IBAction func enterButton(_ sender: Any) {
        
       //performSegue(withIdentifier: "Push", sender: self)}
    //  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //pushの時に値を次の　次のテキストフィールドの変数を渡す
     }
    
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
      
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { result, error in
            guard error == nil else {
                return
            }
            
            guard let user = result?.user         else { return }
            //print(user.accessToken)
            //AUTHORISERを保存して　userdefault に保存しておく
            let authorizer = user.fetcherAuthorizer

            let gidCurrentUser: GIDGoogleUser = user
            UserDefaults.standard.set(gidCurrentUser, forKey: "gidUser")

//            let calendarService = GTLRCalendarService()
//            calendarService.authorizer = gidCurrentUser.authentication.fetcherAuthorizer()
//            calendarService.authorizer = gidCurrentUser.fetcherAuthorizer

            self.performSegue(withIdentifier: "Push", sender: self)
        }
    }
}
