import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader = ImageLoader()
    @State var image:UIImage = UIImage()
    @State var dataImage: Data = Data()
    
    init(withURL url:String) {
        getImage()
    }
    
    func getImage() {
        var data = Data()
        imageLoader.getImage(urlString: "https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg") { Data in
            data = Data
        }
        
        self.dataImage = data
    }
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100, height:100)
        }.onReceive(imageLoader.objectWillChange) { data in
            self.image = UIImage(data: self.dataImage) ?? UIImage()
        }
        .onAppear {
            getImage()
            self.image = UIImage(data: self.dataImage) ?? UIImage()
        }
    }
}
struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL: "")
    }
}
