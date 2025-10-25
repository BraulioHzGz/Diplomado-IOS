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
        setBarButtonGroup()
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Cast directo al ViewController asociado
        if let feedViewController = segue.destination as? FeedViewController {
            
        // Identificador del segue y luego el cast a dicho ViewController
        } else if segue.identifier == "HomeInformationSegue", let InformationViewController = segue.destination as? InformationViewController {
        }
    }*/
    
    @objc private func logOutButton(){
        navigationController?.dismiss(animated: true)
    }
    
    
    @objc private func informationButton(){
        if customTextSwitch.isOn{
            if customTextField.text != "" {
                navigateToInformationViewController()
            } else {
                let alert = UIAlertController(title: nil, message: "Add custom text", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                present(alert, animated: true)
            }
        } else {
            navigateToInformationViewController()
        }
    }
    
    
    private func navigateToInformationViewController() {
        let infoViewController = InformationViewController(nibName: nil, bundle: nil)
        if customTextSwitch.isOn{
            infoViewController.informationText = customTextField.text
        }
        present(infoViewController, animated: true)
    }
    
    
    @IBAction func imageTypeSwitchValueChange(_ sender: UISwitch) {
        picsButton.setImage(UIImage(systemName: sender.isOn ? "dog.fill" : "cat.fill"), for: .normal)
    }
    
    
    @IBAction func captionTypeSwitchValueChange(_ sender: UISwitch) {
        customTextField.isEditable = sender.isOn
    }
    
    
    @IBAction func picsButtonTapped(_ sender: UIButton) {
        let feedViewController = FeedViewController(nibName: nil, bundle: nil)
        
        feedViewController.pictureType = imageType.isOn ? .dog : .cat
        feedViewController.showCaption = captionSwitch.isOn
        
        navigationController?.pushViewController(feedViewController, animated: true)
    }
    
    private func setBarButtonGroup() {
        let logOutButton = UIBarButtonItem(title:"Logout", image: UIImage(systemName: "multiply.circle.fill"), target: self, action: #selector(logOutButton))
        let informationButton = UIBarButtonItem(title:"Info", image: UIImage(systemName: "multiply.circle.fill"), target: self, action: #selector(informationButton))
        
        navigationItem.centerItemGroups = [UIBarButtonItemGroup.fixedGroup(items: [logOutButton, informationButton])]
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
