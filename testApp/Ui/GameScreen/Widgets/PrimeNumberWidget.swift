//
//  PrimeNumberWidget.swift
//  testApp
//
//  Created by Romeo Betances on 3/9/22.
//

import SwiftUI

struct PrimeNumberWidget: View {
    
    @StateObject var model = GameViewModel()

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        ScrollView(.vertical) {
            Text("Prime numbers")
                .font(.title2)
                .padding()
                .onAppear {
                    model.generateListPrimeNumber(10)
                }
                
            VStack() {
                ListCommon(columns,model.primeNumber)
                
                
                
                
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
                TextField("User number",text: $model.magicNumber).keyboardType(UIKeyboardType.numberPad)
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
            
            
        }
        
        
      
    }
}

struct PrimeNumberWidget_Previews: PreviewProvider {
    static var previews: some View {
        PrimeNumberWidget()
    }
}
