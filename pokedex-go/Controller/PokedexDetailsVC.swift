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
    
    var selectedIndex:Int!
    var hasSetFirstPosition = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        let scrollView = collectionView as UIScrollView
        scrollView.delegate = self

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
        
        print("indexPath.row= \(indexPath.row)")
        
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
