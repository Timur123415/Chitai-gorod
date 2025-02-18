//
//  CatalogView.swift
//  Chitai-gorod
//
//  Created by Тимур Белов  on 07.02.2025.
//

import SwiftUI

struct CatalogView: View {
    @State private var text = ""
    let buttons = ["Книги", "Канцтовары", "Подарки и сувениры", "Игры и игрушки", "Творчество и хобби", "Товары для художников", "Распродажа"]
    let sfsymbols = ["book.closed", "applepencil.tip", "gift", "puzzlepiece", "clipboard", "paintpalette", "rublesign.circle"]
    @State private var selectedItems: Int = 0
    @State private var showBtn1 = false
    @State private var showBtn2 = false
    @State private var showBtn3 = false
    @State private var showBtn4 = false
    @State private var showRectangle = false
    @State private var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
                                
                                NavigationStack {/*Start NavigationStack*/
                                    ZStack {
                                    
                                        
                                            VStack(spacing: 0) {/*Start VStack*/
                                                
                                                VStack {/*Start VStack*/
                                                    
                                                    NavigationLink{
                                                        Screen2()
                                                    } label: {
                                                        Text("Поиск")
                                                            .foregroundColor(.gray)
                                                    }
                                                    .frame(width: 350, height: 40)
                                                    .background(Color.white)
                                                    .cornerRadius(10)
                                                    .padding(.top, 16)
                                                    ScrollView(.horizontal, showsIndicators: false) {/*Start ScrollView*/
                                                        HStack(spacing: 16) {/*Start HStack*/
                                                            
                                                            ForEach(buttons.indices, id: \.self) {
                                                                index in
                                                                Button(action: {
                                                                    withAnimation { selectedItems = index
                                                                    }
                                                                }) {
                                                                    Label {
                                                                        Text(buttons[index])
                                                                            .underline(selectedItems == index, color: .white)
                                                                            .foregroundColor(selectedItems == index ? .white : .white.opacity(0.6))
                                                                    } icon: {
                                                                        Image(systemName: sfsymbols[index])
                                                                            .foregroundColor(selectedItems == index ? .white : .white.opacity(0.6))
                                                                        
                                                                    }
                                                                }.font(.title)
                                                            }
                                                            
                                                        } /*End HStack*/.padding(.horizontal)
                                                    } /*End ScrollView*/.padding(.vertical, 12)
                                                    } /*End VStack*/.frame(maxWidth: .infinity)
                                                    .background(Color(UIColor.systemBlue))
                                                
                                                TabView(selection: $selectedItems) {
                                                    pageContent1()
                                                        .tag(0)
                                                        .gesture(DragGesture().onChanged{_ in})
                                                    pageContent2()
                                                        .tag(1)
                                                        .gesture(DragGesture().onChanged{_ in})
                                                    pageContent3()
                                                        .tag(2)
                                                        .gesture(DragGesture().onChanged{_ in})
                                                    pageContent4()
                                                        .tag(3)
                                                        .gesture(DragGesture().onChanged{_ in})
                                                    pageContent5()
                                                        .tag(4)
                                                        .gesture(DragGesture().onChanged{_ in})
                                                    pageContent6()
                                                        .tag(5)
                                                        .gesture(DragGesture().onChanged{_ in})
                                                    pageContent7()
                                                        .tag(6)
                                                        .gesture(DragGesture().onChanged({ _ in}))
                                                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Отключаем индикатор
                                                    .frame(maxHeight: .infinity)
                                                    .background(Color.white)
                                                
                                                
                                                
                                                
                                                    
                                        }
                                        if showRectangle {
                                            Color.black.opacity(0.3)
                                                .ignoresSafeArea()
                                                // При нажатии за пределами попапа — скрываем его
                                                .onTapGesture {
                                                    withAnimation(.spring()) {
                                                        showRectangle.toggle()
                                                    }
                                                }
                                            
                                            
                                            VStack {
                                                VStack {
                                                    Image("keymark")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 100, height: 100)
                                                        .padding()
                                                    Text("Для того, чтобы добавить в закладки, необходимо войти в личный кабинет")
                                                        .multilineTextAlignment(.center)
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
                                                    })
                                                    .cornerRadius(5)
                                                    .padding()
                                                }
                                                .background(Color.white)
                                                .cornerRadius(4)
                                                .shadow(radius: 5)
                                            }
                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                            .transition(.move(edge: .bottom))
                                            .zIndex(1)
                                        }
                                    }
                                    .toolbar {
                                       
                                    }.background(Color(UIColor.systemBlue))
                                }/*End NavigationStack*/
                                .fullScreenCover(isPresented: $showBlock) {
                                    ScreenView(showBlock: $showBlock)
                                }
                                .environmentObject(countCart)
                                
                            }
    
    private func pageContent7() -> some View {
        Text("Page 7")
    }
    
                            private func pageContent1() -> some View {
                                ScrollView {
                                    
                                    List {
                                        NavigationLink(destination: Screen4(), label: {
                                            Text("Художественная литература")
                                        })
                                        NavigationLink(destination: Screen13(), label: {
                                            Text("Комиксы")
                                        })
                                        NavigationLink(destination: Screen14(), label: {
                                            Text("Манга")
                                        })
                                        NavigationLink(destination: Screen15(), label: {
                                            Text("Книги на английском языке")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Книги на иностранном языке")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Филология")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Детские книги")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Книги для подростков")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Образование")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Эзотерика")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Медицина и здоровье")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Красота. Мода. Этикет")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Кулинария")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Дом и хобби")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Наука. Техника. IT")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Религия и философия")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Психология")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Искусство")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Экономика. Менеджмент. Маркетинг")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("История. Общество")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Право")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Книги с автографами")
                                        })
                                    }.frame(height: 1050)
                                    Spacer()
                                    
                                    ScrollView {
                                        VStack {
                                            HStack {
                                                createBook(image: "book5", title: "Скорбь Сатаны", author: "Корелли Мария", price: "321", discount: "-22%", buyButton: $showBtn1)
                                                createBook(image: "book6", title: "1984 (новый перевод)", author: "Оруэлл Джордж", price: "312", discount: "-22%", buyButton: $showBtn2)
                                            }
                                            HStack {
                                                createBook(image: "book7", title: "Преступление и наказание", author: "Достоевский Федор Михайлович", price: "360", discount: "-20%", buyButton: $showBtn3)
                                                createBook(image: "book8", title: "Человек недостойный", author: "Дадзай Осаму", price: "420", discount: "-22%", buyButton: $showBtn4)
                                            }
                                        }
                                    }
                                
                            
                            
                        }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.white)
                            .navigationBarBackButtonHidden(true)
                                                    }
                            private func pageContent2() -> some View {
                                ScrollView {
                                    
                                    List {
                                        NavigationLink(destination: Screen4(), label: {
                                            Text("Ручки, карандаши, маркеры")
                                        })
                                        NavigationLink(destination: Screen13(), label: {
                                            Text("Тетради, блокноты, ежедневники")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Бумага и бумажные изделия")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Канцтовары для школы")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Офисные принадлежности")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Чертёжные принадлежности")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Подарочные наборы")
                                        })
                                        NavigationLink(destination: Screen2(), label: {
                                            Text("Календари 2025")
                                        })
                                    }.frame(height: 450)
                                    Spacer()
                                    
                                    ScrollView {
                                        VStack {
                                            HStack {
                                                createBook(image: "book5", title: "Скорбь Сатаны", author: "Корелли Мария", price: "321", discount: "-22%", buyButton: $showBtn1)
                                                createBook(image: "book6", title: "1984 (новый перевод)", author: "Оруэлл Джордж", price: "312", discount: "-22%", buyButton: $showBtn2)
                                            }
                                            HStack {
                                                createBook(image: "book7", title: "Преступление и наказание", author: "Достоевский Федор Михайлович", price: "360", discount: "-20%", buyButton: $showBtn3)
                                                createBook(image: "book8", title: "Человек недостойный", author: "Дадзай Осаму", price: "420", discount: "-22%", buyButton: $showBtn4)
                                            }
                                        }
                                    }
                                
                            
                            
                        }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.white)
                            .navigationBarBackButtonHidden(true)                                                    }
                            private func pageContent3() -> some View {
                                                        Text("Page3")
                                                    }
                            private func pageContent4() -> some View {
                                                        Text("Page4")
                                                    }
                            private func pageContent5() -> some View {
                                                        Text("Page5")
                                                    }
                            private func pageContent6() -> some View {
                                                        Text("Page6")
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
        





struct Screen4: View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    @Environment(\.dismiss) var dismiss
    @State var showBtn1 = false
    @State var showBtn2 = false
    @State var showBtn3 = false
    @State var showBtn4 = false
    @State var showRectangle = false
    @State var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
        
        NavigationStack {/*Start NavigationStack*/
            ZStack {
            ScrollView {
                
    
                    VStack(spacing: 0) {/*Start VStack*/
                        
                        
                        
                        Spacer()
                        
                        List {
                            NavigationLink(destination: Screen5(), label: {
                                Text("Современная проза")
                            })
                            NavigationLink(destination: Screen6(), label: {
                                Text("Классическая проза")
                            })
                            NavigationLink(destination: Screen7(), label: {
                                Text("Фантастика. Фэнтези")
                            })
                            NavigationLink(destination: Screen2(), label: {
                                Text("Детектив. Триллер")
                            })
                            NavigationLink(destination: Screen2(), label: {
                                Text("Любовные романы")
                            })
                            NavigationLink(destination: Screen2(), label: {
                                Text("Исторические романы")
                            })
                            NavigationLink(destination: Screen2(), label: {
                                Text("Приключения")
                            })
                            NavigationLink(destination: Screen2(), label: {
                                Text("Биография. Мемуары")
                            })
                            NavigationLink(destination: Screen2(), label: {
                                Text("Публицистика")
                            })
                            NavigationLink(destination: Screen2(), label: {
                                Text("Поэзия")
                            })
                            NavigationLink(destination: Screen2(), label: {
                                Text("Фольклор")
                            })
                            NavigationLink(destination: Screen2(), label: {
                                Text("Афоризмы. Цитаты")
                            })
                            NavigationLink(destination: Screen2(), label: {
                                Text("Юмор. Сатира")
                            })
                            NavigationLink(destination: Screen2(), label: {
                                Text("Молодежная проза")
                            })
                            NavigationLink(destination: Screen2(), label: {
                                Text("Зарубежная литература")
                            })
                            NavigationLink(destination: Screen2(), label: {
                                Text("Российская литература")
                            })
                        }.frame(height: 770)
                        Spacer()
                        
                        ScrollView {
                            VStack {
                                HStack {
                                    createBook(image: "book1", title: "Если все кошки в мире исчезнут", author: "Кавамура Гэнки", price: "330", discount: "-22%", buyButton: $showBtn1)
                                    createBook(image: "book2", title: "Круть", author: "Пелевин Виктор Олегович", price: "330", discount: "-22%", buyButton: $showBtn2)
                                }
                                HStack {
                                    createBook(image: "book3", title: "Бог всегда путешествует инкогнито", author: "Гунель Лоран", price: "323", discount: "-24%", buyButton: $showBtn3)
                                    createBook(image: "book4", title: "Бойцовский клуб", author: "Паланик Чак", price: "349", discount: "-22%", buyButton: $showBtn4)
                                }
                            }
                        }
                        
                        
                        
                    }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                        .navigationBarBackButtonHidden(true)
                        
                    }
                
                if showRectangle {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        // При нажатии за пределами попапа — скрываем его
                        .onTapGesture {
                            withAnimation(.spring()) {
                                showRectangle.toggle()
                            }
                        }
                    
                    // Для того, чтобы попап точно был по центру,
                    // можно использовать ZStack с maxWidth/Height и .center alignment.
                    VStack {
                        // Сам попап (например, контейнер с информацией и кнопкой Войти)
                        VStack {
                            Image("keymark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .padding()
                            Text("Для того, чтобы добавить в закладки, необходимо войти в личный кабинет")
                                .multilineTextAlignment(.center)
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
                            })
                            .cornerRadius(5)
                            .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(4)
                        .shadow(radius: 5)
                    }
                    // Сделаем так, чтобы попап располагался по центру
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
                }
                    
            }
            .navigationTitle("Художественная литература")
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button(action: {dismiss()}, label: {
                        Image("dismiss")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    })
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    NavigationLink(destination: Screen2(), label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .font(.title)
                            .foregroundColor(.white)
                    })
                })
                
            }
        }/*End NavigationStack*/
        .fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .environmentObject(countCart)
        
        
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


