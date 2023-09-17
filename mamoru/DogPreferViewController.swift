//
//  DogPreferViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/15.
//
//
//  DogPreferViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/15.
//

import UIKit
import AVFoundation

class DogPreferViewController: UIViewController {

    @IBOutlet weak var Mameshiba: UIImageView!
    @IBOutlet weak var Chihuahua: UIImageView!
    @IBOutlet weak var Toypoodle: UIImageView!
    @IBOutlet weak var Schnauzer: UIImageView!

    var audioPlayer: AVAudioPlayer?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // 各UIImageViewにタップジェスチャーを追加
        addTapGestureToImageView(imageView: Mameshiba, soundFileName: "dog01.mp3")
        addTapGestureToImageView(imageView: Chihuahua, soundFileName: "dog02.mp3")
        addTapGestureToImageView(imageView: Toypoodle, soundFileName: "dog03.mp3")
        addTapGestureToImageView(imageView: Schnauzer, soundFileName: "dog04.mp3")
    }
 
    @IBAction func start(_ sender: Any) {
        // 他のアクションに関するコード
    }

    // 各UIImageViewにタップジェスチャーを追加する関数
    func addTapGestureToImageView(imageView: UIImageView, soundFileName: String) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(sender:)))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        imageView.tag = 0 // タグを使ってどのUIImageViewがタップされたか判別するための初期化
    }

    @objc func imageViewTapped(sender: UITapGestureRecognizer) {
        // タップされたUIImageViewのタグを取得して、対応する音声を再生する
        let soundFileName: String
        switch sender.view {
        case Mameshiba:
            soundFileName = "dog01.mp3"
        case Chihuahua:
            soundFileName = "dog9.mp3"
        case Toypoodle:
            soundFileName = "dog04.mp3"
        case Schnauzer:
            soundFileName = "dog10.mp3"
        default:
            soundFileName = ""
        }
        
        if !soundFileName.isEmpty {
            playSound(soundFileName: soundFileName)
        } else {
            print("音声ファイルが見つかりません")
        }
    }

    func playSound(soundFileName: String) {
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
            print("音声ファイルが見つかりません")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("音声の再生中にエラーが発生しました: \(error.localizedDescription)")
        }
    }
}

/*
import UIKit
import AVFoundation

class DogPreferViewController: UIViewController {

    @IBOutlet weak var Mameshiba: UIImageView!
    @IBOutlet weak var Chihuahua: UIImageView!
    @IBOutlet weak var Toypoodle: UIImageView!
    @IBOutlet weak var Schnauzer: UIImageView!

    var audioPlayer: AVAudioPlayer?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // 各UIImageViewにタップジェスチャーを追加
        addTapGestureToImageView(imageView: Mameshiba, soundFileName: "dog01.mp3")
        addTapGestureToImageView(imageView: Chihuahua, soundFileName: "dog02.mp3")
        addTapGestureToImageView(imageView: Toypoodle, soundFileName: "dog03.mp3")
        addTapGestureToImageView(imageView: Schnauzer, soundFileName: "dog04.mp3")
    }
 
    @IBAction func start(_ sender: Any) {
        // 他のアクションに関するコード
    }

    // 各UIImageViewにタップジェスチャーを追加する関数
    func addTapGestureToImageView(imageView: UIImageView, soundFileName: String) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(sender:)))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        imageView.tag = 0 // タグを使ってどのUIImageViewがタップされたか判別するための初期化
    }

    @objc func imageViewTapped(sender: UITapGestureRecognizer) {
        // タップされたUIImageViewのタグを取得して、対応する音声を再生する
        let soundFileName: String
        switch sender.view?.tag {
        case Mameshiba.tag:
            soundFileName = "dog01.mp3"
        case Chihuahua.tag:
            soundFileName = "dog02.mp3"
        case Toypoodle.tag:
            soundFileName = "dog03.mp3"
        case Schnauzer.tag:
            soundFileName = "dog04.mp3"
        default:
            soundFileName = ""
        }
        
        if !soundFileName.isEmpty {
            playSound(soundFileName: soundFileName)
        } else {
            print("音声ファイルが見つかりません")
        }
    }

    func playSound(soundFileName: String) {
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
            print("音声ファイルが見つかりません")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("音声の再生中にエラーが発生しました: \(error.localizedDescription)")
        }
    }
}
 */
 
/*
import UIKit
import AVFoundation

class DogPreferViewController: UIViewController {

    @IBOutlet weak var Mameshiba: UIImageView!
    @IBOutlet weak var Chihuahua: UIImageView!
    @IBOutlet weak var Toypoodle: UIImageView!
    @IBOutlet weak var Schnauzer: UIImageView!

    // 他のIBOutletもここに追加

    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // タップジェスチャーをUIImageViewに追加
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        Mameshiba.addGestureRecognizer(tapGesture)
        Mameshiba.isUserInteractionEnabled = true // UIImageViewがタップを受け付けるようにする
    }

    @IBAction func start(_ sender: Any) {
        // 他のアクションに関するコード
    }

    @objc func imageViewTapped() {
        // タップされたときに音声を再生する
        playSound(soundFileName: "dog01.mp3")
    }

    func playSound(soundFileName: String) {
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
            print("音声ファイルが見つかりません")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("音声の再生中にエラーが発生しました: \(error.localizedDescription)")
        }
    }
}


*/
 

