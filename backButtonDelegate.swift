//
//  BackButtonDelegate.swift
//  ToDoList
//
//  Created by Sadie Flick on 5/14/18.
//  Copyright © 2018 Sadie Flick. All rights reserved.
//

import Foundation
import UIKit

protocol BackButtonDelegate: class {
    func backButtonPressed(by controller: UITableViewController)
}
