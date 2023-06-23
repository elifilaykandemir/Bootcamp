//
//  ViewController.swift
//  QuotesOfFamousPeople
//
//  Created by Elif İlay KANDEMİR on 23.06.2023.
//

import UIKit

class Screen2ViewController: UIViewController {
    
    let vc = Screen1ViewController()
   
    private lazy var authorName: UILabel = {
        let label = UILabel()
        label.text = vc.author
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    private lazy var authorText: UILabel = {
        let label = UILabel()
        label.text = vc.text
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    private lazy var authorView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = controlImage(vc.gender)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var textFrameView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cerceve")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var bringBackButton:UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Yeniden Getir", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "AppBlue")?.cgColor
        button.backgroundColor = UIColor(named: "AppBlue")
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage:(UIImage(named: "zemin")!))
        addSubview()
        bringBackButton.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        
    }
    
    @objc func didTappedButton(){
        vc.generateQuotes()
        authorView.image = controlImage(vc.gender)
        authorName.text = vc.author
        authorText.text = vc.text
        
   }
    
    private func controlImage(_ gender:Quote.Gender) -> UIImage? {
        print("****\(gender)")
        switch gender {
        case .female:
            return UIImage(named:"kadin")
        case .male:
            return UIImage(named:"erkek")
        case .none:
            return UIImage(named:"unknown")
        default:
            return nil
        }
    }
    
    private func addSubview(){
        view.addSubview(authorView)
        view.addSubview(authorName)
        view.addSubview(textFrameView)
        view.addSubview(bringBackButton)
        textFrameView.addSubview(authorText)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let buttonSize = view.frame.width / 2
        let imageSize = view.frame.width / 3
        authorView.frame = CGRect(x: imageSize, y: 20, width: view.frame.width/3, height: view.width / 2)
        authorName.frame = CGRect(x: 100, y: authorView.bottom + 20, width: view.frame.width / 2, height: 30)
        textFrameView.frame = CGRect(x: 10, y: view.height / 2 - 100, width: view.width - 20, height: view.height / 3)
        authorText.frame = CGRect(x: 70, y: 100, width: textFrameView.frame.width - 140, height: 100)
        bringBackButton.frame = CGRect(x:100 , y: textFrameView.bottom + 100, width: buttonSize, height: 40)
    }

}
