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
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    let standardTime: Double = 0.1
    
    var appTimer: Timer?
    var toggle: Bool = true
    
    var colors: [[UIColor]] = [[UIColor.red, UIColor.blue], [UIColor.red], [UIColor.blue], [UIColor.orange]]
    var index: Int = 0 {
        didSet {
            stopTimer()
            flash(every: standardTime, for: index)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonsShadow()
        view.backgroundColor = .black
        
        setViews(color1: colors[0][0], withAlpha: 1, color2: colors[0][1], withAlpha: 1)
    }
    
    func setViews(color1: UIColor, withAlpha alpha1: CGFloat, color2: UIColor, withAlpha alpha2: CGFloat) {
        
        topView.backgroundColor = color1.withAlphaComponent(alpha1)
        bottomView.backgroundColor = color2.withAlphaComponent(alpha2)
    }
    
    @IBAction func stopTapped(_ sender: UIButton) {
        stopTimer()
    }
    
    @IBAction func didTapOnScreen(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            flash(every: standardTime, for: index)
        }
    }
    
    // PREVIOUS
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .right {
            if index > 0 {
                index -= 1
            }
        }
    }
    
    // NEXT
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            if index < colors.count - 1 {
                index += 1
            }
        }
    }
    
    func flash(every msec: Double, for index: Int) {
        guard appTimer == nil else { return }
        appTimer = Timer.scheduledTimer(withTimeInterval: msec, repeats: true) { timer in
            
            if self.colors[index].count == 1 {
                if self.toggle {
                    self.topView.backgroundColor = self.colors[index][0].withAlphaComponent(1)
                    self.bottomView.backgroundColor = self.colors[index][0].withAlphaComponent(1)
                } else {
                    self.topView.backgroundColor = self.colors[index][0].withAlphaComponent(0.1)
                    self.bottomView.backgroundColor = self.colors[index][0].withAlphaComponent(0.1)
                }
            } else if self.colors[index].count == 2 {
                if self.toggle {
                    self.topView.backgroundColor = self.colors[index][0].withAlphaComponent(1)
                    self.bottomView.backgroundColor = self.colors[index][1].withAlphaComponent(0.1)
                } else {
                    self.topView.backgroundColor = self.colors[index][0].withAlphaComponent(0.1)
                    self.bottomView.backgroundColor = self.colors[index][1].withAlphaComponent(1)
                }
            }
            self.toggle.toggle()
        }
    }
    
    fileprivate func stopTimer() {
        guard let timer = appTimer else { return }
        timer.invalidate()
        appTimer = nil
    }
    
    fileprivate func setButtonsShadow() {
        addButton.layer.shadowColor = UIColor.gray.cgColor
        addButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        addButton.layer.shadowRadius = 1.0
        addButton.layer.shadowOpacity = 0.7
        
        stopButton.layer.shadowColor = UIColor.gray.cgColor
        stopButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        stopButton.layer.shadowRadius = 1.0
        stopButton.layer.shadowOpacity = 0.7
    }
}
