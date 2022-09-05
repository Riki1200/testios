
import SwiftUI

struct ATMWidget: View {
    @State var atmValue = ""

    @StateObject var model = GameViewModel()

    @State var bills: [Int] = []

    @State var monto = "0"

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                let gradient = LinearGradient(colors: [.blue, .cyan], startPoint: .leading, endPoint: .topLeading)
                VStack {
                    Text("TOTAL BALANCE")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding()

                    Text("$5,000")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.leading, -10)
                }.frame(width: UIScreen.main.bounds.size.width - 80, height: 150, alignment: .topLeading)
                    .cornerRadius(10)
                    .background(gradient)
                    .shadow(radius: 10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(gradient, lineWidth: 10))

                VStack {
                    Text("Transaction history")
                        .font(.caption)
                        .padding()

                    Divider()
                    ForEach(1 ..< 6, id: \.self) { data in
                        HStack {
                            let computed = data * Int.random(in: 1 ..< data + 100 * data * 3)

                            Text("+ \(computed) $ \n ATM CASH")
                                .monospacedDigit()
                                .lineLimit(2)
                                .lineSpacing(70)
                                .font(.caption)
                                .padding()

                        }.frame(width: UIScreen.main.bounds.size.width - 40, height: 40, alignment: .leading)

                        Divider()
                    }

                }.padding()

                Spacer().padding()

                VStack {
                    Section("Lista de billetes circulantes en Rep. Dominicana") {
                        ScrollView(.horizontal) {
                            HStack {
                                VStack {
                                    Image("1_pesos")
                                        .resizable()
                                        .frame(width: 100, height: 100)

                                    Text("1 peso dominicano")
                                }.padding(.vertical, 10)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 2))
                                    .shadow(radius: 10)

                                VStack {
                                    Image("5_pesos")
                                        .resizable()
                                        .frame(width: 100, height: 100)

                                    Text("5 peso dominicano")
                                }.padding(.vertical, 10)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 2))
                                    .shadow(radius: 10)

                                VStack {
                                    Image("10_pesos")
                                        .resizable()
                                        .frame(width: 100, height: 100)

                                    Text("10 peso dominicano")
                                }.padding(.vertical, 10)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 2))
                                    .shadow(radius: 10)

                                VStack {
                                    Image("25_pesos")
                                        .resizable()
                                        .frame(width: 100, height: 100)

                                    Text("25 peso dominicano")
                                }.padding(.vertical, 10)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 2))
                                    .shadow(radius: 10)

                                VStack {
                                    Image("50_billetes")
                                        .resizable()
                                        .frame(width: 150, height: 100)

                                    Text("50 billetes dominicano")
                                }.padding(.vertical, 10)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 2))
                                    .shadow(radius: 10)

                                VStack {
                                    Image("100_billetes")
                                        .resizable()
                                        .frame(width: 150, height: 100)

                                    Text("100 billetes dominicano")
                                }.padding(.vertical, 10)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 2))
                                    .shadow(radius: 10)

                                VStack {
                                    Image("200_billetes")
                                        .resizable()
                                        .frame(width: 150, height: 100)

                                    Text("200 billetes dominicano")
                                }.padding(.vertical, 10)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 2))
                                    .shadow(radius: 10)
                                VStack {
                                    Image("500_billetes")
                                        .resizable()
                                        .frame(width: 150, height: 100)

                                    Text("500 billetes dominicano")
                                }.padding(.vertical, 10)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 2))
                                    .shadow(radius: 10)
                                VStack {
                                    Image("1000_billetes")
                                        .resizable()
                                        .frame(width: 150, height: 100)

                                    Text("1000 billetes dominicano")
                                }.padding(.vertical, 10)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 2))
                                    .shadow(radius: 10)
                                VStack {
                                    Image("2000_billetes")
                                        .resizable()
                                        .frame(width: 150, height: 100)

                                    Text("2000 billetes dominicano")
                                }.padding(.vertical, 10)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 2))
                                    .shadow(radius: 10)

                            }.padding()
                        }

                    }.font(.caption)
                        .multilineTextAlignment(.leading)
                }

                Spacer().padding()
                    .onAppear {
                    }
                VStack {
                    HStack {
                        VStack {
                            Text("Ingrese un monto")
                                .fontWeight(.black)
                                .padding()
                                .font(.title3)
                                
                            TextField("Add amount", text: $model.amount)
                                .overlay(Rectangle().stroke(lineWidth: 1).padding())
                                .font(.caption)
                                .disableAutocorrection(true)
                                .frame(alignment: Alignment.top)

                            Rectangle().frame(width: UIScreen.main.bounds.size.width - 40, height: 1)
                                .padding(.horizontal, 20)
                                .foregroundColor(.black)

                        }.padding(.vertical, 10)
                            .frame(width: UIScreen.main.bounds.size.width - 40, alignment: Alignment.trailing)

                    }.padding(.horizontal, -30)
                        .frame(width: UIScreen.main.bounds.size.width - 40, alignment: Alignment.trailing)

                    ForEach(0 ..< model.getBills(m: Int(model.amount) ?? 0).reversed().count, id: \.self) { v in
                        HStack {
                            let value = model.getBills(m: Int(model.amount) ?? 0)[v]
                            let bill = model.bills.reversed()[v]

                            Text("$\(bill)")
                                .monospacedDigit()
                                .lineLimit(2)
                                .lineSpacing(70)
                                .font(.caption)
                                .padding()

                            Spacer()

                            Text("$\(value)")
                                .monospacedDigit()
                                .lineLimit(2)
                                .lineSpacing(70)
                                .font(.caption)
                                .padding(.leading, 100)

                        }.frame(width: UIScreen.main.bounds.size.width - 40, height: 40, alignment: .leading)

                        Divider()
                    }

                }.frame(alignment: Alignment.center)

            }.padding()
        }
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 08) & 0xFF) / 255,
            blue: Double((hex >> 00) & 0xFF) / 255,
            opacity: alpha
        )
    }
}

struct ATMWidget_Previews: PreviewProvider {
    static var previews: some View {
        ATMWidget()
    }
}
