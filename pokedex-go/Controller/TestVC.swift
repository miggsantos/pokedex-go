//
//  TestVC.swift
//  pokedex-go
//
//  Created by Miguel Santos on 03/01/2019.
//  Copyright © 2019 Miguel Santos. All rights reserved.
//

import UIKit

class TestVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        animateBackground()
        
    }
    
    func animateBackground() {
        let animationOptions = UIView.AnimationOptions.repeat.rawValue | UIView.AnimationOptions.curveLinear.rawValue
        let backgroundImage = UIImage(named:"pokedex_entry_background.png")!
        let amountToKeepImageSquare = backgroundImage.size.height - self.view.frame.size.height
        
        // print("-->\(amountToKeepImageSquare)")
        
        // UIImageView 1
        let backgroundImageView1 = UIImageView(image: backgroundImage)
        backgroundImageView1.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: backgroundImage.size.width - amountToKeepImageSquare, height: self.view.frame.size.height)
        self.view.addSubview(backgroundImageView1)
        
        // UIImageView 2
        let backgroundImageView2 = UIImageView(image: backgroundImage)
        backgroundImageView2.frame = CGRect(x: backgroundImageView1.frame.size.width, y: self.view.frame.origin.y, width: backgroundImage.size.width - amountToKeepImageSquare, height: self.view.frame.height)
        self.view.addSubview(backgroundImageView2)
        
        
        // Animate background
        UIView.animate(withDuration: 12.0, delay: 0.0, options: UIView.AnimationOptions(rawValue: animationOptions), animations: {
            backgroundImageView1.frame = backgroundImageView1.frame.offsetBy(dx: -1 * backgroundImageView1.frame.size.width, dy: 0.0)
            backgroundImageView2.frame = backgroundImageView2.frame.offsetBy(dx: -1 * backgroundImageView2.frame.size.width, dy: 0.0)
        }, completion: nil)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
