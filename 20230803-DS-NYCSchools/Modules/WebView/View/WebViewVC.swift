//
//  WebViewVC.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/14/23.
//

import UIKit
import WebKit


final class WebViewVC: UIViewController {
    
    var viewModel: WebViewVMProtocol
    var router: MainRouterProtocol
    var webView = WKWebView()
    
    init(
        router: MainRouterProtocol,
        viewModel: WebViewVMProtocol
    ) {
        self.router = router
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        load(urlString: viewModel.urlString)
    }
    
    
}

extension WebViewVC {
    func load(urlString: String) {
        guard let url = URL(string: "https://\(urlString)") else { return }
        webView.load(URLRequest(url: url))
    }
}
