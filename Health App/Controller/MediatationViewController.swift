//
//  MediatationViewController.swift
//  Health App
//
//  Created by Swapnik R. Katkoori on 3/1/19.
//  Copyright © 2019 Swapnik R. Katkoori. All rights reserved.
//

import UIKit

class MeditationViewController: UIViewController{
    
    
    @IBOutlet weak var Label: UILabel!
    
    var time = 20
    
    //timer
    var timer = Timer()
    
    
    @IBAction func Start(_ sender: UIButton)
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MeditationViewController.action), userInfo: nil, repeats: true)
    }
    @IBAction func Pause(_ sender: UIButton)
    {
        timer.invalidate()
    }
    
    @IBAction func Reset(_ sender: UIButton)
    {
        //timer.invalidate()
        time = 20
        Label.text = ("0")
    }
    @objc func action()
    {
        time -= 1
        Label.text = String(time)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

