//
//  ViewController.swift
//  DemoMultipleRecprds
//
//  Created by Mangesh Tekale on 06/07/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: TableViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = TableViewModel(rowCount: 100) // For example, 100 rows

        tableView.dataSource = self
        tableView.delegate = self

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveData))
    }

    @objc func saveData() {
        viewModel.saveData()
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
        cell.configure(with: indexPath.row, viewModel: viewModel)
        return cell
    }
}

class TextFieldCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    var rowIndex: Int?
    var viewModel: TableViewModel?

    func configure(with index: Int, viewModel: TableViewModel) {
        self.rowIndex = index
        self.viewModel = viewModel
        self.textField.text = viewModel.rows[index].text
        self.textField.delegate = self
        self.textField.tag = index
    }

    // MARK: - UITextFieldDelegate

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let index = rowIndex else { return }
        viewModel?.updateRow(at: index, with: textField.text ?? "")
    }
}