struct Screen5: View {
    @Environment(\.dismiss) var dismiss
    @State var showBtn1 = false
    @State var showBtn2 = false
    @State var showBtn3 = false
    @State var showBtn4 = false
    @State var showRectangle = false
    @State var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
        
        NavigationStack {/*Start NavigationStack*/
            ScrollView {
                ZStack {
                    VStack(spacing: 0) {/*Start VStack*/
                        
                        Spacer()
                        
                        
                        VStack {
                            HStack {
                                createBook(image: "book1", title: "Если все кошки в мире исчезнут", author: "Кавамура Гэнки", price: "330", discount: "-22%", buyButton: $showBtn1)
                                createBook(image: "book2", title: "Круть", author: "Пелевин Виктор Олегович", price: "330", discount: "-22%", buyButton: $showBtn2)
                            }
                            HStack {
                                createBook(image: "book3", title: "Бог всегда путешествует инкогнито", author: "Гунель Лоран", price: "323", discount: "-24%", buyButton: $showBtn3)
                                createBook(image: "book4", title: "Бойцовский клуб", author: "Паланик Чак", price: "349", discount: "-22%", buyButton: $showBtn4)
                            }
                        }
                        
                        
                        
                        
                    }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                        .navigationBarBackButtonHidden(true)
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
                
                .navigationTitle("Современная проза")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading, content: {
                        Button(action: {dismiss()}, label: {
                            Image("dismiss")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        })
                    })
                    ToolbarItem(placement: .topBarTrailing, content: {
                        NavigationLink(destination: Screen2(), label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .font(.title)
                                .foregroundColor(.white)
                        })
                    })
                    
                }
            }
        }/*End NavigationStack*/
        .fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .environmentObject(countCart)
        
        
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

