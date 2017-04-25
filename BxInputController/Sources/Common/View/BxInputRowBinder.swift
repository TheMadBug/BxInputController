/**
 *	@file BxInputRowBinder.swift
 *	@namespace BxInputController
 *
 *	@details Protocol and base class for binding row data model with cell
 *	@date 06.03.2017
 *	@author Sergey Balalaev
 *
 *	@version last in https://github.com/ByteriX/BxInputController.git
 *	@copyright The MIT License (MIT) https://opensource.org/licenses/MIT
 *	 Copyright (c) 2017 ByteriX. See http://byterix.com
 */

import UIKit

/// Protocol for binding row data model with cell
public protocol BxInputRowBinder : AnyObject {
    
    /// reference to owner
    weak var owner: BxInputController? {get set}
    /// reference to model data
    var rowData: BxInputRow {get set}
    /// view
    var viewCell: UITableViewCell? {get set}
    /// call before showing view when need update content
    func update()
    /// call when user selected this cell
    func didSelected()
    
    var checkers: [BxInputRowChecker] {get}
    func addChecker(_ checker: BxInputRowChecker)
    func checking(priority: BxInputRowCheckerPriority)
}

