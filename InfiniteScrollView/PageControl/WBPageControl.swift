//
//  WBPageControl.swift
//  InfiniteScrollView
//
//  Created by 王文博 on 15/12/22.
//  Copyright © 2015年 Vision Core Crop. All rights reserved.
//

import UIKit

class WBPageControl: UIView {

  let spaceBetweenDot:CGFloat = 10.0
  let sizeOfDot:CGFloat = 15.0
  
  let currentPageView = UIView()
  
  var _numberOfPages:Int?
  
  var numberOfPages:Int {
    get {
      return _numberOfPages!
    }
    set(newValue){
      _numberOfPages = newValue
      for i in 0..<newValue {
        let marginLeft:CGFloat = i==0 ? 0.0:((sizeOfDot+spaceBetweenDot)*CGFloat(i))
        let dot = UIView(frame:CGRect(x: marginLeft, y: 0, width: sizeOfDot, height: sizeOfDot))
        dot.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.4)
        dot.layer.cornerRadius = dot.frame.size.width/2
        self.addSubview(dot)
      }
      currentPageView.frame = CGRect(x: 0, y: 0, width: sizeOfDot, height: sizeOfDot)
      currentPageView.backgroundColor = UIColor.cyanColor()
      currentPageView.layer.cornerRadius = currentPageView.frame.size.width/2
      self.insertSubview(currentPageView, atIndex: 0)
    }
  }
  
  var currentPage:Int {
    get{
      return self.currentPage
    }
    set(newValue){
      let marginLeft:CGFloat = newValue==0 ? 0.0:((sizeOfDot+spaceBetweenDot)*CGFloat(newValue))
      currentPageView.frame = CGRect(x: marginLeft, y: currentPageView.frame.origin.y, width: currentPageView.frame.size.width, height: currentPageView.frame.size.height)
    }
  }
  
  var moveIndex:CGFloat {
    get{
      return self.moveIndex
    }
    set(newValue) {
      var marginLeft:CGFloat = 0.0
      if newValue >= 0 {
        marginLeft = newValue%CGFloat(numberOfPages)
      }
      else
      {
        marginLeft = CGFloat(self.numberOfPages)+newValue%CGFloat(numberOfPages)
      }
      if abs(CGFloat(numberOfPages) - newValue%CGFloat(numberOfPages)) < 1.0 && newValue >= 0{
        marginLeft = abs(CGFloat(numberOfPages) - newValue%CGFloat(numberOfPages))
        currentPageView.backgroundColor = UIColor.cyanColor().colorWithAlphaComponent(0.4)
        currentPageView.frame = CGRect(x: marginLeft*(sizeOfDot+spaceBetweenDot)*(CGFloat(numberOfPages)-1), y: currentPageView.frame.origin.y, width: currentPageView.frame.size.width, height: currentPageView.frame.size.height)
      }
      else if abs(newValue%CGFloat(numberOfPages)) < 1.0 && newValue < 0 {
        marginLeft = abs(newValue%CGFloat(numberOfPages))
        if abs(newValue%CGFloat(numberOfPages)) == 0 {
          currentPageView.backgroundColor = UIColor.cyanColor().colorWithAlphaComponent(1)
        }
        else {
          currentPageView.backgroundColor = UIColor.cyanColor().colorWithAlphaComponent(0.4)
        }
        currentPageView.frame = CGRect(x: marginLeft*(sizeOfDot+spaceBetweenDot)*(CGFloat(numberOfPages)-1), y: currentPageView.frame.origin.y, width: currentPageView.frame.size.width, height: currentPageView.frame.size.height)
      }
      else {
        currentPageView.backgroundColor = UIColor.cyanColor().colorWithAlphaComponent(1)
        currentPageView.frame = CGRect(x: marginLeft*(sizeOfDot+spaceBetweenDot), y: currentPageView.frame.origin.y, width: currentPageView.frame.size.width, height: currentPageView.frame.size.height)
      }
    }
  }
  
  init(numberOfPages:Int, currentPage:Int, atPoint:CGPoint) {
    let frame = CGRect(x: 0, y: 0, width:CGFloat(numberOfPages)*sizeOfDot+CGFloat(numberOfPages-1)*spaceBetweenDot , height: sizeOfDot)
    super.init(frame: frame)
    self.center = atPoint
    self.numberOfPages = numberOfPages
    self.currentPage = currentPage
    self.center = atPoint
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}
