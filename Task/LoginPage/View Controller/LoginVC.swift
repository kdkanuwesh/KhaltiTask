//
//  LoginVC.swift
//  Task
//
//  Created by Anuwesh Khadka on 20/02/2023.
//

import UIKit
import LocalAuthentication

class LoginVC: UIViewController {
    
    // Mark: - Constant and varibles
    
    // Mark: - Initialization
    lazy var nav: UINavigationController = {
        
        let nav = UINavigationController()
        
        return nav
        
    }()
    
    
    lazy var mainView: UIView = {
        
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .clear
        
        return view
        
    }()
    
    lazy var ScrollView: UIScrollView = {
        
        let ScrollView = UIScrollView()
        
        ScrollView.isScrollEnabled = true
        
        ScrollView.backgroundColor = .clear
        
        ScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return ScrollView
        
    }()
    
    lazy var imgLogo: UIImageView = {
        
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.contentMode = .scaleAspectFill
        
        image.clipsToBounds = true
        
        image.image = UIImage(named: "Logo")
        
        return image
        
    }()
    
    lazy var lblLogin: UILabel = {
        
        let lblLogin = UILabel()
        
        lblLogin.translatesAutoresizingMaskIntoConstraints = false
        
        lblLogin.numberOfLines = 1
        
        lblLogin.text = "Login Account"
        
        lblLogin.textColor = .white
        
        lblLogin.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        
        return lblLogin
        
    }()
    
    lazy var bgImageView: UIImageView = {
        
        var bgImageView = UIImageView(image: UIImage(named: "task.image.bg"))
        
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        
        bgImageView.contentMode = .scaleAspectFill
        
        bgImageView.clipsToBounds = true
        
        return bgImageView
        
    }()
    
    
    
    lazy var txtEmail: UITextField = {
        
        let txtEmail = UITextField()
        
        txtEmail.translatesAutoresizingMaskIntoConstraints = false
        
        txtEmail.backgroundColor = .black.withAlphaComponent(0.3)
        
        txtEmail.layer.cornerRadius = 15
        
        txtEmail.keyboardType = .emailAddress
        
        txtEmail.autocorrectionType = .no
        
        txtEmail.autocapitalizationType = .none
        
        txtEmail.attributedPlaceholder = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        txtEmail.textColor = .white
        
        txtEmail.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txtEmail.frame.height))
        
        txtEmail.leftViewMode = .always
        
        return txtEmail
        
    }()
    
    lazy var txtPassword: UITextField = {
        
        let txtPassword = UITextField()
        
        txtPassword.translatesAutoresizingMaskIntoConstraints = false
        
        txtPassword.isSecureTextEntry = true
        
        txtPassword.enablePasswordToggle()
        
        txtPassword.backgroundColor = .black.withAlphaComponent(0.3)
        
        txtPassword.layer.cornerRadius = 15
        
        txtPassword.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        txtPassword.textColor = .white
        
        txtPassword.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txtPassword.frame.height))
        
        txtPassword.leftViewMode = .always
        
        return txtPassword
        
    }()
    
    lazy var stackView: UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        
        stackView.distribution = .fill
        
        stackView.alignment = .fill
        
        stackView.spacing = 16.0
        
        stackView.addArrangedSubview(txtEmail)
        
        stackView.addArrangedSubview(txtPassword)
        
        stackView.addArrangedSubview(btnLogin)
        
        return stackView
        
    }()
    
    lazy var btnLogin: UIButton = {
        
        let btnLogin = UIButton()
        
        btnLogin.translatesAutoresizingMaskIntoConstraints = false
        
        btnLogin.backgroundColor = Colors.primary.getColors().withAlphaComponent(0.8)
        
        btnLogin.layer.cornerRadius = 15
        
        btnLogin.setTitle("LOG IN", for: .normal)
        
        btnLogin.addTarget(self, action: #selector(didTapButtonLogin), for: .touchUpInside)
        
        return btnLogin
    }()
    
    lazy var btnAuth: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = Colors.primary.getColors().withAlphaComponent(0.8)
        
        button.layer.cornerRadius = 15
        
        button.addTarget(self, action: #selector(didTapButtonAuth), for: .touchUpInside)
        
        return button
    }()
    
    lazy var btnstackView: UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        
        stackView.distribution = .fill
        
        stackView.alignment = .fill
        
        stackView.spacing = 16.0
        
        stackView.addArrangedSubview(btnLogin)
        
        stackView.addArrangedSubview(btnAuth)
        
        return stackView
        
    }()
    
    lazy var blurView: UIVisualEffectView = {
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemThinMaterialDark)
        
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.alpha = 0.8
        
        blurView.clipsToBounds = true
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        return blurView
    }()
    
    
    lazy var lblDontHaveAcc: UILabel = {
        
        let lblDontHaveAcc = UILabel()
        
        lblDontHaveAcc.translatesAutoresizingMaskIntoConstraints = false
        
        lblDontHaveAcc.numberOfLines = 1
        
        lblDontHaveAcc.text = "DONT HAVE AN ACCOUNT?"
        
        lblDontHaveAcc.textColor = .white
        
        lblDontHaveAcc.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        
        return lblDontHaveAcc
    }()
    
    lazy var btnSignUp: UIButton = {
        
        let btnSignUp = UIButton()
        
        btnSignUp.translatesAutoresizingMaskIntoConstraints = false
        
        btnSignUp.setTitleColor(.white, for: .normal)
        
        btnSignUp.setTitle("SIGN UP", for: .normal)
        
        btnSignUp.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        //        btnSignUp.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        //        btnSignUp.layer.borderWidth = 0.0
        
        return btnSignUp
    }()
    
    lazy var stackViewSignUP: UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        
        stackView.alignment = .fill
        
        stackView.spacing = 4
        
        stackView.addArrangedSubview(lblDontHaveAcc)
        
        stackView.addArrangedSubview(btnSignUp)
        
        
        return stackView
        
    }()
    
    
    
    
    
    // Mark: - View Controller Function
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupLayout()
        
    }
    
    override func viewWillLayoutSubviews() {
        
        DispatchQueue.main.async {
            
            self.blurView.layer.cornerRadius = 24
            
        }
    }
    
    @objc func didTapButtonLogin () {
        
        let tabBarVC = TabbarVC()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let window = appDelegate.window
        
        window?.rootViewController = UINavigationController(rootViewController: tabBarVC)
        
        window?.makeKeyAndVisible()
        
    }
    
    @objc func didTapButtonAuth () {
        
        let context = LAContext()
        
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "Please authorize with touh id!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [weak self] success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                       (email: UserDefaultManager.shared.email , password: UserDefaultManager.shared.password)
                       
                    } else {
                        let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified. Please try again.", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self?.present(ac, animated: true)
                        
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Biometry unavailable", message: "Your device is not configured for biometric authentication.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
}




