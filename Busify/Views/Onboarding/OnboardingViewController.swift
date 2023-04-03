//
//  ViewController.swift
//  Busify
//
//  Created by Kerem Ersu on 1.04.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    let onboardingArray = setOnboardingData()
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == onboardingArray.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureCollectionView()
        
        pageControl.numberOfPages = onboardingArray.count
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


extension OnboardingViewController {
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if currentPage == onboardingArray.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginViewController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            //UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        onboardingArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnBoardingCell
        cell.setup(model: onboardingArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}

func setOnboardingData() -> Array<OnboardingModel> {
    
    return [OnboardingModel(image: UIImage(named: "onboarding1")!, title: "Welcome to Busify!", detail: "Skip the lines and hassle of buying tickets in person. Book your seats, pay online, and travel with ease using Busify."),
            OnboardingModel(image: UIImage(named: "onboarding2")!, title: "Buy Bus Tickets in a Snap!", detail: "Skip the hassle of buying bus tickets in person. Use our app to purchase tickets with ease, anytime and anywhere.")]
}
