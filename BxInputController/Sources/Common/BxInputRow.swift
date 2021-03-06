/**
 *	@file BxInputRow.swift
 *	@namespace BxInputController
 *
 *	@details BxInputController base row protocol
 *	@date 09.01.2017
 *	@author Sergey Balalaev
 *
 *	@version last in https://github.com/ByteriX/BxInputController.git
 *	@copyright The MIT License (MIT) https://opensource.org/licenses/MIT
 *	 Copyright (c) 2017 ByteriX. See http://byterix.com
 */

import Foundation
import UIKit

/// Base protocol for data modeling in BxInputController
public protocol BxInputRow : AnyObject{
    
    /// caption for showing details about content
    var title : String? {get}
    
    /// subcaption for showing details about content
    var subtitle : String? {get}
    
    /// hint for showing example puted a value
    var placeholder : String? {get}
    
    /// enabling or disabling item for a putting
    var isEnabled : Bool {get set}
    
    /// Use for initializing from a xib and register for the table, this have to be uniqueue value
    var resourceId : String {get}
    
    /// Make and return Binder for binding row with cell.
    var binder : BxInputRowBinder {get}
    
    /// estimated height for the cell (got from resourceId) in the table
    var estimatedHeight : CGFloat {get}

}

/// Data modeling protocol for Row with Value
public protocol BxInputValueRow : BxInputRow{
    
    /// Return true if value for the row is empty
    var hasEmptyValue: Bool {get}
    
    /// event when value of current row was changed
    func didChangedValue()
}
