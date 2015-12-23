//
//  ViewController.swift
//  InfiniteScrollView
//
//  Created by 王文博 on 15/12/22.
//  Copyright © 2015年 Vision Core Crop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let scrollView = InfiniteScrollView()
  let pageControl = WBPageControl(numberOfPages: 5, currentPage: 0, atPoint: CGPoint(x: ScreenWidth/2, y: ScreenHeight-100))

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    view.addSubview(scrollView)
    view.addSubview(pageControl)
    scrollView.pageControl = pageControl
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

