//
//  HomeViewController.swift
//  Fakestagram
//
//  Created by Braulio Hernández González on 11/10/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var imageType: UISwitch!
    @IBOutlet weak var captionSwitch: UISwitch!
    @IBOutlet weak var customTextSwitch: UISwitch!      // Para habilitar o no escritura el textfield
    @IBOutlet weak var customTextField: UITextView! {
        didSet {
            customTextField.delegate = self
        }
    }     // TextField editable
    @IBOutlet weak var picsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picsButton.setImage(UIImage(systemName: imageType.isOn ? "dog.fill" : "cat.fill"), for: .normal)
        customTextField.isEditable = customTextSwitch.isOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Cast directo al ViewController asociado
        if let feedViewController = segue.destination as? FeedViewController {
            feedViewController.pictureType = imageType.isOn ? .dog : .cat
            feedViewController.showCaption = captionSwitch.isOn
        
        // Identificador del segue y luego el cast a dicho ViewController
        } else if segue.identifier == "HomeInformationSegue", let InformationViewController = segue.destination as? InformationViewController {
            if customTextSwitch.isOn{
                InformationViewController.informationText = customTextField.text
            }
        }
    }
    
    
    @IBAction func logOutButton(_ sender: Any){
        navigationController?.dismiss(animated: true)
    }
    
    
    @IBAction func informationButton(_ sender: Any){
        if customTextSwitch.isOn{
            if customTextField.text != "" {
                // HomeInformationSegue
                performSegue(withIdentifier: "HomeInformationSegue", sender: nil)
            } else {
                let alert = UIAlertController(title: nil, message: "Add custom text", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                present(alert, animated: true)
            }
        } else {
            // HomeInformationSegue
            performSegue(withIdentifier: "HomeInformationSegue", sender: nil)
        }
    }
    
    
    @IBAction func imageTypeSwitchValueChange(_ sender: UISwitch) {
        picsButton.setImage(UIImage(systemName: sender.isOn ? "dog.fill" : "cat.fill"), for: .normal)
    }
    
    
    @IBAction func captionTypeSwitchValueChange(_ sender: UISwitch) {
        customTextField.isEditable = sender.isOn
    }
}



extension HomeViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let allowCharacterSet = CharacterSet.alphanumerics.union(CharacterSet.whitespacesAndNewlines)
        let maxCharacterCount = 150
        let currentCharacters = textView.text.count
        let finalCharacterCount = currentCharacters + text.count - range.length
        return text == "" || (CharacterSet(charactersIn: text).isSubset(of: allowCharacterSet) && finalCharacterCount <= maxCharacterCount)
        
        /*
         Si el texto no se dejara borrar por mayor cadena:
         return text == "" || (CharacterSet(charactersIn: text).isSubset(of: allowCharacterSet) && finalCharacterCount <= maxCharacterCount)
         */
    }
}
