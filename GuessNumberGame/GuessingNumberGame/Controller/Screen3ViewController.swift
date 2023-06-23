import UIKit

class Screen3ViewController: UIViewController,UITextFieldDelegate {
    
    var status = ""
    var count = 0
    
    let vc = Screen2ViewController()
    
    init(status: String = "") {
        self.status = status
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    private lazy var message = Label(labelText: status,
                                     labelFontNamed: "AppleGothic",
                                     labelFontSize: 40,
                                     labelTextColor: .red)
    
    private lazy var pageImageView = CustomImageView(pageImage: "yanlis")

    private lazy var pageButton = CustomButton(title: "TAHMIN ET",
                                               color: "AppBlue",
                                               fontSize: 20,
                                               fontName: "AppleGothic",
                                               titlecolor: .black)
    
    private lazy var pageTitle = Label(labelText: "Tahmin İçin Yeni Sayı Yaz",
                                       labelFontNamed: "AppleGothic",
                                       labelFontSize: 20,
                                       labelTextColor: .black)
    
    private lazy var countTitle = Label(labelText: "HAK: \(count)",
                                        labelFontNamed: "AppleGothic",
                                        labelFontSize: 15,
                                        labelTextColor: .black)
    
    private lazy var pageTextField = CustomTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        hideKeyboardWhenTappedAround()
        addSubviews()
        pageButton.addTarget(self, action: #selector(didTappedReplayButton), for: .touchUpInside)
    }
  
    private func addSubviews(){
        view.addSubview(countTitle)
        view.addSubview(pageTextField)
        view.addSubview(pageTitle)
        view.addSubview(pageButton)
        view.addSubview(pageImageView)
        view.addSubview(message)
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
            
        case let x where x == LaunchScreenViewController.generatedNumber && count > 0:
            print(vc.remainingRight)
           
            let rootVC = Screen4ViewController()
            rootVC.count = count
            rootVC.modalPresentationStyle = .fullScreen
            present(rootVC, animated: true)
        case let x where (x < LaunchScreenViewController.generatedNumber || x > LaunchScreenViewController.generatedNumber) && count > 0:
           
            var status = ""
            if x < LaunchScreenViewController.generatedNumber{
                status = "ARTIR"
                message.text = status
                countTitle.text = "HAK: \(count)"
                
            }else{
                status = "AZALT"
                countTitle.text = "HAK: \(count)"
                message.text = status
            }
        case _ where count == 0:
            let rootVC = Screen5ViewController()
            rootVC.modalPresentationStyle = .fullScreen
            present(rootVC, animated: true)
        
        default:
            print("Hatalı durum oluştu")
        }
    }
    
    @objc func didTappedReplayButton(){
        print("Replay Button tapped")
        count -= 1
        controlPredictNumber()
        pageTextField.text = ""
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
        pageButton.frame = CGRect(x: imageSize / 4, y: pageTextField.bottom + 50, width: view.width/2, height: 50)
        countTitle.frame = CGRect(x: 5, y: Int(view.bottom) - 100, width:80 , height: 50)
        message.frame = CGRect(x: 20, y: pageImageView.bottom + 50, width: view.width-50, height: 40)
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

extension Screen3ViewController{
    
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

