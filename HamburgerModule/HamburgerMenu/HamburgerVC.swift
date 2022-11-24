//
//  HamburgerVC.swift
//  HamburgerModule
//
//  Created by Shivaditya Kumar on 2022-11-24.
//

import UIKit

class HamburgerVC: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var hamburgerData: [String] = []
    let transition = DrawerTransitionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    private func setupUI() {
        // TableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        // Button
        self.closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
    }
    @objc private func didTapCloseButton() {
        self.dismiss(animated: true)
    }
    class func instantiate(hamburgerData: [String]) -> HamburgerVC {
        let vc = UIStoryboard.main.instanceOf(viewController: HamburgerVC.self)!
        vc.hamburgerData = hamburgerData
        vc.transition.presentationType = .left
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = vc.transition
        return vc
    }
}
extension HamburgerVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hamburgerData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = hamburgerData[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        cell.textLabel?.textColor = .darkGray
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = hamburgerData[indexPath.row]
        debugPrint(data)
    }
}
