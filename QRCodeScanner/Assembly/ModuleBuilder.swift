//
//  ModuleBuilder.swift
//  QRCodeScanner
//
//  Created by Дмитрий Виноградов on 26.05.2022.
//

import UIKit

class ModuleBuilder {
    static func createModule() -> UIViewController {
        let viewController = ViewController()
        let presenter = Presenter(view: viewController)

        viewController.presenter = presenter

        return viewController
    }
}
