import UIKit

extension UICollectionView {
    func registerCell<Cell: UICollectionViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.reusableIdentifier)
    }

    func dequeueReusableCell<Cell: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: Cell.reusableIdentifier, for: indexPath) as? Cell
            else {fatalError("Fatal error for cell at \(indexPath)")
        }
        return cell
    }
}

