
import SwiftUI


struct ContentView: View {
    @StateObject var countCart = CountCart()
    @State var selectedTag = 0
    var body: some View {
            ZStack {
                TabView(selection: $selectedTag) {
                    MainView()
                        .tabItem {
                            Label("Главная", systemImage: "house")
                                .tag(0)
                        }.toolbarBackground(.visible, for: .tabBar)
                        .toolbarBackground(Color.gray.opacity(0.1), for: .tabBar)
                    CatalogView()
                        .tag(1)
                        .tabItem {
                            Label("Каталог", systemImage: "books.vertical")
                        }.toolbarBackground(.visible, for: .tabBar)
                        .toolbarBackground(Color.gray.opacity(0.1), for: .tabBar)
                    CartView()
                        .tag(3)
                        .tabItem {
                            Label("Корзина", systemImage: "cart")
                            
                        }.badge(countCart.badgeItems).toolbarBackground(.visible, for: .tabBar)
                        .toolbarBackground(Color.gray.opacity(0.1), for: .tabBar)
                    
                
                    BookmarkView()
                        .tag(4)
                        .padding()
                        .tabItem {
                            Label("Закладки", systemImage: "bookmark")
                        }.toolbarBackground(.visible, for: .tabBar)
                        .toolbarBackground(Color.gray.opacity(0.1), for: .tabBar)
                    ProfileView()
                        .tag(5)
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



