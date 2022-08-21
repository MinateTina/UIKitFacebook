//
//  MainController.swift
//  UIKitFacebook
//
//  Created by Minate on 8/20/22.
//

import UIKit
import LBTATools

class PostCell: LBTAListCell<String> {
    
    let imageView = UIImageView(backgroundColor: .red)
    let nameLabel = UILabel(text: "Name Label")
    let dateLabel = UILabel(text: "Friday at 11:11AM")
    let postTextLabel = UILabel(text: "Here is my post text")
    
//    let imageViewGrid = UIImageView(backgroundColor: .yellow)
    
    let photoGridController = PhotosGridController()
    
    
    override func setupViews() {
        backgroundColor = .white
        //Very convenient tools equivalent to HStack and VStack from SwiftUI
        stack(hstack(imageView.withHeight(40).withWidth(40),
                     stack(nameLabel, dateLabel), spacing: 8)
                .padLeft(12).padRight(12).padTop(12),
              postTextLabel, photoGridController.view, spacing: 8)
    }
}



class MainController: LBTAListController<PostCell, String>, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        
        self.items = ["Hello", "World","how","it"]
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 400)
    }
}



import SwiftUI

struct MainPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return MainController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
    
}