struct ScreenView: View {
    @Binding var showBlock: Bool
    @State private var phoneNumber = ""
    private var isPhoneNumberComplete: Bool {
        let digits = phoneNumber.filter {"0123456789".contains($0)}
        return digits.count == 10
    }
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    showBlock = false
                }, label:  {
                    Image("close")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                }).padding()
            }
            Text("Вход и регистрация")
                .font(.largeTitle)
                .bold()
            Text("Чтобы войти или зарегестрироваться, укажите номер телефона.")
                .font(.subheadline)
                .foregroundColor(.gray)
            HStack(spacing: 8) {
                        // Блок с флагом и кодом страны
                        HStack(spacing: 4) {
                            Image("russianflag")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 16)
                                .clipShape(RoundedRectangle(cornerRadius: 3))
                            
                            Text("7+")
                                .font(.subheadline)
                                .foregroundColor(.primary)
                        }
                        .padding(.leading, 8)
                        
                        Divider()
                            .frame(height: 24)
                        
                        // Сам TextField
                        TextField("Введите номер", text: $phoneNumber)
                            .keyboardType(.phonePad)
                            .padding(16)
                            .onChange(of: phoneNumber) { newValue  in
                                           phoneNumber = formatPhoneNumber(newValue)
                                       }

            }.background(Color.gray.opacity(0.2))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .padding()
            Button(action: {}, label: {
                Text("Получить код")
                    .foregroundColor(.white)
                    .frame(width: 370, height: 50)
                    .background(isPhoneNumberComplete ? Color(UIColor.systemBlue) : Color.blue.opacity(0.3))
                    .cornerRadius(10)
            }).disabled(!isPhoneNumberComplete)
            Text("Нажимая кнопку \("Получить код"), вы даете согласие на обработку своих персональных данных в соотвествие с Политикой обработки ПД.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding()
            Spacer()
        }
    }
    private func formatPhoneNumber(_ number: String) -> String {
            // Оставляем только цифры
            let digits = number.filter { "0123456789".contains($0) }
            
            // Ограничиваем ввод до 10 цифр
            let limitedDigits = String(digits.prefix(10))
            let count = limitedDigits.count
            
            var formatted = ""
            // Первые 3 цифры
            if count > 0 {
                let endIndex = limitedDigits.index(limitedDigits.startIndex, offsetBy: min(3, count))
                formatted += limitedDigits[..<endIndex]
            }
            
            // Пробел после первых 3 цифр
            if count > 3 {
                formatted += " "
                let startIndex = limitedDigits.index(limitedDigits.startIndex, offsetBy: 3)
                let endIndex = limitedDigits.index(startIndex, offsetBy: min(3, count - 3))
                formatted += limitedDigits[startIndex..<endIndex]
            }
            
            // Первое тире после 6 цифр
            if count > 6 {
                formatted += "-"
                let startIndex = limitedDigits.index(limitedDigits.startIndex, offsetBy: 6)
                let endIndex = limitedDigits.index(startIndex, offsetBy: min(2, count - 6))
                formatted += limitedDigits[startIndex..<endIndex]
            }
            
            // Второе тире после 8 цифр
            if count > 8 {
                formatted += "-"
                let startIndex = limitedDigits.index(limitedDigits.startIndex, offsetBy: 8)
                let endIndex = limitedDigits.index(startIndex, offsetBy: min(2, count - 8))
                formatted += limitedDigits[startIndex..<endIndex]
            }
            
            return formatted
        }

    }


