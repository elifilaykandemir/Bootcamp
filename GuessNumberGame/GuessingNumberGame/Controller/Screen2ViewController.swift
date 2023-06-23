//
//  Screen2ViewController.swift
//  GuessingNumberGame
//
//  Created by Elif İlay KANDEMİR on 22.06.2023.
//

import UIKit

class Screen2ViewController: UIViewController,UITextFieldDelegate {
    
    var generatedNumber = LaunchScreenViewController.generatedNumber
    var remainingRight : Int = 5
    var predictNumber : Int = 0

    let vc1 = Screen4ViewController()
    
    private lazy var pageImageView = CustomImageView(pageImage: "giris")

    private lazy var pageButton = CustomButton(title: "TAHMIN ET",
                                               color: "AppBlue",
                                               fontSize: 20,
                                               fontName: "AppleGothic",
                                               titlecolor: .black)
    
    private lazy var pageTitle = Label(labelText: "Tahmin İçin Bir Sayı Yaz",
                                       labelFontNamed: "AppleGothic",
                                       labelFontSize: 20,
                                       labelTextColor: .black)
    
    private lazy var countTitle = Label(labelText: "HAK: \(remainingRight)",
                                        labelFontNamed: "AppleGothic",
                                        labelFontSize: 15,
                                        labelTextColor: .black)
    
    private lazy var pageTextField = CustomTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        pageTextField.delegate = self
        hideKeyboardWhenTappedAround()
        addSubviews()
        pageButton.addTarget(self, action: #selector(didTappedPredictButton), for: .touchUpInside)
    }
    
    func controlPredictNumber() {
        
        guard let numberText = pageTextField.text, let enteredNumber = Int(numberText) else {
            let actionSheet = UIAlertController(title: "Uyarı",
                                                message: "Lütfen geçerli bir giriş yapınız...",
                                                preferredStyle: .actionSheet)
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(actionSheet, animated: true)
            return
        }
        
        switch enteredNumber {
        case let x where x > 100:
            let actionSheet = UIAlertController(title: "Uyarı",
                                                message: "Girdiğiniz Sayı 0 ile 100 aralığında olmalıdır",
                                                preferredStyle: .actionSheet)
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(actionSheet, animated: true)
            
        case let x where x == generatedNumber && remainingRight > 0:
            let rootVC = Screen4ViewController()
            rootVC.count = remainingRight
            rootVC.modalPresentationStyle = .fullScreen
            present(rootVC, animated: true)
        case let x where (x < generatedNumber || x > generatedNumber) && remainingRight > 0:
           
            var status = ""
            if x < generatedNumber{
                status = "ARTIR"
            }else{
                status = "AZALT"
            }
            let rootVC = Screen3ViewController(status: status)
            rootVC.count = remainingRight - 1
            rootVC.modalPresentationStyle = .fullScreen
            present(rootVC, animated: true)
        
        default:
            print("Hatalı durum oluştu")
        }
    }

    
    private func addSubviews(){
        view.addSubview(countTitle)
        view.addSubview(pageTextField)
        view.addSubview(pageTitle)
        view.addSubview(pageButton)
        view.addSubview(pageImageView)
    }
    
    
    @objc func didTappedPredictButton(){
        controlPredictNumber()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let imageSize: CGFloat = view.width
        
        pageImageView.frame = CGRect(
            x: imageSize / 4,
            y: view.safeAreaInsets.top + 50,
            width: imageSize / 2,
            height: imageSize / 2)
        pageTitle.frame = CGRect(x: 20, y: pageImageView.bottom + 100, width: view.width-50, height: 30)
        pageTextField.frame = CGRect(x: 20, y: Int(pageTitle.bottom) + 20, width:Int(view.width) - 50 , height: 50)
        pageButton.frame = CGRect(x: imageSize / 4, y: pageTextField.bottom + 30, width: view.width/2, height: 50)
        countTitle.frame = CGRect(x: 5, y: Int(view.bottom) - 100, width:80 , height: 50)
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == pageTextField {
            pageTextField.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        return true
    }
    
}

extension Screen2ViewController{

    
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        pageTextField.text = ""
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
}
