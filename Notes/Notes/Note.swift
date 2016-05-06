//
//  Note.swift
//  Notes
//
//  Created by Forrest Syrett on 5/5/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class Note: Equatable {
    
    private let textKey = "text"
    
    var text: String
    
    init(text: String) {
        self.text = text

    }
    
    
    init?(dictionary: Dictionary<String, String>) {
        guard let text = dictionary[textKey]
        else {
            
                    self.text = ""
                
                return nil
                }
        self.text = text
        }
    
    func dictionaryCopy() -> Dictionary<String, String> {
        
        let dictionary = [
            textKey: self.text
            
        ]
        return dictionary
        
    }
}

 func == (lhs: Note, rhs: Note) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)

    }



