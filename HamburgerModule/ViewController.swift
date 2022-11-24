//
//  ViewController.swift
//  HamburgerModule
//
//  Created by Shivaditya Kumar on 2022-11-24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var hamburgerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hamburgerButton.addTarget(self, action: #selector(didTapHamburgerButton), for: .touchUpInside)
    }
    @objc private func didTapHamburgerButton() {
        let vc = HamburgerVC.instantiate(hamburgerData: ["Profile", "Contact", "T&C", "Settings"])
        self.present(vc, animated: true)
    }
}

