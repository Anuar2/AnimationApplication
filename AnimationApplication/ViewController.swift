//
//  ViewController.swift
//  AnimationApplication
//
//  Created by Anuar Orazbekov on 06.06.2022.
//

import UIKit
import Spring

class ViewController: UIViewController {
    
    @IBOutlet var coreAnimationView: UIView!
    @IBOutlet var springAnimationView: SpringView!
    
    private var originCordinate: CGFloat?
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        originCordinate = coreAnimationView.frame.origin.x
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        originCordinate = coreAnimationView.frame.origin.x
        
    }
    
    @IBAction func coreAnimationButtonPressed(_ sender: UIButton) {
        sender.pulsate()
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.autoreverse, .repeat]){ [weak self] in
            guard let self = self else {return}
        
            if self.coreAnimationView.frame.origin.x == self.originCordinate{
                self.coreAnimationView.frame.origin.x -= 20
            }
        }
  
        
        if coreAnimationView.frame.origin.x == originCordinate{
        coreAnimationView.frame.origin.x -= 20
    }
    }
    
    @IBAction func spingAnimationButtonPressed(_ sender: SpringButton) {
        springAnimationView.animation = Spring.AnimationPreset.slideLeft.rawValue
        springAnimationView.curve = Spring.AnimationCurve.easeIn.rawValue
        springAnimationView.duration = 1
        springAnimationView.animate()
        
        sender.animation = "shake"
        sender.animate()
    }
    
    
}

