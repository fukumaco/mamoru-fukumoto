//
//  MapViewController.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/14.
//
import UIKit

class MapViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController: UIPageViewController?
    var contentImages: [UIImage] = []
    var contentTexts: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        contentImages = [#imageLiteral(resourceName: "mameshiba01"), #imageLiteral(resourceName: "mameshiba02")]
        contentTexts = ["text1", "text2"]

        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController!.dataSource = self

        let startingViewController: ContentViewController = viewControllerAtIndex(index: 0)!
        let viewControllers = [startingViewController]
        pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: nil)

        self.addChild(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMove(toParent: self)

        let pageViewRect = self.view.bounds
        pageViewController!.view.frame = pageViewRect
    }

    
    func viewControllerAtIndex(index: Int) -> ContentViewController? {
        if (contentTexts.count == 0) || (index >= contentTexts.count) {
            return nil
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dataViewController = storyboard.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController

        dataViewController.imageFile = contentImages[index]
        dataViewController.textString = contentTexts[index]
        dataViewController.pageIndex = index

        
        return dataViewController
    }

    func indexOfViewController(viewController: ContentViewController) -> Int {
        return viewController.pageIndex
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = indexOfViewController(viewController: viewController as! ContentViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }

        index -= 1
        return viewControllerAtIndex(index: index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = indexOfViewController(viewController: viewController as! ContentViewController)
        if index == NSNotFound {
            return nil
        }

        index += 1
        if index == contentTexts.count {
            return nil
        }
        
        return viewControllerAtIndex(index: index)
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return contentTexts.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
/*
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
 */
/*
import UIKit

class MapViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
*/
/*

 import UIKit

class MapViewController: UIViewController, UIScrollViewDelegate {

     @IBOutlet weak var scrollView: UIScrollView!
     var imageView: UIImageView!

     override func viewDidLoad() {
         super.viewDidLoad()

         imageView = UIImageView(image: UIImage(named: "mameshiba01.png"))
         imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: imageView.image!.size)
         scrollView.addSubview(imageView)

         scrollView.contentSize = imageView.image!.size
         scrollView.delegate = self
         scrollView.minimumZoomScale = 1.0
         scrollView.maximumZoomScale = 3.0
     }

     func viewForZooming(in scrollView: UIScrollView) -> UIView? {
         return imageView
     }
 }
*/