struct Screen6: View {
    @Environment(\.dismiss) var dismiss
    @State var showBtn1 = false
    @State var showBtn2 = false
    @State var showBtn3 = false
    @State var showBtn4 = false
    @State var showRectangle = false
    @State var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
        
        NavigationStack {/*Start NavigationStack*/
            ScrollView {
                ZStack {
                    VStack(spacing: 0) {/*Start VStack*/
                        
                        Spacer()
                        
                        
                        VStack {
                            HStack {
                                createBook(image: "book5", title: "Скорбь Сатаны", author: "Корелли Мария", price: "321", discount: "-22%", buyButton: $showBtn1)
                                createBook(image: "book6", title: "1984 (новый перевод)", author: "Оруэлл Джордж", price: "312", discount: "-22%", buyButton: $showBtn2)
                            }
                            HStack {
                                createBook(image: "book7", title: "Преступление и наказание", author: "Достоевский Федор Михайлович", price: "360", discount: "-20%", buyButton: $showBtn3)
                                createBook(image: "book8", title: "Человек недостойный", author: "Дадзай Осаму", price: "420", discount: "-22%", buyButton: $showBtn4)
                            }
                        }
                        
                        
                        
                        
                    }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                        .navigationBarBackButtonHidden(true)
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
                .navigationTitle("Классическая проза")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading, content: {
                        Button(action: {dismiss()}, label: {
                            Image("dismiss")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        })
                    })
                    ToolbarItem(placement: .topBarTrailing, content: {
                        NavigationLink(destination: Screen2(), label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .font(.title)
                                .foregroundColor(.white)
                        })
                    })
                    
                }
            }
        }/*End NavigationStack*/
        .fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .environmentObject(countCart)
        
        
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




struct Screen7: View {
    @Environment(\.dismiss) var dismiss
    @State var showBtn1 = false
    @State var showBtn2 = false
    @State var showBtn3 = false
    @State var showBtn4 = false
    @State var showRectangle = false
    @State var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
        
        NavigationStack {/*Start NavigationStack*/
           
                ZStack {
                    ScrollView {
                    
                    
                    
                    VStack(spacing: 0) {/*Start VStack*/
                        
                        
                        Spacer()
                        
                        List {
                            NavigationLink(destination: Screen8(), label: {
                                Text("Фэнтези")
                            })
                            NavigationLink(destination: Screen9(), label: {
                                Text("Фантастический боевик")
                            })
                            NavigationLink(destination: Screen10(), label: {
                                Text("Мистика. Ужасы")
                            })
                            NavigationLink(destination: Screen11(), label: {
                                Text("Научная фантастика")
                            })
                            NavigationLink(destination: Screen12(), label: {
                                Text("Другие жанры фантастики")
                            })
                        }.frame(height: 300)
                        Spacer()
                        
                        ScrollView {
                            VStack {
                                HStack {
                                    createBook(image: "book5", title: "Скорбь Сатаны", author: "Корелли Мария", price: "321", discount: "-22%", buyButton: $showBtn1)
                                    createBook(image: "book6", title: "1984 (новый перевод)", author: "Оруэлл Джордж", price: "312", discount: "-22%", buyButton: $showBtn2)
                                }
                                HStack {
                                    createBook(image: "book7", title: "Преступление и наказание", author: "Достоевский Федор Михайлович", price: "360", discount: "-20%", buyButton: $showBtn3)
                                    createBook(image: "book8", title: "Человек недостойный", author: "Дадзай Осаму", price: "420", discount: "-22%", buyButton: $showBtn4)
                                }
                            }
                        }
                        
                        
                        
                    }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                        .navigationBarBackButtonHidden(true)
                    
                }
                
                if showRectangle {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                    // При нажатии за пределами попапа — скрываем его
                        .onTapGesture {
                            withAnimation(.spring()) {
                                showRectangle.toggle()
                            }
                        }
                    
                    // Для того, чтобы попап точно был по центру,
                    // можно использовать ZStack с maxWidth/Height и .center alignment.
                    VStack {
                        // Сам попап (например, контейнер с информацией и кнопкой Войти)
                        VStack {
                            Image("keymark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .padding()
                            Text("Для того, чтобы добавить в закладки, необходимо войти в личный кабинет")
                                .multilineTextAlignment(.center)
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
                            })
                            .cornerRadius(5)
                            .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(4)
                        .shadow(radius: 5)
                    }
                    // Сделаем так, чтобы попап располагался по центру
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
                }
                
            }
            .navigationTitle("Фантастика. Фэнтези")
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button(action: {dismiss()}, label: {
                        Image("dismiss")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    })
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    NavigationLink(destination: Screen2(), label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .font(.title)
                            .foregroundColor(.white)
                    })
                })
                
            }
        
        }/*End NavigationStack*/
        .fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .environmentObject(countCart)
        
        
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


