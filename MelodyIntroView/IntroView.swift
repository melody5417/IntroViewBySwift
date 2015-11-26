//
//  IntroView.swift
//  MelodyIntroView
//
//  Created by Yiqi Wang on 15/11/26.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

import UIKit

//if the delegate is not a class in the donebutton add target will be wrong
//and said self.delegate is not a object
protocol IntroViewDelegate: class {
  func onDoneButtonPressed()
}

class IntroView: UIView, UIScrollViewDelegate {

  // MARK: properties
  private var scrollView : UIScrollView!
  private var pageControl : UIPageControl!
  private var donebutton : UIButton!
  private var viewOne : UIView!
  private var viewTwo : UIView!
  var delegate : IntroViewDelegate!
  
  
  // MARK: init
  override init(frame: CGRect) {
    
    /*
    //initialize property
    //if property is ? or ! these codes need not to write
//    self.scrollView = UIScrollView(frame: frame)
//    self.pageControl = UIPageControl(frame: frame)
//    self.donebutton = UIButton(frame: frame)
//    self.viewOne = UIView(frame: frame)
//    self.viewTwo = UIView(frame: frame)
    */
    
    //like superinit must be called and
    //must after all the properties have been initiallized
    super.init(frame: frame)
    
    //initialize property
    self.initScrollView()
    self.initPageControl()
    self.initDoneButton()
    self.initViewOne()
    self.initViewTwo()
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  // MARK: customize property
  func initScrollView() {
    if self.scrollView == nil {
      self.scrollView = UIScrollView.init(frame: self.frame)
      self.scrollView.delegate = self
      self.scrollView.scrollEnabled = true
      self.scrollView.bounces = true
      self.scrollView.pagingEnabled = true
      self.scrollView.contentSize = CGSize(width: self.frame.width * 2, height: self.frame.height)
      self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    self.addSubview(self.scrollView)
  }
  
  func initPageControl() {
    if self.pageControl == nil {
      self.pageControl = UIPageControl(frame:CGRect(x: 0, y: self.frame.height - 80, width: self.frame.size.width, height: 10))
      self.pageControl.currentPageIndicatorTintColor = UIColor.redColor()
      self.pageControl.numberOfPages = 2
    }
    self.addSubview(self.pageControl)
  }
  
  func initDoneButton() {
    if self.donebutton == nil {
      self.donebutton = UIButton(frame: CGRect(x: 0, y: self.frame.height - 60, width: self.frame.width, height: 60))
      self.donebutton.setTitle("Let's Go", forState: UIControlState.Normal)
      self.donebutton.backgroundColor = UIColor(red: 0.129, green: 0.588, blue: 0.953, alpha: 1)
      
      //add target send action
      //if the delegate is not a class here will be wrong and said
      //self.delegate is not a object
      self.donebutton.addTarget(self.delegate, action: "onDoneButtonPressed" , forControlEvents: UIControlEvents.TouchUpInside);
      
    }
    self.addSubview(self.donebutton)
  }
  
  func initViewOne () {
    if self.viewOne == nil {
      self.viewOne = UIView(frame: self.frame)
      self.viewOne.backgroundColor = UIColor.purpleColor()
    }
    self.scrollView.addSubview(self.viewOne)
  }
  
  func initViewTwo() {
    if self.viewTwo == nil {
      self.viewTwo = UIView(frame: CGRect(x: self.frame.width, y: 0, width: self.frame.width, height: self.frame.height))
      self.viewTwo.backgroundColor = UIColor.redColor()
    }
    self.scrollView.addSubview(self.viewTwo)
  }
  
  
  // MARK: scrollview delegate
  func scrollViewDidScroll(scrollView: UIScrollView) {
    let pageWidth = CGRectGetWidth(self.bounds)
    let pageFraction = self.scrollView.contentOffset.x / pageWidth
    let pageFractionFloat = Float(pageFraction)
    self.pageControl.currentPage = Int(roundf(pageFractionFloat))
  }
}
