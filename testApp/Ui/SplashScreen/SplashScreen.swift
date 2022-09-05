//
//  SplashScreen.swift
//  testApp
//
//  Created by Romeo Betances on 1/9/22.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive: Bool = false
    
    var body: some View {
        
        VStack {
            
            if self.isActive {
                MainScreenNavigation()
            }else {
                
                
                    VStack () {
                        Text("Everything you need to know")
                            .font(Font.title)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.black)
                            .lineLimit(4)
                            .frame(width: 320, height: 100, alignment: Alignment.center)
                            .background(.white)
                            .overlay(
                                Rectangle().stroke(lineWidth: 4)
                                    .position(x: 155, y: 60)
                                    
                                    .colorInvert()
                            
                            )
                        
                        
                            
                    }.frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: Alignment.center)
                        .background(.black)
                
            
                    
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
