//
//  SeeAllViewController.swift
//  AneequeTask
//
//  Created by Decagon on 24/07/2021.
//

import UIKit

class SeeAllViewController: UIViewController {
    @IBOutlet weak var seeAllShoesCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchTextFieldView: UIView!
    
    let rightButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 10, height: 30)
        btn.clipsToBounds = true
        btn.setImage(UIImage(named: "filter"), for: .normal)
        btn.clipsToBounds = true
        btn.backgroundColor = .yellow
        return btn
    }()
    
    let btnView: UIImageView = {
       let view = UIImageView(image: UIImage(named: "filter"))
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        view.backgroundColor = .orange
        return view
    }()
    
    let rightBarButtonIcon: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 50, height: 40))
        let viewImage = UIImageView(image: UIImage(named: "filter"))
        viewImage.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        view.clipsToBounds = true
        view.addSubview(viewImage)
        return view
    }()
    
    let leftBarButtonIcon: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 50, height: 40))
        let viewImage = UIImageView(image: UIImage(named: "filter"))
        viewImage.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        view.clipsToBounds = true
        view.addSubview(viewImage)
        return view
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButtonIcon)
        searchTextFieldView.layer.cornerRadius = 20
        title = "For You"
        seeAllShoesCollectionView.register(ShoeCollectionViewCell.nib(), forCellWithReuseIdentifier: ShoeCollectionViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        
    }

}

extension SeeAllViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell
                = collectionView.dequeueReusableCell(withReuseIdentifier: ShoeCollectionViewCell.identifier, for: indexPath) as? ShoeCollectionViewCell
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 20, bottom: 20, right: 20)
    }
    
    
}
