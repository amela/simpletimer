//
//  ViewController.swift
//  Timer
//
//  Created by amela on 13/11/15.
//  Copyright © 2015 amela. All rights reserved.
//

import UIKit
import ChameleonFramework

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var onOffButton: UIButton!
    
    @IBOutlet weak var plusTenButton: UIButton!
    
    @IBOutlet weak var plusTenAction: UIButton!
    
    var timer: NSTimer?
    
    let timerModel = TimerModel(time: 20)
    var time: Int?
    
    var going: Bool = false
    
    @IBAction func onOffAction(sender: UIButton) {
        if going == false {
            start()
            
        } else {
            stop()
        }
    }
    
    @IBAction func plusTenAction(sender: AnyObject) {
        time = time! + 10
        if time > 9 {
            timerLabel.textColor = UIColor.whiteColor()
        }
        
        if time > 0 {
            onOffButton.enabled = true
            if going == false {
                onOffButton.setBackgroundImage(UIImage(named: "play.png"), forState: .Normal)
            }
        }
        
        timerLabel.text = String(time!)
    }
    
    func start () {
        onOffButton.setBackgroundImage(UIImage(named: "stop.png"), forState: .Normal)
        going = true
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "count", userInfo: nil, repeats: true)
    }
    
    func stop () {
        onOffButton.setBackgroundImage(UIImage(named: "play.png"), forState: .Normal)
        timer!.invalidate()
        timer = nil
        going = false
    }
    
    func count () {
        time = time! - 1
        timerLabel.text = String(time!)
        
        if time < 10 {
            timerLabel.textColor = UIColor.yellowColor()        }
        
        if time < 1 {
            stop()
            onOffButton.enabled = false
            onOffButton.setBackgroundImage(UIImage(named: "stop.png"), forState: .Normal)
        }
    }
    
    deinit {
        if let timer = timer {
            timer.invalidate()
            self.timer = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        time = timerModel.time
        timerLabel.text = String(time!)
        
        let colors:[UIColor] = [
            UIColor.flatLimeColor(),
            UIColor.flatGreenColor()
        ]
        
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        view.backgroundColor = UIColor(gradientStyle: UIGradientStyle.TopToBottom, withFrame: frame, andColors:colors)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

