//
//  ViewController.swift
//  QRCodeScanner
//
//  Created by Дмитрий Виноградов on 26.05.2022.
//

import UIKit
import AVFoundation

protocol ViewProtocol: AnyObject {
    func showAlert()
    func dismiss()
    func pushTo(controller: UIViewController)
    func addLayer(layer: AVCaptureVideoPreviewLayer?)
}

class ViewController: UIViewController {

    var presenter: PresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.handleAppearigView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.test()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.handleDisappearigView()
    }
}

extension ViewController: ViewProtocol {
    func addLayer(layer: AVCaptureVideoPreviewLayer?) {
        guard let layer = layer else { return }
        view.layer.addSublayer(layer)
        layer.frame = view.layer.bounds
    }

    func pushTo(controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }

    func dismiss() {
        dismiss(animated: true, completion: nil)
    }

    func showAlert() {
        let ac = UIAlertController(title: "Scanning not supported",
                                   message: "Your device does not support scanning a code from an item. Please use a device with a camera.",
                                   preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}

