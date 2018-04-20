//
//  MHAddCheckViewController.swift
//  m-health
//
//  Created by Ali Al-Hassany on 2/24/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHAddCheckViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate,AllDurgsViewControllerDelegate  {
    
    func AllDurgsViewController(_ controller: MHAllDurgsViewController, didFinishAdding item: [Drugs]) {
        self.allDrugs = item
        navigationController?.popViewController(animated: true)
    }
    

    @IBOutlet weak var pathologicalCaseText: UITextField!
    @IBOutlet weak var diagnoseText: UITextField!
    @IBOutlet weak var diagnoseDescriptionText: UITextView!
    //@IBOutlet weak var diagnoseDescriptionText: UITextField!
    @IBOutlet weak var durgsText: UITextField!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    //@IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var uploadPhotoButton: UIButton!
    @IBOutlet weak var drugButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    var allDrugs = [Drugs]()
    var socailId:String?
    let gap : CGFloat = 10
    let borderSize : CGFloat = 1
    let textHeight : CGFloat = 20
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        diagnoseDescriptionText.delegate = self
        diagnoseDescriptionText.text = "Enter Diagnose Description"
        diagnoseDescriptionText.textColor = UIColor.lightGray
        

        diagnoseDescriptionText.selectedTextRange = diagnoseDescriptionText.textRange(from: diagnoseDescriptionText.beginningOfDocument, to: diagnoseDescriptionText.beginningOfDocument)

      
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        // Combine the textView text and the replacement text to
        // create the updated text string
        let currentText:String = textView.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
        
        // If updated text view will be empty, add the placeholder
        // and set the cursor to the beginning of the text view
        if updatedText.isEmpty {
            
            textView.text = "Enter Diagnose Description"
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
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        let imageOrigin : CGFloat =  gap
        let textTop : CGFloat = imageOrigin + 53 + gap/2
        let textBottom : CGFloat = gap
        let imageBottom : CGFloat = textBottom + textHeight + gap/2

        uploadPhotoButton.setAsCircle(cornerRadius: 5, borderColor: .gray, borderWidth: 0.5)
        uploadPhotoButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: imageOrigin, bottom: imageBottom, right: imageOrigin)
        
        uploadPhotoButton.titleEdgeInsets = UIEdgeInsets(top: textTop, left: -(uploadPhotoButton!.imageView?.image?.size.width)!, bottom: textBottom, right: 0.0)
        
        drugButton.setAsCircle(cornerRadius: 5, borderColor: .gray, borderWidth: 0.5)
        drugButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: imageOrigin, bottom: imageBottom, right: imageOrigin)
        
        drugButton.titleEdgeInsets = UIEdgeInsets(top: textTop, left: -(drugButton!.imageView?.image?.size.width)!, bottom: textBottom, right: 0.0)
        
        
        cameraButton.setAsCircle(cornerRadius: 5, borderColor: .gray, borderWidth: 0.5)
        cameraButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: imageOrigin, bottom: imageBottom, right: imageOrigin)
        
        cameraButton.titleEdgeInsets = UIEdgeInsets(top: textTop, left: -(cameraButton!.imageView?.image?.size.width)!, bottom: textBottom, right: 0.0)
        
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        if (diagnoseText.text!.isEmpty || diagnoseDescriptionText.text!.isEmpty || pathologicalCaseText.text!.isEmpty) {
            let alert = UIAlertController(title: "Alert", message: "You should fill all the fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        }else {
            self.performSegue(withIdentifier: "nextAppointment", sender: self)
        }
    }
    
    @IBAction func AddDrugsButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toDurgsBulider", sender: self)
    }
    
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if(textField == durgsText){
//            if(durgsText.text?.isEmpty)!{
//
//            }
//        }
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDurgsBulider"{
            let vc = segue.destination as! MHAllDurgsViewController
            vc.delegate = self
        }else if segue.identifier == "nextAppointment"{
      let vc = segue.destination as! MHNextAppointmentViewController
            vc.diagnose = diagnoseText.text!
            vc.diagnoseDescription = diagnoseDescriptionText.text!
            vc.pathologicalCase = pathologicalCaseText.text!
            vc.socailId = socailId
            vc.allDurgs = allDrugs
            
        }
        
    }
    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
 
    */

}
