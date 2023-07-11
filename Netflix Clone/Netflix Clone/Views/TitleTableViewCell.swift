//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by Caio Chaves on 11.07.23.
//

import UIKit
import SDWebImage

class TitleTableViewCell: UITableViewCell {
    
    //MARK: Proprieties
    static let identifier = "TitleTableViewCell"
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private var playButton: UIButton = {
        let image = UIImage(systemName: "play.circle")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 25))
        
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private var posterImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    //MARK: Page lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        //Adding subviews
        contentView.addSubview(posterImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playButton)
        
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        NSLayoutConstraint.activate([
            //Poster image
            posterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            posterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            posterImage.widthAnchor.constraint(equalToConstant: 100),
            
            //Title label
            titleLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -65),
            
            //Play button
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
            
        ])
    }
    
    public func configure(with model: TitleViewModel) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else { return }

        posterImage.sd_setImage(with: url)
        titleLabel.text = model.titleName
        
    }
    
}
