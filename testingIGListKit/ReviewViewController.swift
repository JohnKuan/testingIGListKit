//
//  ReviewViewController.swift
//  testingIGListKit
//
//  Created by John Kuan on 31/10/16.
//  Copyright © 2016 Burpple. All rights reserved.
//

import UIKit
import IGListKit

class ReviewViewController: UIViewController, IGListAdapterDataSource {

    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 1)
    }()
    lazy var collectionView: IGListCollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 0
        return IGListCollectionView(frame: .zero, collectionViewLayout: flow)
    }()
    

    var data = [
        410,
        LabelViewModel(pk: 1, text: "Super Nice Food"),
        TextViewModel(pk: 2, text: "Ligula Ipsum Tristique Parturient Euismod iweout mulaso tihfawe porwee teywem cgjkta lamdba")
    ] as [Any]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        return data.map({ $0 as! IGListDiffable })
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        switch object {
        case is String:
            return LabelSectionController()
        case is Int:
            return MainImageSectionController()
        case is TextViewModel:
            return TextViewSectionController()
        case is LabelViewModel:
            return LabelSectionController()
        default:
            return LabelSectionController()
        }
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }

}
