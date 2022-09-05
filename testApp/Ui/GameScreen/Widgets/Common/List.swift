import Foundation
import SwiftUI

func ListCommonInput(_ columns: [GridItem], _ data: Int) -> some View {
    var numbers: [Int] = []

    for item in 0 ..< data {
        let n = Int.random(in: item ..< 10 + item * 8)
        numbers.append(n)
    }

    return LazyVGrid(columns: columns, spacing: 14) {
        ForEach(0 ..< numbers.unique().count, id: \.self) { v in

            Text("\(numbers.unique()[v])").foregroundColor(.white)
                .font(.body)
                .background(.black)
                .padding()
                .frame(width: 100, height: 50, alignment: Alignment.center)
                .background(.black)
                .foregroundColor(.white)
        }
    }.padding()
        .frame(alignment: Alignment.top)
}
func ListCommon(_ columns: [GridItem], _ data: [Int]) -> some View {
    var numbers: [Int] = []

    for item in 0 ..< data.unique().count {
        let n = Int.random(in: item ..< 10 + item * 8)
        numbers.append(n)
    }

    return LazyVGrid(columns: columns, spacing: 14) {
        ForEach(0 ..< numbers.unique().count, id: \.self) { v in

            Text("\(numbers.unique()[v])").foregroundColor(.white)
                .font(.body)
                .background(.black)
                .padding()
                .frame(width: 100, height: 50, alignment: Alignment.center)
                .background(.black)
                .foregroundColor(.white)
        }
    }.padding()
        .frame(alignment: Alignment.top)
        
}
