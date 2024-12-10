//
//  NewContactViewController.swift
//  DataStor
//
//  Created by Alexander Shevtsov on 07.12.2024.
//

import UIKit

final class NewContactViewController: UIViewController {

    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    
    weak var delegate: NewContactViewControllerDelegate!
    
    private let storageManager = StorageManager.shared
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let action = UIAction { [weak self] _ in
            guard let firstName = self?.firstNameTextField.text else { return }
            self?.doneButton.isEnabled = !firstName.isEmpty
        }
        firstNameTextField.addAction(action, for: .editingChanged)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        guard let firstName = firstNameTextField.text else { return }
        guard let lastName = lastNameTextField.text else { return }
        
        let contact = Contact(firstName: firstName, lastName: lastName)
        storageManager.save(contact: contact)
        
        delegate.add(contact: contact)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
