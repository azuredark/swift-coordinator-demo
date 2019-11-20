//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by clarknt on 2019-11-19.
//  Copyright © 2019 clarknt. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator, Buying, AccountCreating {
    var Closures = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ViewController.instantiate()
        vc.buyAction = { [weak self] in
            self?.buySubscription()
        }

        vc.createAccountAction = { [weak self] in
            self?.createAccount()
        }
        navigationController.pushViewController(vc, animated: false)
    }

    func buySubscription() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
