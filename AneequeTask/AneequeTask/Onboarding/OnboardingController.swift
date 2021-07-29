//
//  OnboardingViewController.swift
//  AneequeTask
//
//  Created by Decagon on 25/07/2021.
//

import UIKit

class OnboardingController: UIViewController {
    
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var onboardingButton: UIButton!
    
    var onboardingSlides: [OnboardingModel] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == onboardingSlides.count - 1 {
                onboardingButton.setTitle("Get Started", for: .normal)
            } else {
                onboardingButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingButton.layer.cornerRadius = 10
        self.onboardingSlides = slides
        onboardingCollectionView.dataSource = self
        onboardingCollectionView.delegate = self
        
        pageControl.numberOfPages = onboardingSlides.count
    }
    
    @IBAction func onboardingBtnn () {
        if currentPage == onboardingSlides.count - 1 {
        
            if let controller = storyboard?.instantiateViewController(identifier: "BaseTabBarController") {
                controller.view.backgroundColor = .systemBlue
                controller.modalPresentationStyle = .fullScreen
                controller.modalTransitionStyle = .flipHorizontal
                present(controller, animated: true, completion: nil)
            }
           
        } else {
            print("Button tapped")
            currentPage += 1
            let  indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
      
    }
}

extension OnboardingController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = onboardingCollectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell
        cell?.setup(with: onboardingSlides[indexPath.item])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
    
}




