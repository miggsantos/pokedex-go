//
//  PokedexVC.swift
//  pokedex-go
//
//  Created by Miguel Santos on 02/01/2019.
//  Copyright © 2019 Miguel Santos. All rights reserved.
//

import UIKit

var PokemonList=["001","002","003","004","005","101","234","323","002","003","004","005","101","234","323","002","003","004","005","101","234","323","002","003","004","005","101","234","323","002","003","004","005","101","234","323","002","003","004","005","101","234","323","002","003","004","005","101","234","323","002","003","004","005","101","234","323","002","003","004","005","101","234","323"]

class PokedexVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.reloadData()
        
    }
    


}

extension PokedexVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PokemonList.count
    
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_POKEDEX, for: indexPath) as? PokedexCell {
            
            print(PokemonList[indexPath.row])
            cell.configure(id: PokemonList[indexPath.row])
            
            return cell
        }
        
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        return CGSize(width: 117, height: 117)
    }
    
}
