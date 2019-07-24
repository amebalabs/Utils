//import SwiftUI
//import UIKit
//import Combine
//
//@available(iOS 13.0, *)
//final class RemoteImage: BindableObject {
//    let willChange = PassthroughSubject<RemoteImage,Never>()
//    private let url: URL
//    private let placeholderImage: UIImage? = nil
//
//    var image: UIImage? = nil {
//        willSet {
//            willChange.send(self)
//        }
//    }
//
//    init(url: URL) {
//        self.url = url
//    }
//
//    public func download() {
//        DispatchQueue.global(qos: .background).async {
//            URLSession.shared.dataTask(with: self.url) { [weak self] (data, _, _) in
//                guard let strongSelf = self, let data = data else { return }
//                DispatchQueue.main.async {
//                    strongSelf.image = UIImage(data: data) ?? strongSelf.placeholderImage
//                }
//                }.resume()
//        }
//    }
//}
