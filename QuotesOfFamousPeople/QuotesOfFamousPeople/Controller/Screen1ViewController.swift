//
//  Screen1ViewController.swift
//  QuotesOfFamousPeople
//
//  Created by Elif İlay KANDEMİR on 23.06.2023.
//

import UIKit

class Screen1ViewController: UIViewController {

    var text : String = ""
    var author : String = ""
    var gender : Quote.Gender = .female
    
    init(){
        super.init(nibName: nil, bundle: nil)
        self.generateQuotes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "giris")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let loginButton:UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Giriş Yap", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "AppPink")?.cgColor
        button.backgroundColor = UIColor(named: "AppPink")
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage:(UIImage(named: "zemin")!))
        addSubview()
        generateQuotes()
        loginButton.addTarget(self, action: #selector(didTappedLoginButton), for: .touchUpInside)
        
    }
    
    func generateQuotes(){
        
        if let randomQuote = QuoteManager.getRandomQuote() {
            self.text = randomQuote.text
            self.author = randomQuote.author
            self.gender = randomQuote.gender
            
            // Do something with the random quote
            print("Random Quote: \(self.text)")
            print("Author: \(self.author)")
            print("Gender: \(self.gender)")
        } else {
            print("No quotes available.")
        }
    }
    
    @objc func didTappedLoginButton(){
        let vc = Screen2ViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
    private func addSubview(){
        view.addSubview(imageView)
        view.addSubview(loginButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let buttonSize = view.frame.width / 3
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 100)
        loginButton.frame = CGRect(x:buttonSize , y: imageView.bottom + 10, width: buttonSize, height: 40)
    }

}
