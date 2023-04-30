//
//  AdditionTodoView.swift
//  TodoApp
//
//  Created by ASKER on 30.04.2023.
//

import SwiftUI


enum Category:String{
    case Personal
    case Job
    case Life
    case Software
}
struct AddTodoView: View {
    @StateObject var store = TodoStoreViewModel()
    @State var texts:String = " "
    @State var isCList = false
    @State var category:Category = .Personal
    var body: some View {
        ZStack(alignment: .bottom){
            ScrollView(.vertical){
                if store.listItems.isEmpty{
                    Spacer()
                    Text("Пустой список задач...")
                        .bold()
                        .foregroundColor(.gray)
                        .font(.system(size: 30))
                        .offset(y:300)
                }
                ForEach(store.listItems) { el in
                    HStack{
                        VStack(alignment: .leading){
                            Text("\(Date().description)")
                            Text("\(el.text)")
                                .bold()
                        }
                        Spacer()
                        Button {
                            withAnimation {
                                store.removeTodoType(id: el.id)
                            }
                        } label: {
                            ZStack{
                                Image(systemName: "minus.square.fill")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                                    .foregroundColor(.white)
                            }
                            .padding(5)
                            .background(Color("delete"))
                            .cornerRadius(10)
                            
                        }
                        
                    }
                    .padding(.vertical,5)
                    .padding(.horizontal,5)
                    .frame(maxWidth: .infinity)
                    .background(Color("todoscolor"))
                    .cornerRadius(5)
                }
            }
            
//MARK: - Section subCategory
            VStack(alignment: .leading){
                Button {
                    withAnimation(.spring()){
                        category = .Personal
                        isCList = false
                    }
                } label: {
                    HStack{
                        Image(systemName: "rectangle")
                            .resizable()
                            .frame(width: 10,height: 10)
                            .foregroundColor(.green)
                            .bold()
                        Text("Personal").font(.system(size: 14))
                    }
                }

                
                Button {
                    withAnimation(.spring()){
                        category = .Job
                        isCList = false
                    }
                } label: {
                    HStack{
                        Image(systemName: "rectangle")
                            .resizable()
                            .frame(width: 10,height: 10)
                            .foregroundColor(.orange)
                            .bold()
                        Text("Job").font(.system(size: 14))
                    }
                }

                Button {
                    withAnimation(.spring()){
                        category = .Life
                        isCList = false
                    }
                } label: {
                    
                    HStack{
                        Image(systemName: "rectangle")
                            .resizable()
                            .frame(width: 10,height: 10)
                            .foregroundColor(.yellow)
                            .bold()
                        Text("Life").font(.system(size: 14))
                    }
                }

                
                Button {
                    withAnimation(.spring()){
                        category = .Software
                        isCList = false
                    }
                } label: {
                    HStack{
                        Image(systemName: "rectangle")
                            .resizable()
                            .frame(width: 10,height: 10)
                            .foregroundColor(.blue)
                            .bold()
                        Text("Software").font(.system(size: 14))
                    }
                }

                
            }
            .padding(4)
            .frame(width: 140)
            .background()
            .cornerRadius(4)
            .offset(x: 130,y: isCList ? -60 : 10)
            .opacity( isCList ? 1 : 0)
            
            HStack{
                ZStack{
                    Image(systemName: "mic")
                        .frame(width: 20 , height: 20)
                    
                }
                .padding(.horizontal,8)
                .padding(.vertical,8)
                .background(Color("bgrect"))
                .cornerRadius(5)
                
                TextField("Add todo...", text:self.$texts)
                    .frame(maxWidth:.infinity)
                
                ZStack{
                    Image(systemName: "photo")
                        .frame(width: 20 , height: 20)

                }
                .padding(.horizontal,8)
                .padding(.vertical,8)
                .background(Color("bgrect"))
                .cornerRadius(5)
                HStack(spacing: 20){
                    HStack{
                        Text("\(category.rawValue)")
                            .font(.system(size: 13))
                            .bold()
                        Button {
                            withAnimation(.spring()){
                                isCList.toggle()
                            }
                        } label: {
                            Image(systemName: isCList ? "arrow.up.circle.fill" :  "arrow.down.circle.fill")
                                .resizable()
                                .frame(width: 25,height: 25)
                                .foregroundColor(.black)
                                .bold()
                        }
                        
                    }
                    
                    Button {
                        if texts == " "{
                            return
                        }
                        withAnimation{
                            store.addTodoType(todo:TodoType(text: texts))
                        }
                        texts = " "
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .frame(width: 12,height: 12)
                            .foregroundColor(.gray)
                    }
                    
                    
                }
                .padding(.horizontal,9)
                .padding(.vertical,9)
                .background(Color("bgrect"))
                .cornerRadius(10)
            }
            .padding(4)
            .background(.white)
            .cornerRadius(10)
            .shadow(radius: 2)
            
            
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
