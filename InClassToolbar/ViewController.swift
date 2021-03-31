//
//  ViewController.swift
//  InClassToolbar
//
//  Created by zweakland on 3/25/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var statusLabel: UILabel!
    // flag to save or cancel depending on the value.
    var saveFlag : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        statusLabel.text = ""
    }

    @IBAction func save(_ sender: Any) {
        if (saveFlag) {
            saving()
        } else {
            cancel()
        }
        
        
    }
    
    @IBAction func edit(_ sender: Any) {
        view.backgroundColor = .blue
    }
    @IBAction func trash(_ sender: Any) {
        statusLabel.text = ""
        view.backgroundColor = .darkGray
    }
    
    func saving() {
        // array to store all 5 toolbar objects
        var items = toolbar.items
        items![0] = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(ViewController.save(_:)))
        
        // turn flag "off" so that the next button press will call the cancel() method
        saveFlag = false
        statusLabel.text = "Saving..."
        statusLabel.textColor = .green
        
        self.toolbar.setItems(items, animated: true)
        
    }
    
    func cancel() {
        
        // array to store all 5 toolbar objects
        var items = toolbar.items
        items![0] = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(ViewController.save(_:)))
        
        // turn flag "on" so that the next button press will call the saving() method
        saveFlag = true
        statusLabel.text = "Canceling..."
        statusLabel.textColor = .red
        
        self.toolbar.setItems(items, animated: true)
    }
    
}

