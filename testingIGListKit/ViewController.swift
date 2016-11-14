//
//  ViewController.swift
//  testingIGListKit
//
//  Created by John Kuan on 29/10/16.
//  Copyright © 2016 Burpple. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController, IGListAdapterDataSource {

    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    let collectionView = IGListCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let demos: [DemoItem] = [
        DemoItem(name: "Burpple", controllerClass: ReviewViewController.self),
        DemoItem(name: "Quick Selection", controllerClass: ViewController.self)
    ]
    
//    let data = [
//        "Ridiculus Elit Tellus Purus Aenean",
//        "Condimentum Sollicitudin Adipiscing",
//        250,
//        "Ligula Ipsum Tristique Parturient Euismod",
//        "Purus Dapibus Vulputate",
//        300,
//        "Tellus Nibh Ipsum Inceptos",
//        400
//        ] as [Any]
    
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
    
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        return demos
        //return data as! [IGListDiffable]
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        let obj = object as! DemoItem
        if obj.name == "Quick Selection" {
            return QSHorizontalSectionController()
        }
        return SectionController()
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