struct Screen8: View {
    @Environment(\.dismiss) var dismiss
    @State var showBtn1 = false
    @State var showBtn2 = false
    @State var showBtn3 = false
    @State var showBtn4 = false
    @State var showRectangle = false
    @State var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
        
        NavigationStack {/*Start NavigationStack*/
            ScrollView {
                ZStack {
                    VStack(spacing: 0) {/*Start VStack*/
                        
                        Spacer()
                        
                        
                        VStack {
                            HStack {
                                createBook(image: "book9", title: "Четвертое крыло: роман", author: "Яррос Ребекка", price: "1 169", discount: "-24%", buyButton: $showBtn1)
                                createBook(image: "book10", title: "Ужасы Фазбера. В бассейн! (выпуск 1)", author: "Коутон Скотт", price: "671", discount: "-22%", buyButton: $showBtn2)
                            }
                            HStack {
                                createBook(image: "book11", title: "Колесо времени. Книга 14", author: "Джордан Роберт", price: "1 630", discount: "-30%", buyButton: $showBtn3)
                                createBook(image: "book12", title: "Благословление небожителей. Том 1", author: "Мосян Тонсю", price: "1 379", discount: "-22%", buyButton: $showBtn4)
                            }
                        }
                        
                        
                        
                        
                    }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                        .navigationBarBackButtonHidden(true)
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
                .navigationTitle("Фэнтези")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading, content: {
                        Button(action: {dismiss()}, label: {
                            Image("dismiss")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        })
                    })
                    ToolbarItem(placement: .topBarTrailing, content: {
                        NavigationLink(destination: Screen2(), label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .font(.title)
                                .foregroundColor(.white)
                        })
                    })
                    
                }
            }
        }/*End NavigationStack*/
        .fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .environmentObject(countCart)
        
        
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




struct Screen9: View {
    @Environment(\.dismiss) var dismiss
    @State var showBtn1 = false
    @State var showBtn2 = false
    @State var showBtn3 = false
    @State var showBtn4 = false
    @State var showRectangle = false
    @State var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
        
        NavigationStack {/*Start NavigationStack*/
            ScrollView {
                ZStack {
                    VStack(spacing: 0) {/*Start VStack*/
                        
                        Spacer()
                        
                        
                        VStack {
                            HStack {
                                createBook(image: "book13", title: "Метро 2033", author: "Глуховсктй Дмитрий Алексеевич", price: "1 471", discount: "-24%", buyButton: $showBtn1)
                                createBook(image: "book14", title: "Автостопом по галактике", author: "Адам Дуглас", price: "339", discount: "-22%", buyButton: $showBtn2)
                            }
                            HStack {
                                createBook(image: "book15", title: "Atomic Heart. Предыстория", author: "Хорф Харальд", price: "901", discount: "-22%", buyButton: $showBtn3)
                                createBook(image: "book16", title: "Метро 2034", author: "Глуховский Дмитрий Алексеевич", price: "1 471", discount: "-22%", buyButton: $showBtn4)
                            }
                        }
                        
                        
                        
                        
                    }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                        .navigationBarBackButtonHidden(true)
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
                .navigationTitle("Фантастический боевик")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading, content: {
                        Button(action: {dismiss()}, label: {
                            Image("dismiss")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        })
                    })
                    ToolbarItem(placement: .topBarTrailing, content: {
                        NavigationLink(destination: Screen2(), label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .font(.title)
                                .foregroundColor(.white)
                        })
                    })
                    
                }
            }
        }/*End NavigationStack*/
        .fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .environmentObject(countCart)
        
        
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



struct Screen10: View {
    @Environment(\.dismiss) var dismiss
    @State var showBtn1 = false
    @State var showBtn2 = false
    @State var showBtn3 = false
    @State var showBtn4 = false
    @State var showRectangle = false
    @State var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
        
        NavigationStack {/*Start NavigationStack*/
            ScrollView {
                ZStack {
                    VStack(spacing: 0) {/*Start VStack*/
                        Spacer()
                        
                        VStack {
                            HStack {
                                createBook(image: "book17", title: "Клатбище домашних жывотных", author: "Кинг Стивен", price: "671", discount: "-24%", buyButton: $showBtn1)
                                createBook(image: "book18", title: "Кэрри", author: "Кинг Стивен", price: "321", discount: "-22%", buyButton: $showBtn2)
                            }
                            HStack {
                                createBook(image: "book19", title: "Пять ночей у Фредди. Серебряные глаза", author: "Коутон Скотт", price: "643", discount: "-22%", buyButton: $showBtn3)
                                createBook(image: "book20", title: "Сумерки (новое оформление)", author: "Майер Стефани", price: "1 149", discount: "-22%", buyButton: $showBtn4)
                            }
                        }
                        
                        
                        
                        
                    }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                        .navigationBarBackButtonHidden(true)
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
                .navigationTitle("Мистика. Ужасы")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading, content: {
                        Button(action: {dismiss()}, label: {
                            Image("dismiss")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        })
                    })
                    ToolbarItem(placement: .topBarTrailing, content: {
                        NavigationLink(destination: Screen2(), label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .font(.title)
                                .foregroundColor(.white)
                        })
                    })
                    
                }
            }
        }/*End NavigationStack*/
        .fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .environmentObject(countCart)
        
        
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




struct Screen11: View {
    @Environment(\.dismiss) var dismiss
    @State var showBtn1 = false
    @State var showBtn2 = false
    @State var showBtn3 = false
    @State var showBtn4 = false
    @State var showRectangle = false
    @State var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
        
