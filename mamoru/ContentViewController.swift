//
//  ContentViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/14.
//

import UIKit

class ContentViewController : UIViewController {

    @IBOutlet var imageView:UIImageView?
    @IBOutlet var textView:UITextView?

    var pageIndex:Int = 0
    var imageFile:UIImage? = nil
    var textString:String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView?.image = imageFile
        textView?.text = textString
    }
}
 
 /*
import UIKit

class ContentViewController: UIViewController {

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
