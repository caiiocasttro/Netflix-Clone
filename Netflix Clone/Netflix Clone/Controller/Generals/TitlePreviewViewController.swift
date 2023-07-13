//
//  TitlePreviewViewController.swift
//  Netflix Clone
//
//  Created by Caio Chaves on 11.07.23.
// 

import UIKit
import WebKit



class TitlePreviewViewController: UIViewController {
    
    //MARK: Proprieties
    private var webView: WKWebView = {
        let view = WKWebView()
        return view
    }()
    
    private var movieLabel: UILabel = {
        let label = UILabel()
        label.text = "Beyoncé"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private var movieDescription: UILabel = {
        let label = UILabel()
        label.text = "Everybody should watch the new concert"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private var downloadButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    //MARK: Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        view.backgroundColor = .systemBackground
        
        //Adding subviews
        view.addSubview(webView)
        view.addSubview(movieLabel)
        view.addSubview(movieDescription)
        view.addSubview(downloadButton)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        movieLabel.translatesAutoresizingMaskIntoConstraints = false
        movieDescription.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Adding constraints
        NSLayoutConstraint.activate([
        
            //Web View
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 250),
            
            //Movie label
            movieLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            movieLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //Movie description
            movieDescription.topAnchor.constraint(equalTo: movieLabel.bottomAnchor, constant: 20),
            movieDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            //Download button
            downloadButton.topAnchor.constraint(equalTo: movieDescription.bottomAnchor, constant: 20),
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 140)
            
        
        ])
    }
    
    func configure(with model: TitlePreviewViewModel) {
        movieLabel.text = model.title
        movieDescription.text = model.titleOverview
        
        guard let url = URL(string: "https://youtube.com/embed/\(model.youtubeView.id.videoId)") else { return }
        
        webView.load(URLRequest(url: url))
    }
    
}
