//
//  AddSetVC.swift
//  FlashingLights
//
//  Created by Catalin Palade on 12/10/2019.
//  Copyright © 2019 Catalin Palade. All rights reserved.
//

import UIKit

class AddSetVC: UIViewController {
    
    @IBOutlet weak var topCV: UICollectionView!
    @IBOutlet weak var bottomCV: UICollectionView!
    
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        addButton.layer.cornerRadius = 4
        addButton.layer.shadowColor = UIColor.gray.cgColor
        addButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        addButton.layer.shadowRadius = 1.0
        addButton.layer.shadowOpacity = 0.7
    }
    
    @IBAction func addNewSet(_ sender: UIButton) {
        
    }
    
}
