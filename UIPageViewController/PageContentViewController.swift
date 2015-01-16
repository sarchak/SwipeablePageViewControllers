//
//  PageContentViewController.swift
//  UIPageViewController
//
//  Created by Shrikar Archak on 1/15/15.
//  Copyright (c) 2015 Shrikar Archak. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {

    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var bkImageView: UIImageView!
    
    var pageIndex: Int?
    var titleText : String?
    var imageName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bkImageView.image = UIImage(named: imageName)
        self.heading.text = titleText
        self.bkImageView.contentMode = UIViewContentMode.ScaleAspectFill
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
