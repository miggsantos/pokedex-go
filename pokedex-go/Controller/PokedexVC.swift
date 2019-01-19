//
//  PokedexVC.swift
//  pokedex-go
//
//  Created by Miguel Santos on 02/01/2019.
//  Copyright © 2019 Miguel Santos. All rights reserved.
//

import UIKit



class PokedexVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectioinViewFlowLayout: UICollectionViewFlowLayout!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.reloadData()
        
    }
    
    @IBAction func go_back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SEGUE_TO_POKEDEX_DETAILS_VC {
            if let detailsVC = segue.destination as? PokedexDetailsVC {
                if let index = sender as? Int {
                    detailsVC.selectedIndex = index
                }
            }
        }
    }
}

extension PokedexVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GenerationsCount[section + 1]!
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return GenerationsCount.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_POKEDEX, for: indexPath) as? PokedexCell {

            let pokemon_start_index_for_region = Utils.getFirstIndexPokemonByRegion(region: indexPath.section + 1)
            
            cell.configure(img: PokemonList[pokemon_start_index_for_region + indexPath.row].id_img_url)
            
            return cell
        }

        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CELL_POKEDEX_SECTION, for: indexPath) as? PokedexSectionCell{
            
            if let region = REGIONS[indexPath.section] {
                cell.configuration(region: region)
                return cell
            }
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("indexPath.row= \(indexPath.row)")
        
        let pokemon_start_index_for_region = Utils.getFirstIndexPokemonByRegion(region: indexPath.section + 1)
        
        performSegue(withIdentifier: SEGUE_TO_POKEDEX_DETAILS_VC, sender: pokemon_start_index_for_region + indexPath.row)
    }
    


}
extension PokedexVC: UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/POKEDEX_COLUMNS_NUMBER, height: collectionViewSize/POKEDEX_COLUMNS_NUMBER)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 60)
    }
    
}
