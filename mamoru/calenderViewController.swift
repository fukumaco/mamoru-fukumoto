//
//  calenderViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/13.
//
// GoogleSignInのライブラリをインポート

import GoogleSignIn
import UIKit

// Google Calendar APIのURL
let calendarURL = "https://www.googleapis.com/calendar/v3"

// ToDoリストとそれを実施する日のデータ
// ここでは仮のデータを作成していますが、実際にはユーザーから入力されたり、ローカルに保存したりするものとします
let todoList = [
    ["title": "買い物", "date": "2023-09-15"],
    ["title": "掃除", "date": "2023-09-16"],
    ["title": "勉強", "date": "2023-09-17"]
]
class calenderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        /*
         // Googleログインボタンがタップされた時の処理
         @IBAction func googleLoginButtonTapped(_ sender: Any) {
         // Googleログイン画面を表示
         GIDSignIn.sharedInstance().presentingViewController = self
         GIDSignIn.sharedInstance().delegate = self
         GIDSignIn.sharedInstance().scopes = ["https://www.googleapis.com/auth/calendar"]
         GIDSignIn.sharedInstance().signIn()
         }
         
         // Googleログインが完了した時の処理
         func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
         if let error = error {
         // エラーがあれば表示
         print(error.localizedDescription)
         return
         }
         
         // ログインしたユーザーの情報を取得
         let userId = user.userID
         let idToken = user.authentication.idToken
         let fullName = user.profile.name
         let email = user.profile.email
         
         // ToDoリストをGoogleカレンダーに追加する関数を呼ぶ
         self.addTodoListToCalendar(todoList: todoList, accessToken: user.authentication.accessToken)
         }
         
         */
        
        // ToDoリストをGoogleカレンダーに追加する関数
        func addTodoListToCalendar(todoList: [[String: String]], accessToken: String) {
            // ToDoリストの要素ごとにループ
            for todo in todoList {
                // イベントのタイトルと日付を取得
                let title = todo["title"] ?? ""
                let date = todo["date"] ?? ""
                
                // イベントのデータを作成
                let eventData: [String: Any] = [
                    "summary": title,
                    "start": [
                        "date": date
                    ],
                    "end": [
                        "date": date
                    ]
                ]
                
                // イベントのデータをJSONに変換
                guard let httpBody = try? JSONSerialization.data(withJSONObject: eventData, options: []) else {
                    return
                }
                
                // Google Calendar APIのリクエストURLを作成
                guard let url = URL(string: "\(calendarURL)/calendars/primary/events") else {
                    return
                }
                
                // リクエストを作成
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.httpBody = httpBody
                request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                
                // リクエストを送信
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let error = error {
                        // エラーがあれば表示
                        print(error.localizedDescription)
                        return
                    }
                    
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                        // レスポンスのデータを表示
                        print(dataString)
                    }
                }
                
                task.resume()
            }
        }
    }
    /*
     import UIKit
     
     class calenderViewController: UIViewController {
     
     override func viewDidLoad() {
     super.viewDidLoad()
     
     // Do any additional setup after loading the view.
     }
     
     
     /*
      // MARK: - Navigation
      
      // In a storyboard-based application, you will often want to do a little preparation before navigation
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destination.
      // Pass the selected object to the new view controller.
      }
      */
     
     }
     */
    
}
