//
//  LoginViewController.swift
//  Fakestagram
//
//  Created by Braulio Hernández González on 11/10/25.
//

import UIKit

final class LoginViewController: UIViewController {

    //MARK: ligar un elemento visual con el controlador (@IBOutlet)
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: un elemento va a realizar una acción (@IBAction)
    @IBAction func loginButtonTapped(_ sender: UIButton){
        print("User: ", userField.text)
        print("Password: ", passwordField.text)
        logIn()
    }
    
    private func logIn(){
        performSegue(withIdentifier: "LoginHomeSegue", sender: nil)
    }
    
    // La vista va a aparecer cuando todos los elementos estén cargados
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    // Cuando la vista ya aparece al usuario
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    

}

