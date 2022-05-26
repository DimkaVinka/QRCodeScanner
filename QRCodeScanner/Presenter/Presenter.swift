//
//  Presenter.swift
//  QRCodeScanner
//
//  Created by Дмитрий Виноградов on 26.05.2022.
//

import Foundation

protocol PresenterProtocol {
    func handleAppearigView()
    func handleDisappearigView()
    func runCapture()
    func test()
}

class Presenter {

    weak var view: ViewProtocol?

    let cameraService = CameraService()

    init(view: ViewProtocol) {
        self.view = view
        cameraService.delegate = self

    }
}

extension Presenter: PresenterProtocol {
    func test() {
        cameraService.cameraSettings()
        let layer = cameraService.getCaptureLayer()
        view?.addLayer(layer: layer)
        runCapture()
    }

    func runCapture() {
        cameraService.captureSession?.startRunning()
    }

    func handleAppearigView() {
        if (cameraService.captureSession?.isRunning == false) {
            cameraService.captureSession?.startRunning()
        }
    }

    func handleDisappearigView() {
        if (cameraService.captureSession?.isRunning == true) {
            cameraService.captureSession?.stopRunning()
        }
    }
}

extension Presenter: cameraServiceDelegate {
    func cameraServicePresent(_ cameraService: CameraService) {
        
    }

    func cameraServiceDismiss(_ cameraService: CameraService) {
        view?.dismiss()
    }

    func cameraServiceShowAlert(_ cameraService: CameraService) {
        view?.showAlert()
    }

    func cameraService(_ cameraService: CameraService, foundQRCode code: String) {
        print(code)
        WebView.urlText = code
        view?.pushTo(controller: WebView())
    }
}