        NavigationStack {/*Start NavigationStack*/
            ScrollView {
                ZStack {
                    VStack(spacing: 0) {/*Start VStack*/
                        Spacer()
                        
                        VStack {
                            HStack {
                                createBook(image: "book21", title: "Поиски утраченного завтра", author: "Лукьяненко Сергей Васильевич", price: "873", discount: "-22%", buyButton: $showBtn1)
                                createBook(image: "book22", title: "Вегетация", author: "Иванов Алексей Викторович", price: "881", discount: "-24%", buyButton: $showBtn2)
                            }
                            HStack {
                                createBook(image: "book23", title: "Пикник на обочине", author: "Стругацкий Борис Натанович", price: "643", discount: "-22%", buyButton: $showBtn3)
                                createBook(image: "book24", title: "Понедельник начинается в субботу", author: "Стругацкий Борис Натанович", price: "367", discount: "-22%", buyButton: $showBtn4)
                            }
                        }
                        
                        
                        
                        
                    }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                        .navigationBarBackButtonHidden(true)
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
                .navigationTitle("Научная фантастика")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading, content: {
                        Button(action: {dismiss()}, label: {
                            Image("dismiss")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        })
                    })
                    ToolbarItem(placement: .topBarTrailing, content: {
                        NavigationLink(destination: Screen2(), label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .font(.title)
                                .foregroundColor(.white)
                        })
                    })
                    
                }
            }
        }/*End NavigationStack*/
        .fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .environmentObject(countCart)
        
        
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




struct Screen12: View {
    @Environment(\.dismiss) var dismiss
    @State var showBtn1 = false
    @State var showBtn2 = false
    @State var showBtn3 = false
    @State var showBtn4 = false
    @State var showRectangle = false
    @State var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
        
        NavigationStack {/*Start NavigationStack*/
            ScrollView {
                ZStack {
                    VStack(spacing: 0) {/*Start VStack*/
                        Spacer()
                        
                        VStack {
                            HStack {
                                createBook(image: "book25", title: "Дозоры. Ночной дозор", author: "Лукяненько Сергей Васильевич", price: "1210", discount: "-22%", buyButton: $showBtn1)
                                createBook(image: "book26", title: "Великий гусляр", author: "Булычев Кир", price: "1 321", discount: "-24%", buyButton: $showBtn2)
                            }
                            HStack {
                                createBook(image: "book27", title: "Четыре сезона", author: "Кинг Стивен", price: "423", discount: "-22%", buyButton: $showBtn3)
                                createBook(image: "book28", title: "Скитальцы", author: "Цзинфан Хао", price: "1 249", discount: "-22%", buyButton: $showBtn4)
                                
                            }
                        }
                        
                        
                        
                    }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                        .navigationBarBackButtonHidden(true)
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
                .navigationTitle("Другие жанры фантастики")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading, content: {
                        Button(action: {dismiss()}, label: {
                            Image("dismiss")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        })
                    })
                    ToolbarItem(placement: .topBarTrailing, content: {
                        NavigationLink(destination: Screen2(), label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .font(.title)
                                .foregroundColor(.white)
                        })
                    })
                    
                }
            }
        }/*End NavigationStack*/
        .fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .environmentObject(countCart)
        
        
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



struct Screen13: View {
    @Environment(\.dismiss) var dismiss
    @State var showBtn1 = false
    @State var showBtn2 = false
    @State var showBtn3 = false
    @State var showBtn4 = false
    @State var showRectangle = false
    @State var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
        
