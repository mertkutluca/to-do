//
//  BookListBuilder.swift
//  to-do
//
//  Created by mert.kutluca on 16.03.2021.
//

import UIKit

final class BookListBuilder {
    
    static func build() -> BookListVC {
        let sb = UIStoryboard(name: "BookList", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! BookListVC
        
        let vm = BookListVM(networkManager: app.networkManager)
        vm.load()
        vc.vm = vm
        vm.delegate = vc
        
        return vc
    }
    
}
