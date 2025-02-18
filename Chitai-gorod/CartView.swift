
import SwiftUI

struct CartView: View {
    @State var showBlock = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        Text("Корзина")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .padding(.top, 30)
                        Spacer()
                    }
                }.frame(maxWidth: .infinity, maxHeight: 130).background(Color(UIColor.systemBlue))
                Spacer()
                
                Image("cats")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 200, height: 200)
                Text("Ваша корзина сейчас пуста. Перейдите в каталог, чтобы найти интересные книги.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(width: 250)
                Spacer()
                Spacer()
            }.background(Color.white)
        }
        
            }
    }
