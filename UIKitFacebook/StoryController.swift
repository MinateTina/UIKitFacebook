//
//  StoryController.swift
//  UIKitFacebook
//
//  Created by Minate on 8/21/22.
//

import UIKit
import SwiftUI
import LBTATools


class StoryHeader: UICollectionReusableView {
    
    let storyController = StoryController(scrollDirection: .horizontal)

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        
        stack(storyController.view)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

class StoryPhotoCell: LBTAListCell<String> {
    
    override var item: String! {
        didSet {
            imageView.image = UIImage(named: item)
        }
    }
    
    let imageView = UIImageView(image: nil, contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Jenny Kim", font: .boldSystemFont(ofSize: 14), textColor: .white)
    
    
    
    override func setupViews() {
//        backgroundColor = .red
        imageView.layer.cornerRadius = 10
        
        stack(imageView)
        
        setupGradientLayer()
        
        //VStack UIView() on top of nameLabel as Spacer()
        //Margins same as padding()
        stack(UIView(), nameLabel).withMargins(.allSides(8))
    }
    
    let gradientLayer = CAGradientLayer()
    
    fileprivate func setupGradientLayer() {
       
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.7, 1]
//        layer.cornerRadius = 10
//        clipsToBounds = true
        
        layer.addSublayer(gradientLayer)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}


class StoryController: LBTAListController<StoryPhotoCell, String>, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: view.frame.height - 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 12, bottom: 0, right: 12)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = ["jenny1", "jenny2", "jenny3","jenny1", "jenny2", "jenny3"]
    }
    
}
