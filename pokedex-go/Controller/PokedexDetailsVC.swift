//
//  PokedexDetailsVC.swift
//  pokedex-go
//
//  Created by Miguel Santos on 03/01/2019.
//  Copyright © 2019 Miguel Santos. All rights reserved.
//

import UIKit

class PokedexDetailsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    //@IBOutlet weak var background_image: UIImageView!
    var selectedIndex:Int!
    var hasSetFirstPosition = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        let scrollView = collectionView as UIScrollView
        scrollView.delegate = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
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
        //self.view.addSubview(backgroundImageView1)
        self.view.insertSubview(backgroundImageView1, at: 1)
        
        // UIImageView 2
        let backgroundImageView2 = UIImageView(image: backgroundImage)
        backgroundImageView2.frame = CGRect(x: backgroundImageView1.frame.size.width, y: self.view.frame.origin.y, width: backgroundImage.size.width - amountToKeepImageSquare, height: self.view.frame.height)
        //self.view.addSubview(backgroundImageView2)
        self.view.insertSubview(backgroundImageView2, at: 1)
        
        
        // Animate background
        UIView.animate(withDuration: 12.0, delay: 0.0, options: UIView.AnimationOptions(rawValue: animationOptions), animations: {
            backgroundImageView1.frame = backgroundImageView1.frame.offsetBy(dx: -1 * backgroundImageView1.frame.size.width, dy: 0.0)
            backgroundImageView2.frame = backgroundImageView2.frame.offsetBy(dx: -1 * backgroundImageView2.frame.size.width, dy: 0.0)
            self.view.layoutIfNeeded()
        }, completion: nil)
        

    }

    @IBAction func go_back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

extension PokedexDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PokemonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !hasSetFirstPosition {
            //set the row and section you need.
            let indexToScrollTo = IndexPath(row: selectedIndex, section: indexPath.section)
            self.collectionView.scrollToItem(at: indexToScrollTo, at: .left, animated: false)
            hasSetFirstPosition = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // print("indexPath.row= \(indexPath.row)")
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_POKEDEX_DETAILS, for: indexPath) as? PokedexDetailsCell {
            cell.configure(id: PokemonList[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}

extension PokedexDetailsVC: UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width
        let itemHeight = collectionView.bounds.height
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}
