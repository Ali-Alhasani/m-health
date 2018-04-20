//
//  MHAddLaboratoryViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 4/19/18.
//  Copyright © 2018 Ali Al-Hassany. All rights reserved.
//

import UIKit


protocol AddLaboratoryViewControllerDelegate: class {
    
    func LaboratoryViewController(_ controller: MHAddLaboratoryViewController, didFinishAdding item: Radiology)
    
    
}

class MHAddLaboratoryViewController: UIViewController,UITextViewDelegate {
    
  weak var delegate: AddLaboratoryViewControllerDelegate?
    
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var noteText: TextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        noteText.delegate = self
        noteText.text = "Laboratory Note"
        noteText.textColor = UIColor.lightGray
        
        
        noteText.selectedTextRange = noteText.textRange(from: noteText.beginningOfDocument, to: noteText.beginningOfDocument)
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        // Combine the textView text and the replacement text to
        // create the updated text string
        let currentText:String = textView.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
        
        // If updated text view will be empty, add the placeholder
        // and set the cursor to the beginning of the text view
        if updatedText.isEmpty {
            
            textView.text = "Laboratory Note"
            textView.textColor = UIColor.lightGray
            
            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            
            return false
        }
            
            // Else if the text view's placeholder is showing and the
            // length of the replacement string is greater than 0, clear
            // the text view and set its color to black to prepare for
            // the user's entry
        else if textView.textColor == UIColor.lightGray && !text.isEmpty {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
        return true
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if self.view.window != nil {
            if textView.textColor == UIColor.lightText {
                textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addButtonAction(_ sender: Any) {
        let radiology = Radiology()
        
        if (nameText.text?.isEmpty)! {
            let alert = UIAlertController(title: "Alert", message: "Please enter laboratory name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        }else {
            radiology.name = nameText.text!
            radiology.note = noteText.text!
            
            delegate?.LaboratoryViewController(self, didFinishAdding: radiology)
        }
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




