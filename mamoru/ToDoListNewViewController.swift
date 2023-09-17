//  ToDoListNewViewController.swift
import UIKit
import EventKit
import GoogleAPIClientForREST_Calendar
import GoogleSignIn

class ToDoListNewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // 残日数と残時間を受け取るプロパティ（String型）
    var remainingDaysText = ""
    var remainingTimeText = ""
    
    @IBOutlet weak var remainingDays: UITextField!     //残日を表示
    @IBOutlet weak var remainingTime: UITextField!     //残時間を表示
    
    @IBOutlet weak var tableView: UITableView!
    var bulletedText = ""
    var taskArray:[String] = []
    // ToDoリストのデータを保持する配列
    var todoItems: [(text: String, date: Date, completed: Bool)] = []
    var deadline: Date?
    var startDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        remainingDays.text = remainingDaysText
        remainingTime.text = remainingTimeText
        
        // UserDefaultsから締切日を取得し、todoItemsに追加
        let userDefaults = UserDefaults.standard
        if let deadline = userDefaults.object(forKey: "deadline") as? Date {
            self.deadline = deadline
            //            todoItems.append(("締切日", deadline, false))
        }
        if let startDate = userDefaults.object(forKey: "startDate") as? Date {
            self.startDate = startDate
            //            todoItems.append(("締切日", startDate, false))
        }
    }
    
    // カレンダーボタンが押されたときのアクション
    @IBAction func toGoogleCalendar(_ sender: Any) {
        //        // Googleカレンダーにイベントを追加するコードを実装する
        //        // todoItemsのデータを使用してGoogleカレンダーにイベントを追加する
        //        // イベントのタイトル、日付、完了状態などを設定する
        //        let eventStore = EKEventStore()
        //        eventStore.requestAccess(to: .event) { (granted, error) in
        //            if granted && error == nil {
        //                let event = EKEvent(eventStore: eventStore)
        //                event.title = "タイトル"
        //                event.startDate = self.startDate
        //                event.endDate = self.deadline
        //                event.notes = "メモ"
        //                event.calendar = eventStore.defaultCalendarForNewEvents
        //                do {
        //                    try eventStore.save(event, span: .thisEvent)
        //                } catch let error as NSError {
        //                    print("failed to save event with error : \(error)")
        //                }
        //                print("Saved Event")
        //            } else {
        //                print("failed to save event with error : \(error) or access not granted")
        //            }
        //        }
        
        
        // let gidCurrentUser = UserDefaults.standard.object(forKey: "gidUser") as! GIDGoogleUser
        /*  GIDSignIn.sharedInstance.signIn(withPresenting: self) { result, error in
         guard error == nil else {
         return
         }
         
         guard let user = result?.user         else { return }
         //print(user.accessToken)
         //AUTHORISERを保存して　userdefault に保存しておく
         let authorizer = user.fetcherAuthorizer
         
         let gidCurrentUser: GIDGoogleUser = user
         
         do {
         let data = try NSKeyedArchiver.archivedData(withRootObject: gidCurrentUser, requiringSecureCoding: false)
         UserDefaults.standard.set(data, forKey: "gidUser")
         } catch {
         print("Error while encoding GIDGoogleUser object")
         }
         
         //            let calendarService = GTLRCalendarService()
         //            calendarService.authorizer = gidCurrentUser.authentication.fetcherAuthorizer()
         //            calendarService.authorizer = gidCurrentUser.fetcherAuthorizer
         
         // self.performSegue(withIdentifier: "Push", sender: self)
         
         //ここでGoogleログインをさせる送る先のログインをしてもらう　GIDcurrentuserを送ってみる
         //最初の画面をこ
         //        let gidCurrentUser = GIDSignIn.sharedInstance()?.currentUser
         
         */
        let additionalScopes = ["https://www.googleapis.com/auth/calendar"]
        guard let gidCurrentUser = GIDSignIn.sharedInstance.currentUser else {
            return ;  /* Not signed in. */
        }
        
        gidCurrentUser.addScopes(additionalScopes, presenting: self) { signInResult, error in
            guard error == nil else { return }
            guard let signInResult = signInResult else { return }
            
            // Check if the user granted access to the scopes you requested.
            //カレンダーの認証を持ったユーザーがいかの処理をする
            
        }
        //for文で作って
        let eventName = "MAMORU締切100% PROJECT"        //ここに入れる
        let startDateTime = self.startDate!
        let endDateTime = self.deadline!
        deadline!
        
        //calender service
        
        /*
         if let startDate = startDate, let deadline = deadline {
         // startDateとdeadlineがnilでない場合の処理
         let startDateTime = startDate
         let endDateTime = deadline
         // ここでstartDateTimeとendDateTimeを使用する処理を書く
         } else {
         print("error")
         // startDateかdeadlineのいずれかがnilの場合の処理
         }
         */
        
        let calendarService = GTLRCalendarService()
        calendarService.authorizer = gidCurrentUser.fetcherAuthorizer
        calendarService.shouldFetchNextPages = true
        
        let event = GTLRCalendar_Event()
        event.summary = eventName
        
        //  let gtlrDateTimeStart: GTLRDateTime = GTLRDateTime(date: startDateTime)
        if let startDateTime = self.startDate, let endDateTime = self.deadline {
            let gtlrDateTimeStart: GTLRDateTime = GTLRDateTime(date: startDateTime)
            // startDateTimeを使用する処理
            let startEventDateTime: GTLRCalendar_EventDateTime = GTLRCalendar_EventDateTime()
            startEventDateTime.dateTime = gtlrDateTimeStart
            event.start = startEventDateTime
            
        }
        
        //let gtlrDateTimeEnd: GTLRDateTime = GTLRDateTime(date: endDateTime)
        if let startDateTime = self.startDate, let endDateTime = self.deadline {
            let gtlrDateTimeEnd: GTLRDateTime = GTLRDateTime(date: endDateTime)
            // endDateTimeを使用する処理を書く
            
            let endEventDateTime: GTLRCalendar_EventDateTime = GTLRCalendar_EventDateTime()
            endEventDateTime.dateTime = gtlrDateTimeEnd
            event.end = endEventDateTime
            
        }
        //複数回せる可能性もあり！全部Forで囲んでしまう
        let query = GTLRCalendarQuery_EventsInsert.query(withObject: event, calendarId: "primary")
        calendarService.executeQuery(query, completionHandler: { (ticket, event, error) -> Void in
            if let error = error {
                NSLog("\(error)")
            }
        })
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // UITableViewのデータソースメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! TableViewCell
        let todoItem = taskArray[indexPath.row]
        
        if indexPath.row == 0 {
            cell.ToDoList.text = "締切日: \(todoItem)"
        } else {
            cell.ToDoList.text = todoItem
        }
        let remainingDaysInt = Int(remainingDaysText.components(separatedBy: " ")[0])!
        let rowDeadline = remainingDaysInt / taskArray.count * (indexPath.row + 1)
        let rowDate = Calendar.current.date(byAdding: .day, value: rowDeadline, to: startDate!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/d"
        let dateString = dateFormatter.string(from: rowDate!)
        cell.deadLine.text = "\(dateString)"
        
        return cell
    }
}
