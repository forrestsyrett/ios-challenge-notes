//
//  NotesController.swift
//  Notes
//
//  Created by Forrest Syrett on 5/5/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class notesController {
    
    private let notesKey = "notes"
    
    static let sharedNotesController = notesController()
    
    var notes = [Note]()
    
    init() {
        loadFromPersistentStorage()
    }
    
    func addNote(note: Note) {
        notes.append(note)
        saveToPersistentStorage()
    }
    
    func removeNote(note: Note) {
        if let index = notes.indexOf(note) {
        notes.removeAtIndex(index)
            saveToPersistentStorage()
        }
    }
    func loadFromPersistentStorage() {
        if let noteDictionaryFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(notesKey) as? [Dictionary<String, String>] {
            self.notes = noteDictionaryFromDefaults.map({Note(dictionary: $0)!})
        }
        
    }
    
    func saveToPersistentStorage() {
        let notesDictionary = self.notes.map({$0.dictionaryCopy()})
        NSUserDefaults.standardUserDefaults().setObject(notesDictionary, forKey: notesKey)
        
    }
}
