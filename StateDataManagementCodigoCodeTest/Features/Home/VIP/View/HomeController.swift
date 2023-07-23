//
//  HomeController.swift
//  StateDataManagementCodigoCodeTest
//
//  Created by Aung Ko Ko on 23/07/2023.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var loginWithFaceBookBtn: UIButton!
    @IBOutlet weak var loginWithEmailBtn: UIButton!
    @IBOutlet weak var createNewAccountBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        createNewAccountBtn.layer.cornerRadius = 15
        loginWithEmailBtn.layer.cornerRadius = 15
        loginWithFaceBookBtn.layer.cornerRadius = 15
        addActionListeners()
    }
    
    func addActionListeners() {
        loginWithFaceBookBtn.addTarget(self, action: #selector(self.handleFaceBookAction), for: .touchUpInside)
        createNewAccountBtn.addTarget(self, action: #selector(self.handleCreateNewAccountAction), for: .touchUpInside)
        loginWithEmailBtn.addTarget(self, action: #selector(self.handleLoginWithEmailAction), for: .touchUpInside)
    }
    
    @objc func handleFaceBookAction() {}
    
    @objc func handleLoginWithEmailAction() {}
    
    @objc func handleCreateNewAccountAction() {
        let vc = RegisterRouter.createFeature()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