        NavigationStack {/*Start NavigationStack*/
            ZStack {
                VStack(spacing: 0) {/*Start VStack*/
                    
                    VStack(alignment: .leading) {/*Start VStack*/
                        
                        HStack {
                            Button(action: {
                                dismiss()
                            }, label: {
                                Text("<")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            })
                            .padding()
                            Spacer()
                            NavigationLink(destination: Screen2(), label: {
                                Image(systemName: "magnifyingglass")
                                    .font(.title)
                                    .foregroundColor(.white)
                            })
                            .padding()
                        }
                        
                        Text("Комиксы")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                    } /*End VStack*/.frame(maxWidth: .infinity)
                        .background(Color(UIColor.systemBlue))
                    Spacer()
                    
                    ScrollView {
                        VStack {
                            HStack {
                                createBook(image: "book29", title: "Человек-Паук. Страшная угроза", author: "Кванц Дэниел", price: "319", discount: "-68%", buyButton: $showBtn1)
                                createBook(image: "book30", title: "Бэтмен. Убийственная шутка", author: "Мур Алан", price: "1 259", discount: "-24%", buyButton: $showBtn2)
                            }
                            HStack {
                                createBook(image: "book31", title: "Хранители", author: "Мур Алан", price: "3 149", discount: "-24%", buyButton: $showBtn3)
                                createBook(image: "book32", title: "Рик и Морти", author: "Старс Кайл", price: "2 023", discount: "-22%", buyButton: $showBtn4)

                            }
                        }
                    }
                    
                    
                    
                }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .navigationBarBackButtonHidden(true)
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
        }/*End NavigationStack*/
        .fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .environmentObject(countCart)
        
        
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




struct Screen14: View {
    @Environment(\.dismiss) var dismiss
    @State var showBtn1 = false
    @State var showBtn2 = false
    @State var showBtn3 = false
    @State var showBtn4 = false
    @State var showRectangle = false
    @State var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
        
        NavigationStack {/*Start NavigationStack*/
            ZStack {
                VStack(spacing: 0) {/*Start VStack*/
                    
                    VStack(alignment: .leading) {/*Start VStack*/
                        
                        HStack {
                            Button(action: {
                                dismiss()
                            }, label: {
                                Text("<")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            })
                            .padding()
                            Spacer()
                            NavigationLink(destination: Screen2(), label: {
                                Image(systemName: "magnifyingglass")
                                    .font(.title)
                                    .foregroundColor(.white)
                            })
                            .padding()
                        }
                        
                        Text("Манга")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                    } /*End VStack*/.frame(maxWidth: .infinity)
                        .background(Color(UIColor.systemBlue))
                    Spacer()
                    
                    ScrollView {
                        VStack {
                            HStack {
                                createBook(image: "book33", title: "Магическая битва. Книга 1 (Том 1,2) - Двуликий Сукуна. Проклятый плод. (Jujutsu Kaisen). Манга", author: "Акутами Гэгэ", price: "1 079", discount: "-24%", buyButton: $showBtn1)
                                createBook(image: "book34", title: "Человек-бензопила. Том 12 - Огнестрел, гвозди, катана (Chainsaw Man). Манга", author: "Фудзимото Тацуки", price: "809", discount: "-24%", buyButton: $showBtn2)
                            }
                            HStack {
                                createBook(image: "book35", title: "Берсерк. Том 8 (Berserk). Манга", author: "Миура Кэнтаро", price: "1 650", discount: "-17%", buyButton: $showBtn3)
                                createBook(image: "book36", title: "Ван-Пис. Книга 1 (Том 1,2,3) - На заре приключений. (One Piece / Большой куш). Манга", author: "Старс Кайл", price: "1 259", discount: "-24%", buyButton: $showBtn4)

                            }
                        }
                    }
                    
                    
                    
                }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .navigationBarBackButtonHidden(true)
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
        }/*End NavigationStack*/
        .fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .environmentObject(countCart)
        
        
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



struct Screen15: View {
    @Environment(\.dismiss) var dismiss
    @State var showBtn1 = false
    @State var showBtn2 = false
    @State var showBtn3 = false
    @State var showBtn4 = false
    @State var showRectangle = false
    @State var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
        
        NavigationStack {/*Start NavigationStack*/
            ZStack {
            ScrollView {
                
    
                    VStack(spacing: 0) {/*Start VStack*/
                        
                        VStack(alignment: .leading) {/*Start VStack*/
                            
                            HStack {
                                Button(action: {
                                    dismiss()
                                }, label: {
                                    Text("<")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                })
                                .padding()
                                Spacer()
                                NavigationLink(destination: Screen2(), label: {
                                    Image(systemName: "magnifyingglass")
                                        .font(.title)
                                        .foregroundColor(.white)
                                })
                                .padding()
                            }
                            
                            Text("Книги на английском языке")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .bold()
                                .padding()
                        } /*End VStack*/.frame(maxWidth: .infinity)
                            .background(Color(UIColor.systemBlue))
                        
                        
                        Spacer()
                        
                        List {
                            NavigationLink(destination: Screen16(), label: {
                                Text("Современная проза на английском")
                            })
                            NavigationLink(destination: Screen17(), label: {
                                Text("Классическая проза на английском")
                            })
                            NavigationLink(destination: Screen18(), label: {
                                Text("Русская литература на английском")
                            })
                            NavigationLink(destination: Screen11(), label: {
                                Text("Фантастика. Мистика. Ужасы на анлийском")
                            })
                            NavigationLink(destination: Screen12(), label: {
                                Text("Детектив. Триллер на английском")
                            })
                            NavigationLink(destination: Screen8(), label: {
                                Text("Романтика на английском")
                            })
                            NavigationLink(destination: Screen9(), label: {
                                Text("Детские книги на английском")
                            })
                            NavigationLink(destination: Screen10(), label: {
                                Text("Научно-популярная литература на английском")
                            })
                            NavigationLink(destination: Screen11(), label: {
                                Text("Прочие издания на английском")
                            })
                        }.frame(height: 500)
                        Spacer()
                        
                        ScrollView {
                            VStack {
                                HStack {
                                    createBook(image: "book37", title: "Coraline", author: "Гейман Нил", price: "551", discount: "-15%", buyButton: $showBtn1)
                                    createBook(image: "book38", title: "Coraline", author: "Гейман Нил", price: "487", discount: "-15%", buyButton: $showBtn2)
                                }
                                HStack {
                                    createBook(image: "book39", title: "Alice's Advendtures in Wonderland. Through the Looking-Glass, and What Alice Found There", author: "Carroll Lewis", price: "541", discount: "", buyButton: $showBtn3)
                                    createBook(image: "book40", title: "The Great Gatsby", author: "Fitzerald Francis Scott", price: "533", discount: "-15%", buyButton: $showBtn4)
                                }
                            }
                        }
                        
                        
                        
                    }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                        .navigationBarBackButtonHidden(true)
                        
                    }
                
                if showRectangle {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        // При нажатии за пределами попапа — скрываем его
                        .onTapGesture {
                            withAnimation(.spring()) {
                                showRectangle.toggle()
                            }
                        }
                    
                    // Для того, чтобы попап точно был по центру,
                    // можно использовать ZStack с maxWidth/Height и .center alignment.
                    VStack {
                        // Сам попап (например, контейнер с информацией и кнопкой Войти)
                        VStack {
                            Image("keymark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .padding()
                            Text("Для того, чтобы добавить в закладки, необходимо войти в личный кабинет")
                                .multilineTextAlignment(.center)
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
                            })
                            .cornerRadius(5)
                            .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(4)
                        .shadow(radius: 5)
                    }
                    // Сделаем так, чтобы попап располагался по центру
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
                }
                    
            }
            .toolbar {
                
            }.background(Color(UIColor.systemBlue))
        }/*End NavigationStack*/
        .fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .environmentObject(countCart)
        
        
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



struct Screen16: View {
    @Environment(\.dismiss) var dismiss
    @State var showBtn1 = false
    @State var showBtn2 = false
    @State var showBtn3 = false
    @State var showBtn4 = false
    @State var showRectangle = false
    @State var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
        
        NavigationStack {/*Start NavigationStack*/
            ZStack {
                VStack(spacing: 0) {/*Start VStack*/
                    
                    VStack(alignment: .leading) {/*Start VStack*/
                        
                        HStack {
                            Button(action: {
                                dismiss()
                            }, label: {
                                Text("<")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            })
                            .padding()
                            Spacer()
                            NavigationLink(destination: Screen2(), label: {
                                Image(systemName: "magnifyingglass")
                                    .font(.title)
                                    .foregroundColor(.white)
                            })
                            .padding()
                        }
                        
                        Text("Современная проза на английском языке")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                    } /*End VStack*/.frame(maxWidth: .infinity)
                        .background(Color(UIColor.systemBlue))
                    Spacer()
                    
                    ScrollView {
                        VStack {
                            HStack {
                                createBook(image: "book41", title: "Высший дар", author: "Коэльо Пауло", price: "793", discount: "", buyButton: $showBtn1)
                                createBook(image: "book42", title: "Eat Pray Love", author: "Гилберт Элизабет", price: "539", discount: "-17%", buyButton: $showBtn2)
                            }
                            HStack {
                                createBook(image: "book43", title: "I, Robot = Я, Робот", author: "Азимов Айзек", price: "700", discount: "", buyButton: $showBtn3)
                                createBook(image: "book44", title: "1984: Книга для чтения на английском языке.", author: "Оруэлл Джордж", price: "526", discount: "", buyButton: $showBtn4)

                            }
                        }
                    }
                    
                    
                    
                }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .navigationBarBackButtonHidden(true)
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
        }/*End NavigationStack*/
        .fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .environmentObject(countCart)
        
        
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



struct Screen17: View {
    @Environment(\.dismiss) var dismiss
    @State var showBtn1 = false
    @State var showBtn2 = false
    @State var showBtn3 = false
    @State var showBtn4 = false
    @State var showRectangle = false
    @State var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
        
        NavigationStack {/*Start NavigationStack*/
            ZStack {
                VStack(spacing: 0) {/*Start VStack*/
                    
                    VStack(alignment: .leading) {/*Start VStack*/
                        
                        HStack {
                            Button(action: {
                                dismiss()
                            }, label: {
                                Text("<")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            })
                            .padding()
                            Spacer()
                            NavigationLink(destination: Screen2(), label: {
                                Image(systemName: "magnifyingglass")
                                    .font(.title)
                                    .foregroundColor(.white)
                            })
                            .padding()
                        }
                        
                        Text("Классическая проза на английском языке")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                    } /*End VStack*/.frame(maxWidth: .infinity)
                        .background(Color(UIColor.systemBlue))
                    Spacer()
                    
                    ScrollView {
                        VStack {
                            HStack {
                                createBook(image: "book37", title: "Coraline", author: "Гейман Нил", price: "551", discount: "-15%", buyButton: $showBtn1)
                                createBook(image: "book38", title: "Coraline", author: "Гейман Нил", price: "487", discount: "-15%", buyButton: $showBtn2)
                            }
                            HStack {
                                createBook(image: "book39", title: "Alice's Advendtures in Wonderland. Through the Looking-Glass, and What Alice Found There", author: "Carroll Lewis", price: "541", discount: "", buyButton: $showBtn3)
                                createBook(image: "book40", title: "The Great Gatsby", author: "Fitzerald Francis Scott", price: "533", discount: "-15%", buyButton: $showBtn4)

                            }
                        }
                    }
                    
                    
                    
                }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .navigationBarBackButtonHidden(true)
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
        }/*End NavigationStack*/
        .fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .environmentObject(countCart)
        
        
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




struct Screen18: View {
    @Environment(\.dismiss) var dismiss
    @State var showBtn1 = false
    @State var showBtn2 = false
    @State var showBtn3 = false
    @State var showBtn4 = false
    @State var showRectangle = false
    @State var showBlock = false
    @EnvironmentObject var countCart: CountCart
    var body: some View {
        
        NavigationStack {/*Start NavigationStack*/
            ZStack {
                VStack(spacing: 0) {/*Start VStack*/
                    
                    VStack(alignment: .leading) {/*Start VStack*/
                        
                        HStack {
                            Button(action: {
                                dismiss()
                            }, label: {
                                Text("<")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            })
                            .padding()
                            Spacer()
                            NavigationLink(destination: Screen2(), label: {
                                Image(systemName: "magnifyingglass")
                                    .font(.title)
                                    .foregroundColor(.white)
                            })
                            .padding()
                        }
                        
                        Text("Русская литература на английском языке")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                    } /*End VStack*/.frame(maxWidth: .infinity)
                        .background(Color(UIColor.systemBlue))
                    Spacer()
                    
                    ScrollView {
                        VStack {
                            HStack {
                                createBook(image: "book45", title: "Crime&Punishment", author: "Федор Достоевский", price: "1 538", discount: "", buyButton: $showBtn1)
                                createBook(image: "book46", title: "Eugene Onegin", author: "Александр Пушкин", price: "418", discount: "-41%", buyButton: $showBtn2)
                            }
                            HStack {
                                createBook(image: "book47", title: "The idiot", author: "Федор Достоевский", price: "1 424", discount: "", buyButton: $showBtn3)
                                createBook(image: "book48", title: "Crime and Punishment", author: "Федор Достоевский", price: "1 200", discount: "", buyButton: $showBtn4)

                            }
                        }
                    }
                    
                    
                    
                }/*End VStack*/.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .navigationBarBackButtonHidden(true)
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
        }/*End NavigationStack*/
        .fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .environmentObject(countCart)
        
        
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
