
import SwiftUI

struct MainView: View {
    @State private var text = ""
    let buttons = ["Главная", "Акции", "Подборки", "Читай-журнал", "Циклы"]
    @State private var selectedItems: Int = 0
    @State private var showBtn1 = false
    @State private var showBtn2 = false
    @State private var showBtn3 = false
    @State private var showBtn4 = false
    @State private var showBtn5 = false
    @State private var showBtn6 = false
    @State private var showBtn7 = false
    @State private var showBtn8 = false
    @State private var showRectangle = false
    @State private var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
        
        
        NavigationStack {/*Start NavigationStack*/
                ZStack {
                    VStack(spacing: 0) {/*Start VStack*/
                        VStack {/*Start VStack*/
                            NavigationLink("Поиск", destination: Screen2())
                                .foregroundColor(.gray)
                                .frame(width: 350, height: 40)
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding(.top, 16)
                            
                            ScrollView(.horizontal, showsIndicators: false) {/*Start ScrollView*/
                                HStack(spacing: 16) {/*Start HStack*/
                                    
                                    ForEach(buttons.indices, id: \.self) {
                                        index in
                                        Button(action: {
                                            withAnimation {
                                                selectedItems = index
                                            }
                                        }) {
                                            Text(buttons[index])
                                                .underline(selectedItems == index, color: .white)
                                                .foregroundColor(selectedItems == index ? .white : .white.opacity(0.6))
                                        }.font(.title)
                                        
                                        
                                    }
                                    
                                }/*End HStack*/.padding(.horizontal)
                            }/*End ScrollView*/.padding(.vertical, 12)
                        }/*End VStack*/.frame(maxWidth: .infinity)
                            .background(Color(UIColor.systemBlue))
                        
                            
                        TabView(selection: $selectedItems) {
                            pageContentMain()
                                .tag(0)
                                .gesture(DragGesture().onChanged { _ in })
                            pageContentDiscount()
                                .tag(1)
                                .gesture(DragGesture().onChanged { _ in })
                            pageContentFavorite()
                                .tag(2)
                                .gesture(DragGesture().onChanged{ _ in})
                            pageContentChitai()
                                .tag(3)
                                .gesture(DragGesture().onChanged{_ in})
                            pageContentCicles()
                                .tag(4)
                                .gesture(DragGesture().onChanged{_ in})
                            
                        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Отключаем индикатор
                            .frame(maxHeight: .infinity)
                            .background(Color.white)
                    }
                    if showRectangle {
                        Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    showRectangle.toggle()
                                }
                            }
                        VStack {
                            Spacer()
                            // Центрирование по горизонтали через HStack
                            HStack {
                                Spacer()
                                VStack {
                                    Image("keymark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .padding()
                                    Text("Для того, чтобы добавить в закладки, необходимо войти в личный кабинет")
                                        .frame(width: 250)
                                        .padding()
                                    Button(action: {
                                        withAnimation(.spring()) {
                                            showBlock = true
                                            showRectangle = false
                                        }
                                    }, label: {
                                        Text("Войти")
                                            .foregroundColor(.white)
                                            .frame(width: 230, height: 40)
                                            .background(Color(UIColor.systemBlue))
                                    }).cornerRadius(5)
                                        .padding()
                                    /*.padding()
                                     .background(Color.white)
                                     .cornerRadius(4)
                                     .shadow(radius: 5)*/
                                }.background(Color.white).cornerRadius(4)
                                    .shadow(radius: 5)
                                
                                Spacer()
                            }
                            
                            Spacer()
                        }
                        // Эффект появления из низа
                        .transition(.move(edge: .bottom))
                        // Чтобы вьюшка была поверх остального контента
                        .zIndex(1)
                        
                    }
        
    }
            
            .toolbar {
                
            }.background(Color(UIColor.systemBlue))
        
        }/*End NavigationStack*/.fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .environmentObject(countCart)
    

    }
    
    private func pageContentDiscount() -> some View {
        Text("КАКОЙ ЛИБО КОНТЕНТ ПО АКЦИЯМ")
            .font(.largeTitle)
            .foregroundColor(.red)
    }
    private func pageContentFavorite() -> some View {
        Text("КАКОЙ ЛИБО КОНТЕНТ ПО ПОДБОРКАМ КНИГ ДЛЯ ПОЛЬЗОВАТЕЛЯ")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
    private func pageContentChitai() -> some View {
        Text("ЭКСКЛЮЗИВНЫЕ ПРЕДЛОЖЕНИЯ ДЛЯ ПОЛЬЗОВАТЕЛЕЙ")
            .font(.largeTitle)
            .foregroundColor(.yellow)
    }
    private func pageContentCicles() -> some View {
        Text("ЦИКЛЫ КНИГ")
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
    private func pageContentMain() -> some View {
        ScrollView {
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                VStack {
                    HStack {
                        createBook(image: "book1", title: "Если все кошки в мире исчезнут", author: "Кавамура Гэнки", price: "330", discount: "-22%", buyButton: $showBtn1)
                        createBook(image: "book2", title: "Круть", author: "Пелевин Виктор Олегович", price: "330", discount: "-22%", buyButton: $showBtn2)
                        createBook(image: "book3", title: "Бог всегда путешествует инкогнито", author: "Гунель Лоран", price: "323", discount: "-24%", buyButton: $showBtn3)
                        createBook(image: "book4", title: "Бойцовский клуб", author: "Паланик Чак", price: "349", discount: "-22%", buyButton: $showBtn4)
                        createBook(image: "book5", title: "Скорбь Сатаны", author: "Корелли Мария", price: "321", discount: "-22%", buyButton: $showBtn5)
                        createBook(image: "book6", title: "1984 (новый перевод)", author: "Оруэлл Джордж", price: "312", discount: "-22%", buyButton: $showBtn6)
                        createBook(image: "book7", title: "Преступление и наказание", author: "Достоевский Федор Михайлович", price: "360", discount: "-20%", buyButton: $showBtn7)
                        createBook(image: "book8", title: "Человек недостойный", author: "Дадзай Осаму", price: "420", discount: "-22%", buyButton: $showBtn8)
                    }
                }.frame(height: 350)
            }
            Rectangle()
                .frame(height: 5)
                .foregroundColor(.gray)
            VStack {
                HStack {
                    createBook(image: "book1", title: "Если все кошки в мире исчезнут", author: "Кавамура Гэнки", price: "330", discount: "-22%", buyButton: $showBtn1)
                    createBook(image: "book2", title: "Круть", author: "Пелевин Виктор Олегович", price: "330", discount: "-22%", buyButton: $showBtn2)
                }
                HStack {
                    createBook(image: "book6", title: "1984 (новый перевод)", author: "Оруэлл Джордж", price: "312", discount: "-22%", buyButton: $showBtn3)
                    createBook(image: "book7", title: "Преступление и наказание", author: "Достоевский Федор Михайлович", price: "360", discount: "-20%", buyButton: $showBtn7)
                }
                HStack {
                    createBook(image: "book3", title: "Бог всегда путешествует инкогнито", author: "Гунель Лоран", price: "323", discount: "-24%", buyButton: $showBtn3)
                    createBook(image: "book4", title: "Бойцовский клуб", author: "Паланик Чак", price: "349", discount: "-22%", buyButton: $showBtn6)
                }
                HStack {
                    createBook(image: "book13", title: "Метро 2033", author: "Глуховсктй Дмитрий Алексеевич", price: "1 471", discount: "-24%", buyButton: $showBtn5)
                    createBook(image: "book14", title: "Автостопом по галактике", author: "Адам Дуглас", price: "339", discount: "-22%", buyButton: $showBtn2)
                }
                HStack {
                    createBook(image: "book15", title: "Atomic Heart. Предыстория", author: "Хорф Харальд", price: "901", discount: "-22%", buyButton: $showBtn3)
                    createBook(image: "book16", title: "Метро 2034", author: "Глуховский Дмитрий Алексеевич", price: "1 471", discount: "-22%", buyButton: $showBtn4)
                }
            }
        }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
    }

private func createBook(image: String, title: String, author: String, price: String, discount: String, buyButton: Binding<Bool>) -> some View {
    VStack(alignment: .leading) {
        Image(image)
    .resizable()
    .aspectRatio(contentMode: .fit)
    .frame(width: 150, height: 150)
    HStack {
    ForEach(0..<5) { _ in
    Image(systemName: "star.fill")
    .resizable()
    .aspectRatio(contentMode: .fit)
    .frame(width: 12, height: 12)
    .foregroundColor(.yellow)
    }
    Text("201•")
    Image(systemName: "ellipsis.bubble")
    }
        Text(title)
        Text(author)
    .foregroundColor(.gray)
    Spacer()
    HStack {
        Text(price + "₽")
    Spacer()
        Text(discount)
    .font(.subheadline)
    .foregroundColor(.red)
    }
    HStack {
    Button(action: {
        if !buyButton.wrappedValue {
    countCart.badgeItems += 1
    }
        buyButton.wrappedValue.toggle()
    }, label: {
        Text(buyButton.wrappedValue ? "Оформить"  : "Купить")
    .frame(width: 120, height: 35)
    .background(buyButton.wrappedValue ? Color(UIColor.systemGreen) : Color(UIColor.systemBlue))
    .foregroundColor(.white)
    .cornerRadius(5)
    
    })
    Button(action: {
        withAnimation(.spring()) {
            showRectangle.toggle()
        }
    }, label: {
    Image(systemName: "bookmark.fill")
    .resizable()
    .foregroundColor(Color(UIColor.systemBlue))
    .aspectRatio(contentMode: .fit)
    .frame(width: 25, height: 20)
    .padding(5)
    .background(Color.white)
    .cornerRadius(5)
    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
    
    })
    }
    }.frame(width: 170)
    .padding()
    }
   
}






struct Screen2: View {
    @Environment(\.dismiss) var dismiss
    @State var text = ""
    var body: some View {
        VStack {
            Text("")
        }
            
        .toolbar(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        
        VStack {
            HStack {
                TextField("Найти книгу или товар", text: $text)
                    .padding(10)
                    .background(Color.gray.opacity(0.1))
                    .frame(width: 280, height: 40)
                    .cornerRadius(5)
                Button("Отмена") {
                    dismiss()
                }.foregroundColor(Color(UIColor.systemBlue))
            }
        }
        Spacer()
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Популярные запросы")
                        .padding(.bottom)
                        .bold()
                    Text("гарри поттер")
                    Divider()
                    Text("анна джейн")
                    Divider()
                    Text("лето в пионерском лагере")
                    Divider()
                    Text("лисья нора")
                    Divider()
                    Text("граф монте кристо")
                }
                    Spacer()
                
            }
            Spacer()
        }
        .padding(.leading, 30)
            
        
        
        
        
    }
}

