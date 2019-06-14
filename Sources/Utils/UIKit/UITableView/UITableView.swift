import UIKit

extension UITableView {
    func registerCell<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reusableIdentifier)
    }

    func deququeReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.reusableIdentifier, for: indexPath) as? Cell
            else {fatalError("Fatal error for cell at \(indexPath)")
        }
        return cell
    }
}

