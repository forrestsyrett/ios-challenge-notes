//
//  NotesDetailViewController.swift
//  Notes
//
//  Created by Forrest Syrett on 5/5/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NotesDetailViewController: UIViewController {

    
    var note: Note?
    
    @IBOutlet var textField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        
        if textField.text == "" { return }
        else {
            if let note = self.note {
                note.text = self.textField.text!
            } else {
                
            let newNote = Note(text: textField.text)
            notesController.sharedNotesController.addNote(newNote)
                self.note = newNote
                }
            }
        self.navigationController?.popViewControllerAnimated(true)
        }
    
    func updateWithNote(note: Note) {
        self.note = note
        
        self.textField.text = note.text
    }
    
    func NoteTextFieldShouldReturn(textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


