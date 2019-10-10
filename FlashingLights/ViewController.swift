//
//  ViewController.swift
//  FlashingLights
//
//  Created by Catalin Palade on 10/10/2019.
//  Copyright © 2019 Catalin Palade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    let standardTime: Double = 0.1
    
    var appTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView.backgroundColor = .black
        bottomView.backgroundColor = .black
    }

    @IBAction func didTapOnScreen(_ sender: UITapGestureRecognizer) {
        
        if sender.state == .ended {
            flash(every: standardTime)
        }
    }
    
    func flash(every msec: Double) {
        guard appTimer == nil else { return }
        
        appTimer = Timer.scheduledTimer(withTimeInterval: msec, repeats: true) { timer in
            
            if self.topView.backgroundColor == .black || self.topView.backgroundColor == .white {
                self.topView.backgroundColor = .red
                self.bottomView.backgroundColor = .white
            } else {
                self.topView.backgroundColor = .white
                self.bottomView.backgroundColor = .blue
            }
        }
    }
    
    
    
}

