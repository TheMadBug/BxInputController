/**
 *	@file BxInputTextMemoRowBinder.swift
 *	@namespace BxInputController
 *
 *	@details Binder for BxInputTextMemoRow
 *	@date 01.08.2017
 *	@author Sergey Balalaev
 *
 *	@version last in https://github.com/ByteriX/BxInputController.git
 *	@copyright The MIT License (MIT) https://opensource.org/licenses/MIT
 *	 Copyright (c) 2017 ByteriX. See http://byterix.com
 */

import UIKit

/// Binder for BxInputTextMemoRow
open class BxInputTextMemoRowBinder<Row: BxInputTextMemoRow, Cell: BxInputTextMemoCell> : BxInputBaseRowBinder<Row, Cell>, BxInputTextMemoCellDelegate, UITextViewDelegate
{
    /// call when user selected this cell
    override open func didSelected()
    {
        super.didSelected()
        
        cell?.textView.becomeFirstResponder()
    }
    /// update cell from model data
    override open func update()
    {
        super.update()
        cell?.delegate = self
        //
        cell?.textView.font = owner?.settings.valueFont
        cell?.textView.textColor = owner?.settings.valueColor
        cell?.textView.text = row.value
        cell?.textView.placeholderColor = owner?.settings.placeholderColor
        cell?.textView.placeholder = row.placeholder
        cell?.textView.update(from: row.textSettings)
    }
    /// event of change isEnabled
    override open func didSetEnabled(_ value: Bool)
    {
        super.didSetEnabled(value)
        guard let cell = cell else {
            return
        }
        if !value {
            cell.textView.resignFirstResponder()
        }
        cell.textView.isUserInteractionEnabled = value
        // UI part
        if needChangeDisabledCell {
            if let changeViewEnableHandler = owner?.settings.changeViewEnableHandler {
                changeViewEnableHandler(cell.textView, isEnabled)
            } else {
                cell.textView.alpha = value ? 1 : alphaForDisabledView
            }
        } else {
            cell.textView.alpha = 1
        }
    }
    
    /// check state of putting value
    open func check()
    {
        if checkSize() {
            checkScroll()
        }
    }
    
    /// check and change only scroll if need
    open func checkScroll()
    {
        guard let cell = cell else {
            return
        }
        if let position = cell.textView.selectedTextRange?.start,
            let owner = owner
        {
            let rect = cell.textView.caretRect(for: position)
            let rectInTable = owner.tableView.convert(rect, from: cell.textView)
            let shift =  8 + rectInTable.origin.y + rectInTable.size.height - ( owner.tableView.contentOffset.y + owner.tableView.frame.size.height - owner.tableView.contentInset.bottom)
            if shift > 0 {
                let point = CGPoint(x: owner.tableView.contentOffset.x, y: owner.tableView.contentOffset.y + shift + 4)
                owner.tableView.setContentOffset(point, animated: true)
            }
        }
    }
    /// check and change only size if need
    open func checkSize() -> Bool
    {
        guard let cell = cell else {
            return false
        }
        let shift = cell.textView.contentSize.height - cell.textView.frame.size.height
        if shift > 0 {
            row.height = row.height + shift + 1
            owner?.reloadRow(row, with: .none)
            owner?.selectRow(row, at: .none, animated: false)
            return false
        }
        return true
    }
    
    // MARK - UITextViewDelegate
    
    /// start editing
    open func textViewShouldBeginEditing(_ textView: UITextView) -> Bool
    {
        if !isEnabled {
            return false
        }
        if let owner = owner, owner.settings.isAutodissmissSelector {
            owner.dissmissSelectors()
        }
        owner?.activeRow = row
        owner?.activeControl = textView
        return true
    }
    
    /// editing is started
    open func textViewDidBeginEditing(_ textView: UITextView)
    {
        self.perform(#selector(check), with: nil, afterDelay: 0.1)
    }
    
    /// end editing
    open func textViewShouldEndEditing(_ textView: UITextView) -> Bool
    {
        if owner?.activeControl === textView {
            owner?.activeControl = nil
        }
        if owner?.activeRow === row {
            owner?.activeRow = nil
        }
        return true
    }
    
    /// change value
    open func textViewDidChange(_ textView: UITextView)
    {
        row.value = textView.text
        owner?.updateRow(row)
        check()
    }
    
}
