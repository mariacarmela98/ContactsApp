//
//  ContentView.swift
//  Contacts
//
//  Created by Maria Carmela Vitale on 22/11/23.
//

import SwiftUI
import Speech


struct ContentView: View {
    let names = ["Maria Carmela Vitale", "Francesco Vitale","Francesca","Fabiana","Lorenzo Mazza", "Lucia", "Zia Emilia", "Papà", "Greg","Maradona", "Martina","Maria","Gina", "Marco","Ale"]
    @State private var searchText = ""
    @State private var showingSheet = false
    
    var body: some View {
        ZStack {
            HStack {
                NavigationStack {
                    VStack {
                        HStack {
                            Image("profilo")
                                .resizable(capInsets: EdgeInsets())
                                .frame(width: 85, height: 85)
                                .cornerRadius(70.0)
                            
                            VStack {
                                Text("Greg Vitale")
                                    .bold()
                                    .font(.title2)
                                    .padding(.leading, 10.0)
                                
                                Text("My Card")
                                    .foregroundStyle(.gray)
                                    .padding(.trailing, 36.0)
                            }
                        }
                        .background(.white)
                        .padding(.trailing, 120)
                        
                        ZStack {
                            List {
                                ForEach(sortedNamesBySection(), id: \.key) { section in
                                    Section(header: Text(String(section.key))) {
                                        ForEach(section.value, id: \.self) { name in
                                            NavigationLink {
                                                Text(name)
                                            } label: {
                                                Text(name)
                                            }
                                            .listRowInsets(EdgeInsets(top: -0, leading: leadingInset(for: name), bottom: 0, trailing: -10))
                                        }
                                    }
                                    .listRowSeparator(.hidden)
                                    .listRowBackground(Color.clear)
                                    .overlay(
                                        Divider()
                                            .padding(.top, -10.0)
                                            .background(Color.white)
                                    )
                                }
                            }
                            .scrollContentBackground(.hidden)
                            .navigationBarItems(trailing:
                                                    HStack {
                                Button(action: {
                                    //action of mic to activate dictature
                                }) {
                                    Image(systemName: "mic")
                                        .foregroundStyle(Color.blue)
                                }
                                .accessibility(label: Text("This button is used to activate Lorenzo Mazza"))
                                .buttonStyle(PlainButtonStyle())
                                
                                    
                                    Button(action: {
                                        showingSheet.toggle()
                                    }) {
                                        Image(systemName: "plus")
                                    }
                                }
                                .sheet(isPresented: $showingSheet) {
                                    NewContact(isPresented: $showingSheet)
                                }
                                )
                                .navigationBarItems(leading:
                                                        Button(action:   {}, label: {
                                    Label("Elenchi", systemImage:"chevron.backward").bold()
                                        .imageScale(.large)
                                    Text("Lists")
                                        .font(.title3)
                                })
                                )
                                .navigationTitle("Contacts")
                                
                                VStack{
                                    // ... Your existing code for the alphabetical list
                                }
                                .padding(.leading, 370)
                            }
                                                }
                                                }
                                .searchable(text: $searchText)
                                                }
                                                }
                                                }
                                                
                                                var searchResults: [String] {
                                if searchText.isEmpty {
                                    return names
                                } else {
                                    return names.filter { $0.lowercased().contains(searchText.lowercased()) }
                                }
                            }
                                                
                                                func sortedNamesBySection() -> [(key: Character, value: [String])] {
                                let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ#"
                                var result: [(key: Character, value: [String])] = []
                                
                                for char in alphabet {
                                    let sectionNames = searchResults.filter { $0.lowercased().hasPrefix(String(char).lowercased()) }
                                    if !sectionNames.isEmpty {
                                        result.append((key: char, value: sectionNames))
                                    }
                                }
                                
                                return result
                            }
                                                
                                                func leadingInset(for name: String) -> CGFloat {
                                guard let firstCharacter = name.first else { return 0 }
                                let key = String(firstCharacter).uppercased()
                                
                                let firstInSection = sortedNamesBySection()
                                    .first { String($0.key).uppercased() == key }
                                    .flatMap { $0.value.first }
                                
                                return 18
                            }
                                                }
                                                
                                                struct ContentView_Previews: PreviewProvider {
                                static var previews: some View {
                                    ContentView()
                                }
                            }
