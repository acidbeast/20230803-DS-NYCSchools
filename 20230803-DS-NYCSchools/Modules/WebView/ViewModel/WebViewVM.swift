//
//  WebViewVM.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/14/23.
//

import Foundation


protocol WebViewVMProtocol {
    var urlString: String { get set }
}

final class WebViewVM: WebViewVMProtocol {
 
    internal var urlString: String
        
    init(
        urlString: String
    ) {
        self.urlString = urlString
    }
    
}
