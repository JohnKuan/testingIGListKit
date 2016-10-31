//
//  UserViewSectionController.swift
//  testingIGListKit
//
//  Created by John Kuan on 31/10/16.
//  Copyright © 2016 Burpple. All rights reserved.
//

import UIKit
import IGListKit

class UserViewSectionController: IGListSectionController, IGListSectionType, IGListWorkingRangeDelegate {

    var user: User?
    var downloadImage: UIImage?
    var task: URLSessionDataTask?
    
    var urlString: String?
    
    deinit {
        task?.cancel()
    }
    
    override init() {
        super.init()
        workingRangeDelegate = self
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: 414, height: 42)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: UserCell.self, for: self, at: index)
        if let cell = cell as? UserCell {
            cell.setImage(image: downloadImage)
            cell.setName(name: user?.name)
        }
        return cell
    }
    
    func didUpdate(to object: Any) {
        if let user = object as? User {
            self.user = user
            self.urlString = user.profilePicURL
        }
    }
    
    func didSelectItem(at index: Int) {
        
    }
    
    //MARK: IGListWorkingRangeDelegate
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerWillEnterWorkingRange sectionController: IGListSectionController) {
        guard downloadImage == nil,
            task == nil,
            let urlString = urlString,
            let url = URL(string: urlString)
            else { return }
        
        let section = collectionContext?.section(for: self) ?? 0
        print("Downloading image \(urlString) for section \(section)")
        
        task = URLSession.shared.dataTask(with: url) { data, response, err in
            guard let data = data, let image = UIImage(data: data) else {
                return print("Error downloading \(urlString): \(err)")
            }
            DispatchQueue.main.async {
                self.downloadImage = image
                if let cell = self.collectionContext?.cellForItem(at: 0, sectionController: self) as? UserCell {
                    cell.setImage(image: image)
                }
            }
        }
        task?.resume()
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerDidExitWorkingRange sectionController: IGListSectionController) {}
    
    
}
