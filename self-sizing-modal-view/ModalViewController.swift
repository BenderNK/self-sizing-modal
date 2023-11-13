//
//  ModalViewController.swift
//  self-sizing-modal-view
//
//  Created by Turker Nessa on 11/12/23.
//

import UIKit

class ModalViewController: UIViewController {

    private var containerView: UIView!
    private var primaryStackView: UIStackView!
    var containsLongText = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Order of the views matter
        configureBackgroundView()
        configureContainerView()
        configureStackView()
        configureTitleView()
        configureLongTextView()
        configureActionButtons()
    }
    
    private func configureBackgroundView() {
        self.view.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
    }
    

    private func configureContainerView() {
        containerView = UIView()
        containerView.backgroundColor = .systemBackground
        containerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        containerView.layer.cornerRadius = 12
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 1
        containerView.clipsToBounds = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            containerView.topAnchor.constraint(greaterThanOrEqualTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            containerView.bottomAnchor.constraint(lessThanOrEqualTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            containerView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    private func configureStackView() {
        primaryStackView = UIStackView()
        primaryStackView.axis = .vertical
        primaryStackView.spacing = 16
        primaryStackView.alignment = .fill
        primaryStackView.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.addSubview(primaryStackView)
        
        NSLayoutConstraint.activate([
            primaryStackView.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            primaryStackView.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            primaryStackView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 20),
            primaryStackView.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func configureTitleView() {
        let titleLabel = UILabel()
        titleLabel.font = .preferredFont(forTextStyle: .largeTitle)
        titleLabel.textAlignment = .center
        titleLabel.text = "RITM0010007"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        primaryStackView.addArrangedSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func configureLongTextView() {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.font = UIFont.preferredFont(forTextStyle: .callout)
        //textView.setContentCompressionResistancePriority(UILayoutPriority(751), for: .vertical)
        if containsLongText {
            textView.text = """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut lectus arcu bibendum at varius vel pharetra. Ipsum dolor sit amet consectetur. Feugiat vivamus at augue eget arcu dictum varius. Nibh sit amet commodo nulla facilisi nullam vehicula. Cursus in hac habitasse platea dictumst. Placerat orci nulla pellentesque dignissim enim sit amet venenatis urna. Quis eleifend quam adipiscing vitae proin. Dignissim convallis aenean et tortor at risus. Faucibus in ornare quam viverra orci sagittis eu volutpat. Mauris in aliquam sem fringilla ut. Arcu dictum varius duis at consectetur lorem donec massa sapien. Elit pellentesque habitant morbi tristique senectus et. Purus in mollis nunc sed id semper risus in hendrerit.

            Ornare aenean euismod elementum nisi. Feugiat nisl pretium fusce id velit. Velit ut tortor pretium viverra suspendisse potenti. Imperdiet nulla malesuada pellentesque elit eget gravida. Egestas pretium aenean pharetra magna ac placerat vestibulum lectus mauris. Ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia. Varius vel pharetra vel turpis nunc. Placerat orci nulla pellentesque dignissim. Suspendisse in est ante in. Accumsan tortor posuere ac ut. Sit amet aliquam id diam. Nulla facilisi nullam vehicula ipsum a arcu cursus.

            Pretium lectus quam id leo in vitae turpis. Et pharetra pharetra massa massa ultricies mi quis. Euismod elementum nisi quis eleifend quam adipiscing. Morbi blandit cursus risus at ultrices. Ullamcorper velit sed ullamcorper morbi tincidunt. Risus pretium quam vulputate dignissim suspendisse in est. Morbi tristique senectus et netus et malesuada. Duis convallis convallis tellus id interdum. Vel pretium lectus quam id leo in vitae. Ornare aenean euismod elementum nisi. Pulvinar pellentesque habitant morbi tristique senectus et netus et. Nulla facilisi cras fermentum odio eu feugiat pretium nibh ipsum.

            Risus at ultrices mi tempus imperdiet nulla malesuada. Risus nullam eget felis eget nunc lobortis. Volutpat consequat mauris nunc congue nisi vitae. Habitant morbi tristique senectus et netus et malesuada. Id donec ultrices tincidunt arcu non. Ornare massa eget egestas purus viverra accumsan in. Nisi quis eleifend quam adipiscing vitae. At imperdiet dui accumsan sit. A diam maecenas sed enim ut. Tincidunt lobortis feugiat vivamus at augue eget arcu dictum varius. Consequat nisl vel pretium lectus quam id leo. Tortor at auctor urna nunc id cursus.

            Convallis a cras semper auctor. Adipiscing bibendum est ultricies integer quis. Dictumst quisque sagittis purus sit amet volutpat consequat. Sit amet massa vitae tortor condimentum. Faucibus purus in massa tempor nec feugiat nisl pretium. Mattis pellentesque id nibh tortor. Lacus sed viverra tellus in hac habitasse platea dictumst. Semper risus in hendrerit gravida rutrum quisque non. Et ultrices neque ornare aenean. Lacus vel facilisis volutpat est velit egestas. Enim sit amet venenatis urna. Sapien et ligula ullamcorper malesuada proin libero.
            """
        } else {
            textView.text = """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
            """
        }
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        primaryStackView.addArrangedSubview(textView)
    }
    
    private func configureActionButtons() {
        let button1 = UIButton(configuration: UIButton.Configuration.borderedTinted())
        button1.setTitle("Action A", for: .normal)
        primaryStackView.addArrangedSubview(button1)
        NSLayoutConstraint.activate([
            button1.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        let button2 = UIButton(configuration: UIButton.Configuration.borderedTinted())
        button2.setTitle("Action B", for: .normal)
        primaryStackView.addArrangedSubview(button2)
        NSLayoutConstraint.activate([
            button2.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        let button3 = UIButton(configuration: UIButton.Configuration.borderedTinted())
        button3.setTitle("Dismiss Modal", for: .normal)
        button3.addTarget(self, action: #selector(didRequestToDismiss(_:)), for: .touchUpInside)
        primaryStackView.addArrangedSubview(button3)
        NSLayoutConstraint.activate([
            button3.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    @objc
    private func didRequestToDismiss(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}
