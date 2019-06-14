import UIKit

extension UICollectionView {
    func deququeReusableCell<Cell: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: Cell.reusableIdentifier, for: indexPath) as? Cell
            else {fatalError("Fatal error for cell at \(indexPath)")
        }
        return cell
    }
}

