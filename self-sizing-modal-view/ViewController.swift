//
//  ViewController.swift
//  self-sizing-modal-view
//
//  Created by Turker Nessa on 11/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var gradientLayer: CAGradientLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureBackgroundView()
        configureButtons()
    }
    
    private func configureBackgroundView() {
        //lilac color: 230,215,255
        //self.view backgroundColor = UIColor(red: (230/255), green: (215/255), blue: 1, alpha: 1)
        //points
        gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = .init(x: 0, y: 0)
        gradientLayer.endPoint = .init(x: 1, y: 1)
        
        //colors
        let startColor = CGColor(red: (235/255), green: (122/255), blue: (59/255), alpha: 1)
        let endColor = CGColor(red: (45/255), green: (117/255), blue: (236/255), alpha: 1)
        gradientLayer.colors = [startColor, endColor]
        
        //locations
        gradientLayer.locations = [0.0, 1.0]
        
        self.view.layer.addSublayer(gradientLayer)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradientLayer.frame = view.bounds
    }

    private func configureButtons() {
        let buttonStack = UIStackView()
        buttonStack.axis = .vertical
        buttonStack.spacing = 16
        buttonStack.alignment = .center
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(buttonStack)
        
        NSLayoutConstraint.activate([
            buttonStack.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            buttonStack.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
        ])
        
        
        let buttonWithShortText = UIButton(configuration: UIButton.Configuration.filled())
        buttonWithShortText.tag = 0
        buttonWithShortText.setTitle("Open modal with short text", for: .normal)
        buttonWithShortText.addTarget(self, action: #selector(didClickOn(_:)), for: .touchUpInside)
        buttonStack.addArrangedSubview(buttonWithShortText)
        
        let buttonWithLongText = UIButton(configuration: UIButton.Configuration.filled())
        buttonWithLongText.tag = 1
        buttonWithLongText.setTitle("Open modal with long text", for: .normal)
        buttonWithLongText.addTarget(self, action: #selector(didClickOn(_:)), for: .touchUpInside)
        buttonStack.addArrangedSubview(buttonWithLongText)
    }
    
    @objc
    private func didClickOn(_ button: UIButton) {
        let modalVC = ModalViewController()
        modalVC.modalPresentationStyle = .overFullScreen
        
        switch button.tag {
        case 0:
            modalVC.containsLongText = false
        default:
            modalVC.containsLongText = true
        }
        
        present(modalVC, animated: true)
    }
}

