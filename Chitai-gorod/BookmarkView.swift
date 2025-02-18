//
//  BookmarkView.swift
//  Chitai-gorod
//
//  Created by Тимур Белов  on 07.02.2025.
//

import SwiftUI


struct BookmarkView: View {
    @State var showBlock = false
    var body: some View {
        
        
        NavigationStack {
            VStack(spacing: 0) {
                Image("books")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                Text("Войдите в свой профиль, чтобы просматривать закладки и добавлять в них что-нибудь интересное")
                    .padding(.leading)
                    .padding(.trailing)
                Button(action: {
                    showBlock.toggle()
                }, label: {
                    Text("Войти")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 250, height: 50)
                        .background(Color(UIColor.systemBlue))
                        .cornerRadius(5)
                        .padding(.top, 50)
                })
            }
        }.fullScreenCover(isPresented: $showBlock) {
            ScreenView(showBlock: $showBlock)
        }
        
        
        
        
    }
}






