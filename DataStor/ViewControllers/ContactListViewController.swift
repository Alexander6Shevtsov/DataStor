//
//  ContactListViewController.swift
//  DataStor
//
//  Created by Alexander Shevtsov on 07.12.2024.
//

import UIKit

protocol NewContactViewControllerDelegate: AnyObject {
    func add(contact: Contact)
}

final class ContactListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private var contacts: [Contact] = []
    private let storageManager = StorageManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        contacts = storageManager.fetchContacts()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newContactVC = segue.destination as? NewContactViewController else { return }
        newContactVC.delegate = self
    }
}
