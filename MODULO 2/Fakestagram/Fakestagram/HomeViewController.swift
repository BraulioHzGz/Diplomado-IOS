//
//  HomeViewController.swift
//  Fakestagram
//
//  Created by Braulio Hernández González on 11/10/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var imageType: UISwitch!
    
    @IBOutlet weak var captionSwitch: UISwitch!
    
    @IBOutlet weak var customTextSwitch: UISwitch!
    
    @IBOutlet weak var customTextField: UITextView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func picsButtonTapped(_ sender: Any) {
    }
    
    @IBAction func logOutButton(_ sender: Any){
        
    }
    
    @IBAction func informationButton(_ sender: Any){
        
    }
}
