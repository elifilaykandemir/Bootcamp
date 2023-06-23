//
//  Screen4ViewController.swift
//  GuessingNumberGame
//
//  Created by Elif İlay KANDEMİR on 22.06.2023.
//

import UIKit

class Screen5ViewController: UIViewController {

       var count: Int = 0
       var sumLife : Int = 5
    
       private lazy var pageImageView = CustomImageView(pageImage: "basarisiz")

       private lazy var pageButton = CustomButton(title: "TEKRAR OYNA",
                                                  color: "AppBlue",
                                                  fontSize: 20,
                                                  fontName: "AppleGothic",titlecolor: .black)
       
       private lazy var pageTitle = Label(labelText: "KAYBETTİN!",
                                          labelFontNamed: "AppleGothic",
                                          labelFontSize: 40,
                                          labelTextColor: .red)
    
       private lazy var pageMessage = Label(labelText: "Tüm Haklarını Tamamladın.\nDoğru Tahmin \(LaunchScreenViewController.generatedNumber)",
                                            labelFontNamed: "AppleGothic",
                                            labelFontSize: 20,
                                            labelNumberOfLines:2,
                                            labelTextColor: .black)
       
       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .white
           addSubviews()
           pageButton.addTarget(self, action: #selector(didTappedReplayButton), for: .touchUpInside)
       }
       
       private func addSubviews(){
           view.addSubview(pageMessage)
           view.addSubview(pageTitle)
           view.addSubview(pageButton)
           view.addSubview(pageImageView)
       }
       
       
       @objc func didTappedReplayButton(){
           print("Button tapped")
           let rootVC = LaunchScreenViewController()
           rootVC.modalPresentationStyle = .fullScreen
           present(rootVC, animated: true)
       }
       
       override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           let imageSize: CGFloat = view.width
           
           pageImageView.frame = CGRect(
               x: imageSize / 4,
               y: view.safeAreaInsets.top + 50,
               width: imageSize / 2,
               height: imageSize / 2)
           pageTitle.frame = CGRect(x: 20, y: pageImageView.bottom + 100, width: view.width-50, height: 40)
           
           pageMessage.frame = CGRect(x: 10, y: pageTitle.bottom + 50, width:view.width , height: 50)
           
           pageButton.frame = CGRect(x: imageSize / 4, y: pageMessage.bottom + 30, width: view.width/2, height: 50)
       
       }

}
