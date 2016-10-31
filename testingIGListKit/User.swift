/**
 Copyright (c) 2016-present, Facebook, Inc. All rights reserved.

 The examples provided by Facebook are for non-commercial testing and evaluation
 purposes only. Facebook reserves all rights not expressly granted.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import IGListKit

class User: IGListDiffable {

    let pk: Int
    let name: String
    let profilePicURL: String
    let date: NSDate

    init(pk: Int, name: String, profilePicURL: String, date: String) {
        self.pk = pk
        self.name = name
        self.profilePicURL = profilePicURL
        self.date = (date as NSDate).formattedAsTimeAgo()
    }

    //MARK: IGListDiffable

    func diffIdentifier() -> NSObjectProtocol {
        return pk as NSObjectProtocol
    }

    func isEqual(_ object: IGListDiffable?) -> Bool {
        if self === object {
            return true
        }
        if let object = object as? User {
            return name == object.name && profilePicURL == object.profilePicURL
        }
        return false
    }

}
