//
//  ViewController.swift
//  GuessingNumberGame
//
//  Created by Elif İlay KANDEMİR on 20.06.2023.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    static var generatedNumber : Int = 0
    
    private lazy var pageTitle = Label(labelText: "SAYI TAHMİN OYUNU", labelFontNamed: "AppleGothic", labelFontSize: 25,labelTextColor: .red)
    
    private lazy var pageButton = CustomButton(title: "BAŞLAT", color: "AppBlue", fontSize: 20, fontName: "AppleGothic",titlecolor: .white)
    
    private lazy var pageImageView = CustomImageView(pageImage: "giris")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        Self.generatedNumber = generateNumber()
        pageButton.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
    }
    
    private func addSubviews(){
        view.addSubview(pageTitle)
        view.addSubview(pageButton)
        view.addSubview(pageImageView)
    }
    
    @objc func didTappedButton(){
        print("Button tapped")
        let rootVC = Screen2ViewController()
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true)
    }
    
    func generateNumber() -> Int {
        let randomNumberGenerator = NumberGenerator(lowerBound: 1, upperBound: 100)
        let randomNum = randomNumberGenerator.generateRandomNumber()
        print(randomNum)
        return randomNum
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let imageSize: CGFloat = view.width
        
        pageImageView.frame = CGRect(
            x: imageSize / 4,
            y: view.safeAreaInsets.top + 50,
            width: imageSize / 2,
            height: imageSize / 2)
        pageTitle.frame = CGRect(x: 20, y: pageImageView.bottom + 100, width: view.width-50, height: 50)
        pageButton.frame = CGRect(x: imageSize / 4, y: pageTitle.bottom + 100, width: view.width/2, height: 50)
    
    }
    


}

