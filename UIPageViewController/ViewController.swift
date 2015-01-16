//
//  ViewController.swift
//  UIPageViewController
//
//  Created by Shrikar Archak on 1/15/15.
//  Copyright (c) 2015 Shrikar Archak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {


    let pageTitles = ["Title 1", "Title 2", "Title 3", "Title 4"]
    var images = ["pic1.jpeg","pic2.jpg","pic3.jpeg","pic4.jpeg"]
    var count = 0
    
    var pageViewController : UIPageViewController!
    
    @IBAction func swipeLeft(sender: AnyObject) {
        println("SWipe left")
    }
    @IBAction func swiped(sender: AnyObject) {
    
        self.pageViewController.view .removeFromSuperview()
        self.pageViewController.removeFromParentViewController()
        
        if((count % 5) == 0) {
            images = ["bridge.jpeg","mountain.jpeg","snow.jpeg","sunset.jpeg"]
        } else {
            images = ["pic1.jpeg","pic2.jpg","pic3.jpeg","pic4.jpeg"]
        }
    
        count++
        reset()
    }

    func reset() {
        /* Getting the page View controller */
        
        pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as UIPageViewController
        self.pageViewController.dataSource = self
        
        let pageContentViewController = self.viewControllerAtIndex(0)
        self.pageViewController.setViewControllers([pageContentViewController!], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        self.pageViewController.view.frame = self.view.frame
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }
    
    @IBAction func start(sender: AnyObject) {
        let pageContentViewController = self.viewControllerAtIndex(0)
        self.pageViewController.setViewControllers([pageContentViewController!], direction: UIPageViewControllerNavigationDirection.Reverse, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as PageContentViewController).pageIndex!
        
        println("afte : \(index)")
        index++
        if(index >= self.images.count){
            return nil
        }

        return self.viewControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as PageContentViewController).pageIndex!
        println("before : \(index)")
        if(index <= 0){
            return nil
        }
        index--
        return self.viewControllerAtIndex(index)
        
    }

    func viewControllerAtIndex(index : Int) -> UIViewController? {
        if((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
            return nil
        }
        let pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as PageContentViewController

        pageContentViewController.imageName = self.images[index]
        pageContentViewController.titleText = self.pageTitles[index]
        pageContentViewController.pageIndex = index
        return pageContentViewController
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

}

