//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Nguyen Duc Tam on 2017/03/06.
//  Copyright © 2017年 Nguyen Duc Tam. All rights reserved.
//

import UIKit
protocol AddItemViewControllerDelegate: class {
    func  addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAddingItem item : ChecklistItem)
    func addItemViewController(_ controller: AddItemViewController, didFinishEditingItem item : ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    weak var delegate: AddItemViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    override func viewDidLoad() {
        if let item = itemToEdit {
            self.title = "Edit Item"
            textField.text = item.name
            doneBarButton.isEnabled = true
        }
    }
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(true)
         textField.becomeFirstResponder()
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string)  as NSString
        doneBarButton.isEnabled = (newText.length > 0)
        return true
    }
    @IBAction func cancel(_ sender: Any) {
        delegate?.addItemViewControllerDidCancel(self)
    }
    @IBAction func done(_ sender: Any) {
        if let item = itemToEdit {
            item.name = textField.text!
            delegate?.addItemViewController(self, didFinishEditingItem: item)
        } else {
            let item = ChecklistItem()
            item.checked = false
            item.name = textField.text!
            delegate?.addItemViewController(self, didFinishAddingItem: item)
        }
    }
  
}
