
import SwiftUI

struct NumbersRandomWidget: View {
    @State var listOfNumbers: [Int] = []
    @StateObject var model = GameViewModel()
    var body: some View {
        let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

        ScrollView {
            Text("Random Numbers")
                .font(.title2)
                .fontWeight(.heavy)
                .padding(.top)

                .frame(alignment: Alignment.top)
                .onAppear {
                    model.generateListFunction(max: 15)
                }

            VStack(alignment: .leading) {
                LazyVGrid(columns: columns, spacing: 14) {
                    ForEach(0 ..< $model.generateList.count, id: \.self) { v in
                        
                        
                        
                        Text("\(model.generateList[v])").foregroundColor(.white)
                            .font(.body)
                            .background(.black)
                            .padding()
                            .frame(width: 100, height: 50, alignment: Alignment.center)
                            .background(.black)
                            .foregroundColor(.white)
                            .onAppear {
                                listOfNumbers.append(model.generateList[v])
                            }
                    }
                }.padding()
                    .frame(alignment: Alignment.top)
            }

           

            VStack {
                Text("User number")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .padding(.top)

                    .frame(alignment: Alignment.top)
                    .onAppear {
                        // model.generateListFunction(max: 10)
                    }
                TextField("User number",text: $model.magicNumber ).keyboardType(UIKeyboardType.numberPad)
                
                    .onSubmit {
                        
                        
                    }
                    
                    .disableAutocorrection(true)
                    .padding()
                    .background(.white)
                    .overlay(Rectangle().stroke(lineWidth: 1).foregroundColor(.black))
                    .cornerRadius(.pi)
                    .frame(width: UIScreen.main.bounds.size.width - 20, height: 100)
                
                let n = Int(model.magicNumber) ?? 0
                
                ScrollView(.vertical) {
                    
                    ListCommonInput(columns,n)
                }.overlay(Rectangle().stroke(lineWidth: 1).foregroundColor(.black))
                
                .frame(width: UIScreen.main.bounds.size.width - 20, height: 150).padding()

            }.padding()

            Spacer()
            Spacer()
        }
    }
}

struct NumbersRandomWidget_Previews: PreviewProvider {
    static var previews: some View {
        NumbersRandomWidget()
    }
}
