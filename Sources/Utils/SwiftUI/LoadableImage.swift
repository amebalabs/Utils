//import SwiftUI
//
//@available(iOS 13.0, *)
//struct LoadableImage : View {
//    @State var remoteImage: RemoteImage
//
//    var body: some View {
//        ZStack {
//            if remoteImage.image != nil {
//                Image(uiImage: remoteImage.image!)
//                    .resizable()
//                    .renderingMode(.original)
//                    .frame(width: 300, height: 169)
//                    .cornerRadius(5)
//                    .shadow(radius: 10)
//            } else {
//                Rectangle()
//                    .foregroundColor(.gray)
//                    .frame(width: 300, height: 169)
//                    .cornerRadius(5)
//                    .shadow(radius: 10)
//            }
//            }.onAppear {
//                self.remoteImage.download()
//        }
//    }
//}
