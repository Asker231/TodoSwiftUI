//
//  ContentView.swift
//  TodoApp
//
//  Created by ASKER on 30.04.2023.
//

import SwiftUI

struct MainContentView: View {
    var body: some View {
            
        NavigationView {
            AddTodoView()
                .edgesIgnoringSafeArea(.all)
                .ignoresSafeArea(.all)
                .padding()
                .background(Color("bg"))
            
                .navigationTitle("Todo")
               
        }
        
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
