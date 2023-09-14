//
//  ToDoInputViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/13.
//

import UIKit

class ToDoInputViewController: UIViewController {
    @IBOutlet weak var remainingDays: UITextField!
    //残時間を表示
     @IBOutlet weak var remainingTime: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //残日数と残時間を表示する
            remainingDays.text = remainingDays.text
            remainingTime.text = remainingTime.text

    }
    
        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) UIImage(systemName: "ipad.homebutton"){
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
