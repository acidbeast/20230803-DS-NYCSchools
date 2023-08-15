//
//  WebView+Setup.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/14/23.
//

import UIKit

extension WebViewVC {
    
    func setup() {
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        view = webView
    }
    
}
