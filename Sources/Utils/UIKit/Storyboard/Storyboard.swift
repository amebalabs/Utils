import UIKit

extension UIStoryboard {
    func instantiateViewController<VC: UIViewController>() -> VC {
        guard let vc = self.instantiateViewController(withIdentifier: VC.reusableIdentifier) as? VC
            else {fatalError("Can't instantionate the view controller: \(String(describing: VC.self))")
        }
        return vc
    }
}
