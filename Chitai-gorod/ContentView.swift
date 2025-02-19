
import SwiftUI


struct ContentView: View {
    @StateObject var countCart = CountCart()
    var body: some View {
            ZStack {
                TabView {
                    MainView()
                        .tabItem {
                            Label("Главная", systemImage: "house")
                        }.toolbarBackground(.visible, for: .tabBar)
                        .toolbarBackground(Color.gray.opacity(0.1), for: .tabBar)
                    CatalogView()
                        .tabItem {
                            Label("Каталог", systemImage: "books.vertical")
                        }.toolbarBackground(.visible, for: .tabBar)
                        .toolbarBackground(Color.gray.opacity(0.1), for: .tabBar)
                    CartView()
                        .tabItem {
                            Label("Корзина", systemImage: "cart")
                            
                        }.badge(countCart.badgeItems).toolbarBackground(.visible, for: .tabBar)
                        .toolbarBackground(Color.gray.opacity(0.1), for: .tabBar)
                    
                
                    BookmarkView()
                        .padding()
                        .tabItem {
                            Label("Закладки", systemImage: "bookmark")
                        }.toolbarBackground(.visible, for: .tabBar)
                        .toolbarBackground(Color.gray.opacity(0.1), for: .tabBar)
                    ProfileView()
                        .tabItem {
                            Label("Профиль", systemImage: "person")
                        }.toolbarBackground(.visible, for: .tabBar)
                        .toolbarBackground(Color.gray.opacity(0.1), for: .tabBar)
                    
                    
                    
                }.environmentObject(countCart)
            }
      
        
        }
    }




#Preview {
    ContentView()
}



