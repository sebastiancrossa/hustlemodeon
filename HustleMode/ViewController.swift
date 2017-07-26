//
//  ViewController.swift
//  HustleMode
//
//  Created by Sebastian Crossa on 7/25/17.
//  Copyright © 2017 CROSS-A. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerButton: UIButton!
    
    @IBOutlet weak var cloudHolder: UIView!
    
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleLbl: UILabel!
    @IBOutlet weak var onLbl: UILabel!
    
    var player : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        
    }

    @IBAction func powerButtonPressed(_ sender: Any) {
        
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerButton.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 100, width: 361, height: 457)
        }) { (finished) in
            self.hustleLbl.isHidden = false
            self.onLbl.isHidden = false
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

