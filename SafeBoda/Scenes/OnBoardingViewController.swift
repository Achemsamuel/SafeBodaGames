///
//  OnBoardingViewController.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//


import UIKit

class OnBoardingViewController : UIViewController {
    
    static var STORYBOARD_ID = String(describing: OnBoardingViewController.self)
    class var storyboardName: String {
        return StoryBoards.Main.rawValue
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var iphoneScrollView: UIScrollView!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var wrappingView: UIView!
    @IBOutlet weak var iphoneImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var wrappingViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var skipButtonLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var nextButtonTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var iphoneImageViewAspectRatioConstraint: NSLayoutConstraint!
    
    var slides:[OnboardingSlide] = []
    var slideIphoneImageResourceNames: [String] = []
    var currentSlideIndex = 0
    var currentPercentHorizontalOffset:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupOnLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handleOnLoadAnimations()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    fileprivate func handleOnLoadAnimations() {
        UIView.animate(withDuration: 0.9, animations: {
            self.skipButtonLeadingConstraint.constant = 20
            self.wrappingViewTopConstraint.constant = 0
            self.nextButtonTrailingConstraint.constant = 20
            self.view.layoutIfNeeded()
        })
    }

fileprivate func setupOnLoad() {
    slides = createSlides()
    slideIphoneImageResourceNames = ["iphone-1", "iphone-2"]
    
    setupSlideScrollView(slides: slides)
    setupIphoneSlides()
    
    pageControl.numberOfPages = slides.count
    pageControl.currentPage = 0
}


fileprivate func setupSlideScrollView(slides : [OnboardingSlide]) {
    scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: scrollView.frame.height)
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.showsVerticalScrollIndicator = false
    scrollView.isPagingEnabled = true
    scrollView.bounces = false
    scrollView.backgroundColor = .greyBackground()
    
    for i in 0 ..< slides.count {
        slides[i].frame = CGRect(x: self.view.frame.width * CGFloat(i), y: 0, width: self.view.frame.width, height: scrollView.frame.height)
        slides[i].mainImageView.clipsToBounds = true
        scrollView.addSubview(slides[i])
        print(slides[i].frame)
    }
    
    scrollView.delegate = self
}

fileprivate func createSlides() -> [OnboardingSlide] {
    
    let slide1 = OnboardingSlide.createSlide(#imageLiteral(resourceName: "pages") , title: "Find games", desc: "Search to find your favorite games and explore.")
    
    let slide2 = OnboardingSlide.createSlide(#imageLiteral(resourceName: "pages") , title: "More Details", desc: "Check out which games have the awesome features on the go.")
    if #available(iOS 13.0, *) {
        slide2.backgroundColor = UIColor.greyBackground()
    } else {
        // Fallback on earlier versions
        slide2.backgroundColor = UIColor.clear
    }
    
    return [slide1, slide2]
}

fileprivate func setupIphoneSlides() {
    iphoneScrollView.contentSize = CGSize(width: iphoneScrollView.frame.width, height: iphoneScrollView.frame.height * CGFloat(slides.count))
    iphoneScrollView.showsVerticalScrollIndicator = false
    iphoneScrollView.showsHorizontalScrollIndicator = false
    iphoneScrollView.isPagingEnabled = true
    iphoneScrollView.bounces = true
    iphoneScrollView.backgroundColor = .clear
    
    var iphoneSlideIvs: [UIImageView] = []
    for i in 0..<slideIphoneImageResourceNames.count {
        iphoneSlideIvs.append(createIphoneSlide(imageResourceName: slideIphoneImageResourceNames[i]))
        iphoneSlideIvs[i].frame = CGRect(x: 0, y: iphoneScrollView.frame.height * CGFloat(i), width: iphoneScrollView.frame.width, height: iphoneScrollView.frame.height)
        iphoneSlideIvs[i].contentMode = .scaleAspectFit
        iphoneScrollView.addSubview(iphoneSlideIvs[i])
    }
}

fileprivate func createIphoneSlide(imageResourceName: String) -> UIImageView {
    let iv = UIImageView()
    iv.image = UIImage(imageLiteralResourceName: imageResourceName)
    iv.contentMode = .scaleToFill
    return iv
}


@IBAction func nextButtonTapped(_ sender: UIButton) {
    
    if !isShowingFullSlide() {
        return
    }
    if currentSlideIndex == slides.count-1  {
        performSegue(withIdentifier: SearchViewController.STORYBOARD_ID, sender: nil)
        return
    }
    
    //goes to next slide
    let contentOffset = CGPoint(x: self.view.frame.width * CGFloat(currentSlideIndex+1), y: scrollView.contentOffset.y)
    scrollView.setContentOffset(contentOffset, animated: true)
}

@IBAction func skipButtonTapped(_ sender: Any) {
    
    
}


@IBAction func getStartedButtonTapped(_ sender: Any) {
    
}

}

extension OnBoardingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentHorizontalOffset = scrollView.contentOffset.x
        currentPercentHorizontalOffset = currentHorizontalOffset/view.frame.width
        
        currentSlideIndex = Int(currentPercentHorizontalOffset)
        pageControl.currentPage = currentSlideIndex
        
        if currentSlideIndex == slides.count-1 {
            skipButton.isHidden = true
        }
        else {
            nextButton.isHidden = false
            skipButton.isHidden = false
        }
        
        let iphonePercentVerticalOffset = currentPercentHorizontalOffset
        iphoneScrollView.contentOffset.y = iphonePercentVerticalOffset * iphoneScrollView.frame.height
        
    }
    
    func isShowingFullSlide()-> Bool {
        return currentPercentHorizontalOffset.truncatingRemainder(dividingBy: 1) == 0
    }
}


