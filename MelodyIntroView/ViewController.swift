//
//  ViewController.swift
//  MelodyIntroView
//
//  Created by Yiqi Wang on 15/11/26.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, IntroViewDelegate {
  
  var introView:IntroView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    self.introView = IntroView(frame: self.view.bounds)
    //bounce will show the background of introview
    introView.backgroundColor = UIColor.brownColor()
    introView.delegate = self
    self.view.addSubview(introView)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  // MARK: IntroViewDelegate
  func onDoneButtonPressed() {
    self.introView.removeFromSuperview()
    self.view.backgroundColor = UIColor.greenColor()
    
  }
}