extension LoginVC {


    func setupLayout() {

        autoLayoutForbgImage()

        autoLayoutForScrollView()

        autoLayoutForMainView()

        autoLayoutBlurView()
        
        autoLayoutForimgLogo()

        autoLayoutForLabel()

        autoLayoutForstackView()
        
        autoLayoutBtnstackView()

        autoLayoutForstackViewSignUp()

//        autoLayoutForlblDontHaveAcc()
        
//        configureView()
        
        setupBiometrics()
        
        

    }

    //Mark: - AutoLayout

    func autoLayoutForScrollView() {

        view.addSubview(ScrollView)

        NSLayoutConstraint.activate([

            ScrollView.topAnchor.constraint(equalTo: view.topAnchor),

            ScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),

            ScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            ScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }

    func autoLayoutForMainView() {

        ScrollView.addSubview(mainView)

        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: ScrollView.topAnchor),

            mainView.leadingAnchor.constraint(equalTo: ScrollView.leadingAnchor),

            mainView.trailingAnchor.constraint(equalTo: ScrollView.trailingAnchor),

            mainView.bottomAnchor.constraint(equalTo: ScrollView.bottomAnchor),

            mainView.widthAnchor.constraint(equalTo: ScrollView.widthAnchor),

        ])
    }


    func autoLayoutForbgImage() {

        view.addSubview(bgImageView)

        NSLayoutConstraint.activate([

            bgImageView.topAnchor.constraint(equalTo: view.topAnchor),

            bgImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),

            bgImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            bgImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
    }

    func autoLayoutBlurView() {

        mainView.addSubview(blurView)

        NSLayoutConstraint.activate([

            blurView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 120),

            blurView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),

            blurView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),

            blurView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.9),

            blurView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.95)

        ])

    }
    
    func autoLayoutForimgLogo() {

        mainView.addSubview(imgLogo)
        
        let safeLayout = mainView.layoutMarginsGuide

        NSLayoutConstraint.activate([

            imgLogo.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 56),
            
            imgLogo.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),

            imgLogo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),

            imgLogo.widthAnchor.constraint(equalTo: imgLogo.heightAnchor),

        ])
    }

    func autoLayoutForLabel() {

        mainView.addSubview(lblLogin)

        NSLayoutConstraint.activate([

            lblLogin.topAnchor.constraint(equalTo: imgLogo.bottomAnchor, constant: 16),

            lblLogin.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 27),

        ])
    }

    func autoLayoutForstackView() {

        mainView.addSubview(stackView)

        NSLayoutConstraint.activate([

            stackView.topAnchor.constraint(equalTo: lblLogin.bottomAnchor, constant: 56),

            stackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 27),

            stackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -27),

            txtEmail.heightAnchor.constraint(equalToConstant: 63),

            txtPassword.heightAnchor.constraint(equalToConstant: 63),

            btnLogin.heightAnchor.constraint(equalToConstant: 63),


        ])
    }
    
    func autoLayoutBtnstackView() {
        
        mainView.addSubview(btnstackView)
        
        NSLayoutConstraint.activate([
        
            btnstackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            
            btnstackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 27),
            
            btnstackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -27),
            
            btnLogin.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2),
            
            btnAuth.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2),

            btnAuth.widthAnchor.constraint(equalTo: btnAuth.heightAnchor)
        ])
        
      
    }



    func autoLayoutForstackViewSignUp() {

        mainView.addSubview(stackViewSignUP)

        NSLayoutConstraint.activate([

            stackViewSignUP.topAnchor.constraint(equalTo: btnstackView.bottomAnchor, constant: 20),

            stackViewSignUP.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -8),

            stackViewSignUP.centerXAnchor.constraint(equalTo: btnstackView.centerXAnchor),


        ])
    }
    
//    func configureView() {
//        txtEmail.delegate = self
//        txtPassword.delegate = self
//    }
//
    func setupBiometrics(){
        if UserDefaultManager.shared.isBiometricsEmabled{
            btnAuth.isHidden = false
        }else{
            btnAuth.isHidden = true
        }
        
        let biometrics = BiometricAuthentication.supportedBiometricType()
        
        switch biometrics {
        case .none:
            print("No ID")
            break
        case .touchId:
            btnAuth.setImage(UIImage(systemName:"touchid"), for: .normal)
            break
        case .faceId:
            btnAuth.setImage(UIImage(systemName:"faceid"), for: .normal)
            break
        }
    }
}

