//
//  HeaderHeroUIView.swift
//  Netflix Clone
//
//  Created by Caio Chaves on 10.07.23.
//

import UIKit

class HeaderHeroUIView: UIView {
    
    //MARK: Proprieties
    private lazy var imageHeader: UIImageView = {
        let image = UIImageView()
        image.frame = .init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        image.image = UIImage(named: "dune")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.systemBackground.cgColor]
        gradient.frame = bounds
        return gradient
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    //MARK: Page lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        //Adding subviews
        addSubview(imageHeader)
        layer.addSublayer(gradient)
        addSubview(playButton)
        addSubview(downloadButton)
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        NSLayoutConstraint.activate([
            //Play button
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            playButton.widthAnchor.constraint(equalToConstant: 120),
            
            //Download button
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            downloadButton.widthAnchor.constraint(equalToConstant: 120)
        ])
        
    }
    
}
