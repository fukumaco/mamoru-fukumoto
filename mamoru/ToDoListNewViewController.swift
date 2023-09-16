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

    // とりあえず全部締切日を代入
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
        
        
        let gidCurrentUser = UserDefaults.standard.object(forKey: "gidUser") as! GIDGoogleUser

        
//        let gidCurrentUser = GIDSignIn.sharedInstance()?.currentUser

        let eventName = "test Event"
        let startDateTime = startDate!
        let endDateTime = deadline!
        
        let calendarService = GTLRCalendarService()
        calendarService.authorizer = gidCurrentUser.authentication.fetcherAuthorizer()
        calendarService.shouldFetchNextPages = true
        
        let event = GTLRCalendar_Event()
        event.summary = eventName
        
        let gtlrDateTimeStart: GTLRDateTime = GTLRDateTime(date: startDateTime)
        let startEventDateTime: GTLRCalendar_EventDateTime = GTLRCalendar_EventDateTime()
        startEventDateTime.dateTime = gtlrDateTimeStart
        event.start = startEventDateTime
        
        let gtlrDateTimeEnd: GTLRDateTime = GTLRDateTime(date: endDateTime)
        let endEventDateTime: GTLRCalendar_EventDateTime = GTLRCalendar_EventDateTime()
        endEventDateTime.dateTime = gtlrDateTimeEnd
        event.end = endEventDateTime
        
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

/*
import UIKit
import EventKit
import GoogleAPIClientForREST_Calendar

class ToDoListNewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // 残日数と残時間を受け取るプロパティ（String型）
    var remainingDaysText = ""
    var remainingTimeText = ""

    @IBOutlet weak var remainingDays: UITextField!//残日を表示
    @IBOutlet weak var remainingTime: UITextField!     //残時間を表示

    @IBOutlet weak var tableView: UITableView!
    var bulletedText = ""
    var taskArray:[String] = []
    // ToDoリストのデータを保持する配列
    var todoItems: [(text: String, date: Date, completed: Bool)] = []

    //とりあえず全部締切日を代入
    override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.dataSource = self
            tableView.delegate = self
     
            remainingDays.text = remainingDaysText
            remainingTime.text = remainingTimeText
            
            // UserDefaultsから締切日を取得し、todoItemsに追加
            let userDefaults = UserDefaults.standard
            if let deadline = userDefaults.object(forKey: "deadline") as? Date {
                todoItems.append(("締切日", deadline, false))
            }
        
        
/*    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
 
        remainingDays.text = remainingDaysText
        remainingTime.text = remainingTimeText
 */
 
    }
    
    // カレンダーボタンが押されたときのアクション
    @IBAction func toGoogleCalendar(_ sender: Any) {
        /*Googleカレンダーにイベントを追加するコードを実装する
         todoItemsのデータを使用してGoogleカレンダーにイベントを追加する
         イベントのタイトル、日付、完了状態などを設定する
        */
        let eventStore = EKEventStore()
        eventStore.requestAccess(to: .event) { (granted, error) in
            if (granted) && (error == nil) {
                let event = EKEvent(eventStore: eventStore)
                event.title = "タイトル"
                event.startDate = Date()
                event.endDate = Date()
                event.notes = "メモ"
                event.calendar = eventStore.defaultCalendarForNewEvents
                do {
                    try eventStore.save(event, span: .thisEvent)
                } catch let error as NSError {
                    print("failed to save event with error : \(error)")
                }
                print("Saved Event")
            }
            else{
                print("failed to save event with error : \(error) or access not granted")
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // UITableViewのデータソースメソッド
    

    /*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return todoItems.count
        return taskArray.count
    }
     */
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! TableViewCell
        let todoItem = taskArray[indexPath.row]

        //        let todoItem = todoItems[indexPath.row]
        
//        var config = cell.defaultContentConfiguration()
//
//        config.text = todoItem
//
//        cell.contentConfiguration = config
        
//        cell.toDoList.text = todoItem
//        cell.toDoList.text = todoItem.text
//        cell.takeTime.text = "\(todoItem.date)"
//        cell.checkButton.isOn = todoItem.completed
        
//        cell.deadLine.text = todoItem.date.description
        cell.ToDoList.text = todoItem//.text
//        cell.Time.text = "\(todoItem.date)"
//        cell.checkButton.isOn = todoItem.completed
        
        return cell
    }
    //TODOLIDTNEWViewControlle
    
}
*/
