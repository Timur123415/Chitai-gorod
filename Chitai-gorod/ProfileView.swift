//
//  ProfileView.swift
//  Chitai-gorod
//
//  Created by Тимур Белов  on 07.02.2025.
//

import SwiftUI
import MapKit
import CoreLocation

struct ProfileView: View {
    @State private var showBlock = false
    @State private var showMap = false
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        Text("Город Москва")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.trailing, 20)
                    }
                    Spacer()
                    Text("Войдите, чтобы делать выгодные покупки с бонусами, добавлять книги в закладки и оформлять заказы")
                        .bold()
                        .frame(width: 350, height: 100)
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                    Button(action: {
                        showBlock.toggle()
                    }, label: {
                        Text("Войти")
                            .bold()
                            .frame(width: 350, height: 50)
                            .foregroundColor(Color(UIColor.systemBlue))
                            .background(.white)
                            .cornerRadius(4)
                    }).padding(.bottom, 30)
                }.frame(maxWidth: .infinity, maxHeight: 250).background(Color(UIColor.systemBlue))
                Spacer()
                VStack {
                    List {
                        Section(header: Label("Доставка и адреса", systemImage: "map").font(.headline).foregroundColor(.gray).padding(.top, 10)) {
                            Button(action: {
                                showMap.toggle()
                            }, label: {
                                Text("Магазины")
                            })
                            NavigationLink(destination: Screen2(), label: {
                                Text("Доставка и оплата")
                            }).listRowSeparator(.hidden)
                        }
                    }.scrollContentBackground(.hidden).background(Color.white)
                        .cornerRadius(12)
                        .padding()
                }.background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
                
                
                
            }
        }.fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        .fullScreenCover(isPresented: $showMap) {
            ScreenMap(showMap: $showMap)
        }
        
        
        
        
        
        
        
        
        
    }
    
}





struct ScreenMap: View {
    @Binding var showMap: Bool
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    // Состояние для обработки местоположения
    @StateObject private var locationManager = LocationManager()
    
    @Environment(\.dismiss) var dismiss
    
    // Состояния для работы с bottom sheet
    @State private var isSheetExpanded = false
    @State private var dragOffset: CGFloat = 0
    @State private var searchText = ""
    var body: some View {
            ZStack {
                // Карта
                Map(coordinateRegion: $region)
                    .ignoresSafeArea()
                
                // Элементы управления картой (зум, центрирование, назад)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        VStack(spacing: 10) {
                            Spacer()
                            Button {
                                withAnimation {
                                    region.span.latitudeDelta *= 0.5
                                    region.span.longitudeDelta *= 0.5
                                }
                            } label: {
                                Image("plus")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .clipShape(Circle())
                            }
                            Button {
                                withAnimation {
                                    region.span.latitudeDelta *= 2.0
                                    region.span.longitudeDelta *= 2.0
                                }
                            } label: {
                                Image("minus")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .clipShape(Circle())
                            }
                            Spacer()
                            Button {
                                if let userLocation = locationManager.location {
                                    withAnimation {
                                        region.center = userLocation.coordinate
                                    }
                                } else {
                                    print("Локация пользователя не определена")
                                }
                            } label: {
                                Image("location")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.bottom, 90)
                        .padding(.trailing, 10)
                    }
                }
               
                VStack {
                    HStack {
                        
                        Button(action: {
                            
                            showMap = false
                            
                        }, label: {
                            Image("arrow 1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .clipShape(Circle())
                        })
                        .padding(.leading, 20)
                        Spacer()
                    }
                    Spacer()
                }
                GeometryReader { geo in
                    // Задаём высоты для состояний панели:
                    let collapsedHeight: CGFloat = 110
                    let expandedHeight: CGFloat = geo.size.height * 0.9
                    
                    // Вычисляем вертикальное смещение панели
                    // При свернутом состоянии она находится ниже (на экране видна только высота collapsedHeight)
                    let collapsedOffset = geo.size.height - collapsedHeight
                    let expandedOffset = geo.size.height - expandedHeight
                    let currentOffset = (isSheetExpanded ? expandedOffset : collapsedOffset) + dragOffset
                    
                    VStack(spacing: 0) {
                        // Для визуального эффекта можно добавить индикатор-свайпер в верхней части панели
                        Capsule()
                            .fill(Color.gray.opacity(0.4))
                            .frame(width: 40, height: 6)
                            .padding(.top, 8)
                            .padding(.bottom, 8)
                        
                        HStack {
                            // Поле ввода.
                            TextField("Поиск по адресу", text: $searchText, onEditingChanged: { isEditing in
                                // Если пользователь нажал на TextField, раскрываем панель
                                if isEditing {
                                    withAnimation {
                                        isSheetExpanded = true
                                    }
                                }
                            })
                            .padding(15)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            
                            // Если панель раскрыта – показываем кнопку "Отмена"
                            if isSheetExpanded {
                                Button(action: {
                                    withAnimation {
                                        isSheetExpanded = false
                                        // Сброс значения текста, если необходимо:
                                        // searchText = ""
                                        // Завершаем редактирование:
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                    }
                                }, label: {
                                    Text("Отмена")
                                        .foregroundColor(Color(UIColor.systemBlue))
                                })
                                .padding(.leading, 8)
                                .transition(.move(edge: .trailing))
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 12)
                        
                        // Здесь можно добавить дополнительный контент, если требуется.
                        if isSheetExpanded {
                            Text("Начните вводить, чтобы найти нужный адрес")
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(width: geo.size.width, height: expandedHeight, alignment: .top)
                    .background(
                        // Фоновая заливка панели с закруглёнными углами
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .shadow(radius: 5)
                    )
                    .offset(y: currentOffset)
                    .animation(.interactiveSpring(), value: isSheetExpanded)
                    // Жест перетаскивания панели
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                // Обновляем смещение, но ограничиваем чтобы панель не уходила слишком далеко
                                dragOffset = value.translation.height
                            }
                            .onEnded { value in
                                // Порог для изменения состояния панели
                                let threshold: CGFloat = 80
                                withAnimation {
                                    if isSheetExpanded {
                                        // Если панель раскрыта и пользователь тянет вниз больше порога – сворачиваем панель
                                        if value.translation.height > threshold {
                                            isSheetExpanded = false
                                        }
                                    } else {
                                        // Если панель свернута и тянут вверх более порога – раскрываем панель
                                        if -value.translation.height > threshold {
                                            isSheetExpanded = true
                                        }
                                    }
                                    dragOffset = 0
                                }
                            }
                    )
                }
                .ignoresSafeArea(.all, edges: .bottom)
            }
        
                    }
                  
                }

