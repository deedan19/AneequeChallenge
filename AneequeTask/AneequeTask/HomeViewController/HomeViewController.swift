//
//  HomeViewController.swift
//  AneequeTask
//
//  Created by Decagon on 22/07/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var searchField: PaddingTextField!
    @IBOutlet weak var textFieldWrapper: UIView!
    @IBOutlet weak var shoeCollectionView: UICollectionView!
    
    fileprivate let firstCell = "ForYouCollectionViewCell"
    
    let shoes: [Shoes] = [
    Shoes(shoeName: "Runnerclick", shotPrice: 200, shoeImage: "1"),
        Shoes(shoeName: "DX Trainer 66", shotPrice: 202, shoeImage: "2"),
        Shoes(shoeName: "Aneeque Prime", shotPrice: 210, shoeImage: "3"),
        Shoes(shoeName: "Aneeque gold", shotPrice: 204, shoeImage: "4")
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.layer.cornerRadius = 35
        textFieldWrapper.layer.cornerRadius = 20
        shoeCollectionView.delegate = self
        shoeCollectionView.dataSource = self
        
        shoeCollectionView.register(ShoeCollectionViewCell.nib(), forCellWithReuseIdentifier: ShoeCollectionViewCell.identifier)
//        shoeCollectionView.contentInset = .init(top: 10, left: 20, bottom: 10, right: 20)
        shoeCollectionView.register(ShoeHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ShoeHeaderCell")
//        shoeCollectionView.register(ForYouCollectionViewCell.self, forCellWithReuseIdentifier: firstCell)
        // ForYouCell
        
        shoeCollectionView.register(ForYouCell.nib(), forCellWithReuseIdentifier: ForYouCell.identifier)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    


}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ShoeHeaderCell", for: indexPath) as? ShoeHeaderCell
//        header?.backgroundColor = .gray
        header?.delegate = self
        return header ?? UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 360)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForYouCell.identifier, for: indexPath) as? ForYouCell
            cell?.delegate = self
            return cell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShoeCollectionViewCell.identifier, for: indexPath) as? ShoeCollectionViewCell
            return cell ?? UICollectionViewCell()
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return .init(width: shoeCollectionView.frame.size.width, height: 60)
        } else {
            return .init(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 20, bottom: 10, right: 20)
    }

    
    
}

extension HomeViewController: SeeAllViewControllerDelegate {
    func instantiateSeeAllViewController() {
        guard let seeAllController = storyboard?.instantiateViewController(identifier: "SeeAllViewController") as? SeeAllViewController else { return }
        navigationController?.pushViewController(seeAllController, animated: true)
    }
    
    
}
