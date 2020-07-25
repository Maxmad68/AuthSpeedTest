//
//  TableView.swift
//  AuthSpeedTest
//
//  Created by Maxime on 25/07/2020.
//  Copyright © 2020 Madrau. All rights reserved.
//

import UIKit

extension ViewController {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tests.count + 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == tests.count { // Total cell
			var midText: String = "--"
			var count = 0.0
			var errorCount = 0
			if tests.count > 0 {
				var sum = 0.0
				for t in tests {
					if !t.error {
						sum += t.time
						count += 1
					} else {
						errorCount += 1
					}
				}
				mid = sum / count
				midText = String(describing: mid)
			}
			
			let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
			cell.backgroundColor = .lightGray
			cell.textLabel?.text = midText
			cell.detailTextLabel?.text = String(describing: tests.count) + " tries / " + String(describing: errorCount) + " failed"
			return cell
		}
		
		let data = tests[indexPath.row]
		let cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)

		if data.error {
			cell.textLabel?.text = "Failed"
			cell.textLabel?.textColor = .red
		} else {
			cell.textLabel?.text = String(describing:data.time)
		}
		return cell
	}
	
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath.row == tests.count {
			UIPasteboard.general.string = String(describing:mid)
		} else {
			let data = tests[indexPath.row]
			UIPasteboard.general.string = String(describing: data.time)
		}
	}
	
	func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
		if indexPath.row != tests.count { // Can't delete total cell
			return .delete
		}

		return .none
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

		if editingStyle == .delete {
			if indexPath.row != tests.count {
				self.tests.remove(at: indexPath.row)
				tableView.reloadData()
				
			}
		}
	}
}
