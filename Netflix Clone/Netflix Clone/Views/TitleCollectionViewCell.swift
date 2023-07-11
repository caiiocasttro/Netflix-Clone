//
//  TitleCollectionViewCell.swift
//  Netflix Clone
//
//  Created by Caio Chaves on 11.07.23.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    private lazy var posterImage: UIImageView = {
        let poster = UIImageView()
        poster.contentMode = .scaleAspectFill
        return poster
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(posterImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImage.frame = contentView.bounds
    }
    
    public func configure(with model: String) {
//        print(model)
        
        
         guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else { return }
         posterImage.sd_setImage(with: url, completed: nil)
         
    }
}
