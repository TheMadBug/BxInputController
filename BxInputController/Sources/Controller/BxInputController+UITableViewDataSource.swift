/**
 *	@file BxInputController+UITableViewDataSource.swift
 *	@namespace BxInputController
 *
 *	@details UITableViewDataSource implementation for BxInputController
 *	@date 14.01.2017
 *	@author Sergey Balalaev
 *
 *	@version last in https://github.com/ByteriX/BxInputController.git
 *	@copyright The MIT License (MIT) https://opensource.org/licenses/MIT
 *	 Copyright (c) 2017 ByteriX. See http://byterix.com
 */

import UIKit

/// UITableViewDataSource implementation for BxInputController
extension BxInputController : UITableViewDataSource
{

    open func numberOfSections(in tableView: UITableView) -> Int
    {
        return sections.count
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return sections[section].rowBinders.count
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let rowBinder = getRowBinder(for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: rowBinder.row.resourceId, for: indexPath)
        rowBinder.view = cell
        rowBinder.parent = self
        rowBinder.update()
        return cell
    }

}
