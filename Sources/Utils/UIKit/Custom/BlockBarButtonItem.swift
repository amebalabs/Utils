import UIKit

public class BlockBarButtonItem: UIBarButtonItem {

    private var actionHandler: (() -> Void)?

    public convenience init(title: String?, style: UIBarButtonItem.Style, actionHandler: (() -> Void)?) {
        self.init(title: title, style: style, target: nil, action: #selector(barButtonItemPressed))
        self.target = self
        self.actionHandler = actionHandler
    }

    public convenience init(image: UIImage?, style: UIBarButtonItem.Style, actionHandler: (() -> Void)?) {
        self.init(image: image, style: style, target: nil, action: #selector(barButtonItemPressed))
        self.target = self
        self.actionHandler = actionHandler
    }

    @objc func barButtonItemPressed(sender: UIBarButtonItem) {
        actionHandler?()
    }
}
