//
//  TableViewModel.swift
//  DemoMultipleRecprds
//
//  Created by Mangesh Tekale on 06/07/24.
//

import Foundation

class TableViewModel {
    var rows: [RowData]

    init(rowCount: Int) {
        self.rows = Array(repeating: RowData(text: ""), count: rowCount)
    }

    func updateRow(at index: Int, with text: String) {
        guard index >= 0 && index < rows.count else { return }
        rows[index].text = text
    }

    func saveData() {
        // Save data logic
        for row in rows {
            print(row.text)
        }
    }
}
