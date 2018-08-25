//
//  ViewController.swift
//  GMD Swift
//
//  Created by Patrik Vaberer on 8/29/15.
//  Copyright © 2015 Patrik Vaberer. All rights reserved.
//

//
//  ViewController.swift
//  Google Material Design Icons Swift
//
//  Created by Patrik Vaberer on 7/13/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

import UIKit
import Foundation

class MissingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var missingItems:[Character] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildMissingItemList()
    }
    
    func buildMissingItemList() {
        
        let font = GMDType.font()
        if var extantChars = font.fontDescriptor.object(forKey: .characterSet) as? CharacterSet {
            let knownCharString:String = GMDType.allValues.reduce("") { (total, icon) -> String in
                total + icon.text
            }
            
            extantChars.remove(charactersIn: knownCharString)
            let missingChars = extantChars.allCharacters()
            
            //ignore characters before 0xE00 as they seem to be just spaces
            missingItems = missingChars.filter { (character) -> Bool in
                return character.description.utf16.first! >= 0xE00
            }

        }

    }
    
    
    //MARK: UITableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let c = tableView.dequeueReusableCell(withIdentifier: "IconCellMissing") as! IconCell
        
        let icon = GMDType.gmd3dRotation
        
        //set with known char to set the font
        c.lSmall.GMDIcon = icon
        c.lMedium.GMDIcon = icon
        c.lBig.GMDIcon = icon
        
        let character = missingItems[indexPath.row]
        c.lSmall.text = character.description
        c.lMedium.text = character.description
        c.lBig.text = character.description
        
        let number = character.description.utf16.first!
        let hex = String(format:"%02X", number)
        c.lFont.text = ("0x\(hex)")
        
        return c
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return missingItems.count
    }
    
    
    
    @IBAction func bGithubPressed(_ sender: UIBarButtonItem) {
        
        if let requestUrl = URL(string: "https://github.com/Vaberer/Google-Material-Design-Icons-Swift") {
            UIApplication.shared.openURL(requestUrl)
        }
    }
    

    
    let helper = GMDType.cases().map { (item) -> String in
        return "\(item)"
    }

}

extension CharacterSet {
    func allCharacters() -> [Character] {
        var result: [Character] = []
        for plane: UInt8 in 0...16 where self.hasMember(inPlane: plane) {
            for unicode in UInt32(plane) << 16 ..< UInt32(plane + 1) << 16 {
                if let uniChar = UnicodeScalar(unicode), self.contains(uniChar) {
                    result.append(Character(uniChar))
                }
            }
        }
        return result
    }
}
