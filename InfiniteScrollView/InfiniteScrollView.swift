//
//  InfiniteScrollView.swift
//  InfiniteScrollView
//
//  Created by 王文博 on 15/12/22.
//  Copyright © 2015年 Vision Core Crop. All rights reserved.
//

import UIKit

let ScreenWidth = UIScreen.mainScreen().bounds.size.width
let ScreenHeight = UIScreen.mainScreen().bounds.size.height

class InfiniteScrollView: UIScrollView, UIScrollViewDelegate {
  
  var imageArray:[UIImage] = []
  var imageViewArray:[UIImageView] = []
  var nowIndex = 0
  let initIndex = 500
  
  override init(frame: CGRect) {
    let frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
    super.init(frame: frame)
    
    self.delegate = self
    self.pagingEnabled = true
    self.contentSize = CGSize(width: ScreenWidth * 1000.0, height: ScreenHeight)
    
    addDataAndCreateUI()
  }
  
  func addDataAndCreateUI() {
    imageArray.append(UIImage(named: "IMG_0499.PNG")!)
    imageArray.append(UIImage(named: "IMG_0500.PNG")!)
    imageArray.append(UIImage(named: "IMG_0501.PNG")!)
    imageArray.append(UIImage(named: "IMG_0502.PNG")!)
    imageArray.append(UIImage(named: "IMG_0501.PNG")!)
    
    for var i = 0; i <= 2; i++ {
      let imageView = UIImageView(image: imageArray[i])
      imageView.frame = CGRect(x: CGFloat(i+initIndex) * ScreenWidth, y: 0, width: ScreenWidth, height: ScreenHeight)
      imageView.contentMode = .ScaleAspectFill
      imageView.layer.masksToBounds = true
      self.addSubview(imageView)
      imageViewArray.append(imageView)
    }
    
    self.setContentOffset(CGPoint(x: ScreenWidth * CGFloat(initIndex+1), y: 0), animated: false)
    nowIndex = 1
  }
  
  func scrollViewDidScroll(scrollView: UIScrollView) {
    let index = Int(scrollView.contentOffset.x/ScreenWidth)
    if index != nowIndex {
      nowIndex = index
      for var i = 0; i <= 2; i++ {
        let imageView = imageViewArray[i]
        imageView.frame = CGRect(x: CGFloat(nowIndex-1+i) * ScreenWidth, y: imageView.frame.origin.y, width: imageView.frame.size.width, height: imageView.frame.size.height)
        if nowIndex > 500 {
          imageView.image = imageArray[(abs(nowIndex-initIndex)-1+i)%imageArray.count]
        }
        else {
          imageView.image = imageArray[((imageArray.count-abs(nowIndex-initIndex)%imageArray.count)-1+i)%imageArray.count]
        }
      }
    }
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}