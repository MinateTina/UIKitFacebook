//
//  PhotosGridController.swift
//  UIKitFacebook
//
//  Created by Minate on 8/20/22.
//

import UIKit
import SwiftUI
import LBTATools


class PhotoGridCell: LBTAListCell<String> {
    
    override var item: String! {
        didSet {
            imageView.image = UIImage(named: item)
        }
    }
    
    let imageView = UIImageView(image: UIImage(named: "jenny1"), contentMode: .scaleAspectFill)
    
    override func setupViews() {
        backgroundColor = .yellow
//        addSubview(imageView)
//        imageView.fillSuperview()
        stack(imageView)
    }
}

class PhotosGridController: LBTAListController<PhotoGridCell,String>, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .lightGray
        self.items = ["jenny1","jenny2","jenny3", "jenny1","jenny2"]
    }
    
    let cellSpacing: CGFloat = 4
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 || indexPath.item == 1 {
            let width = (view.frame.width - 3 * cellSpacing) / 2
            
            return .init(width: width, height: width)
            
            
        }
        
        let width = (view.frame.width - 4.1 * cellSpacing) / 3
        
        return .init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
    }
    
}

struct PhotosGridPreview: PreviewProvider {
    
    static var previews: some View {
//        Text("Grid Preview")
        ContainerView()
    }
    
    struct ContainerView: UIViewControllerRepresentable {
            
        func makeUIViewController(context: Context) -> some UIViewController {
            return PhotosGridController()
        }
            
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
                
        }
            
    }
    
    
}
