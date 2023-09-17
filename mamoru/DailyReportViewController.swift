//
//  DailyReportViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/15.
//
import UIKit
import AVFoundation

class DailyReportViewController: UIViewController {

    @IBOutlet weak var RemainingDays: UITextField!
    
    @IBOutlet weak var RemainingTIme: UITextField!
    
    @IBOutlet weak var dog01: UIImageView!
    
    @IBOutlet weak var report: UILabel!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        dog01.isUserInteractionEnabled = true
        dog01.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        guard let url = Bundle.main.url(forResource: "dog01", withExtension: "mp3") else { return }
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch let error {
                print(error.localizedDescription)
            }
    }
}


/*
import UIKit

class DailyReportViewController: UIViewController {

    @IBOutlet weak var RemainingDays: UITextField!
    
    @IBOutlet weak var RemainingTIme: UITextField!
    
    @IBOutlet weak var dog01: UIImageView!
    
    @IBOutlet weak var report: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
*/

