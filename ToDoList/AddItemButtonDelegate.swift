//
//  AddItemButtonDelegate.swift
//  ToDoList
//
//  Created by Sadie Flick on 5/14/18.
//  Copyright © 2018 Sadie Flick. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemButtonDelegate: class {
    func addItemButtonPressed(by: UIViewController, with title: String?, and desc: String?, on date: UIDatePicker?)
}
