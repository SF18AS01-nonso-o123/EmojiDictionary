//
//  AddEditEmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Chinonso Obidike on 2/13/19.
//  Copyright © 2019 Chinonso Obidike. All rights reserved.
//

import UIKit;

class AddEditEmojiTableViewController: UITableViewController {
    
    var emoji: Emoji? = nil;   //p. 638
    
    @IBOutlet weak var symbolTextField: UITextField!;
    @IBOutlet weak var nameTextField: UITextField!;
    @IBOutlet weak var descriptionTextField: UITextField!;
    @IBOutlet weak var usageTextField: UITextField!;
    
    @IBOutlet weak var saveButton: UIBarButtonItem!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        if let emoji: Emoji = emoji {   //p. 639
            symbolTextField.text = emoji.symbol;
            nameTextField.text = emoji.name;
            descriptionTextField.text = emoji.description;
            usageTextField.text = emoji.usage;
        }
        
        updateSaveButtonState();
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState();
    }
    
    func updateSaveButtonState() {
        let symbolText: String = symbolTextField.text ?? "";
        let nameText: String = nameTextField.text ?? "";
        let descriptionText: String = descriptionTextField.text ?? "";
        let usageText: String = usageTextField.text ?? "";
        
        saveButton.isEnabled = !symbolText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty;
    }
    
    // MARK: - Table view data source
    // Not needed: this is a static tablew view.
    
    /*
     override func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 0
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     // #warning Incomplete implementation, return the number of rows
     return 0
     }
     */
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    // MARK: - Navigation, p. 642
    
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        super.prepare(for: segue, sender: sender);
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let symbol: String = symbolTextField.text ?? "";
        let name: String = nameTextField.text ?? "";
        let description: String = descriptionTextField.text ?? "";
        let usage: String = usageTextField.text ?? "";
        
        emoji = Emoji(symbol: symbol, name: name, description: description, usage: usage);
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
}
