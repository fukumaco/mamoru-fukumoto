//
//  ToDoListViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/13.
//

import UIKit
import GoogleAPIClientForREST_Calendar

class ToDoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mountainGraphics: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    // テーブルに表示するデータの箱
    var todoList = [String]()
    // 追記：インスタンスの生成
    let userDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // 追記：データ読み込み
           if let storedTodoList = userDefaults.array(forKey: "todoList") as? [String] {
               todoList.append(contentsOf: storedTodoList)
           }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addBtnAction(_ sender: Any) {let alertController = UIAlertController(title: "ToDo追加", message: "ToDoを入力してください。", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField(configurationHandler: nil)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (acrion: UIAlertAction) in
            //OKをタップした時の処理
            if let textField = alertController.textFields?.first {
                self.todoList.insert(textField.text!, at: 0)
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.right)
            // 追加したToDoを保存
                self.userDefaults.set(self.todoList, forKey: "todoList")

            }
            
        }
        alertController.addAction(okAction)
        let cancelButton = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
    }
    // ③追加：セルの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    // ④追加：セルの中身を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        let todoTitle = todoList[indexPath.row]
        cell.textLabel?.text = todoTitle
        return cell
    }
    // セルの削除機能
       func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == UITableViewCell.EditingStyle.delete {
               print(todoList)
               todoList.remove(at: indexPath.row)
               tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
               // 削除した内容を保存
               userDefaults.set(todoList, forKey: "todoList")
           }
       }
        
}
/*
import GoogleAPIClientForREST
import GTMSessionFetcher
*/
// ...

// Google Calendar APIの設定
/*
let service = GTLRCalendarService()
service.authorizer = GIDSignIn.sharedInstance().currentUser?.authentication.fetcherAuthorizer()

// イベントの作成
let event = GTLRCalendar_Event()
event.summary = "締切日"
event.start = GTLRCalendar_EventDateTime()
event.start?.dateTime = GTLRDateTime(date: deadline.date)
event.end = GTLRCalendar_EventDateTime()
event.end?.dateTime = GTLRDateTime(date: deadline.date.addingTimeInterval(3600)) // 1時間後の終了日時を設定

// カレンダーIDを指定します（必要に応じて変更してください）
let calendarId = "primary"

//カレンダーへ追加しますといったとこに予定がぜんび入っていますかと確認します
//確認した上で認証情報え　userswfuot に入っているか確認しつつ、入っていたら持ってくる
//カレンダーにイベントを入れる　クエリーのサービスを入れる
// googledpcumentを見て同じ記述であればOK


// イベントをカレンダーに追加
let query = GTLRCalendarQuery_EventsInsert.query(withObject: event, calendarId: calendarId)
service.executeQuery(query) { (ticket, object, error) in
    if let error = error {
        print("エラー: \(error.localizedDescription)")
    } else {
        print("締切日がGoogleカレンダーに追加されました。")
    }
}
このコードは、GoogleカレンダーAPIを使用して、指定された日時に新しいイベント（締切日）をカレンダーに追加します。Googleアカウントにサインインしていることを確認してください。また、必要に応じてカレンダーIDを調整してください。

さらに、GoogleカレンダーAPIを使用するために必要な認証のセットアップやエラーハンドリングを適切に行うことが重要です。 APIキーと認証情報の取得については、Google Calendar APIの公式ドキュメントを参照してください。




*/


