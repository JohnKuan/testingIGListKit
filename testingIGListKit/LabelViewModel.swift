//
//  LabelViewModel.swift
//  testingIGListKit
//
//  Created by John Kuan on 31/10/16.
//  Copyright © 2016 Burpple. All rights reserved.
//

import IGListKit

class LabelViewModel: IGListDiffable {
    
    let pk: Int
    let text: String
    
    init(pk: Int, text: String) {
        self.pk = pk
        self.text = text
    }
    
    //MARK: IGListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return pk as NSObjectProtocol
    }
    
    func isEqual(_ object: IGListDiffable?) -> Bool {
        if self === object {
            return true
        }
        if let object = object as? TextViewModel {
            return text == object.text
        }
        return false
    }
    
}

