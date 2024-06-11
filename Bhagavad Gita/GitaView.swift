//
//  GitaView.swift
//  Bhagavad Gita
//
//  Created by Vanshita on 23/05/24.
//

import SwiftUI
import Alamofire

struct Status : Decodable
{
    var id: Int
    var name: String
    var slug: String
    var name_transliterated: String
    var name_translated: String
    var verses_count: Int
    var chapter_number: Int
    var name_meaning: String
    var chapter_summary: String
    var chapter_summary_hindi: String
}

struct GitaView: View {
    
    @State var array: [Status]? = []
    
    var body: some View {
        
        let brown = Color(red: 84/255, green: 51/255, blue: 16/255)
        
        NavigationView {
            ZStack {
                List(array!, id:\.name) {i in
                    NavigationLink(destination: DetailView(chapter: i)) {
                        VStack(alignment: .leading) {
                            Text("\(i.name)")
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("\(i.name_translated)")
                                .font(.system(size: 20))
                                .bold()
                                .foregroundColor(brown)
                        }
                        
                    }.listRowBackground(Color(white: 1, opacity: 0.7))
                }
            }

            
            .scrollContentBackground(.hidden)
            .background {
                Image("wallpaper")
                    .resizable()
                    .ignoresSafeArea()
                    .blur(radius: 7.0)
                    .foregroundColor(.white.opacity(0.5))
            }
            .onAppear{
                getData()
            }
            
            .navigationTitle("BhagavadGita")
            .navigationBarTitleDisplayMode(.automatic)
            
        }
        .navigationBarBackButtonHidden(true)
    }
        
    
    
    func getData() {
        let link = "https://bhagavad-gita3.p.rapidapi.com/v2/chapters/"
        AF.request(link, method: .get,headers: ["X-RapidAPI-Key":"8b9a8ef064msh933a37e8f6a5489p19a0e4jsn93632383cb17"]).responseData {respo in
            switch respo.result {
            case.success(let data):
                do {
                    array = try JSONDecoder().decode([Status].self, from: data)
                    print(array)
                } catch {
                    print(error.localizedDescription)
                }
               
            case.failure(let error):
                print(error.errorDescription)
                
            default:
                print("Fail")
            }
        }
    }
}

//MARK: - details of gita

struct DetailView: View {
    
    var chapter: Status
    //let darkBrown = Color(red: 84/255, green: 51/255, blue: 16/255)
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 10.0) {
//                Text(chapter.name_translated)
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(.primary)
//                    .padding(.bottom, 5)
//                    .navigationBarBackButtonHidden(true)
                Spacer()
                
                Text("Slug :")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text("\(chapter.slug)")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("Name meaning :")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text("\(chapter.name_meaning)")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.white)
                    
                Spacer()
                
                Text("Chapter \(chapter.chapter_number) :")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text(chapter.chapter_summary)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.white)
                   
                Spacer()
                
                Text("Hindi summary :")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text("\(chapter.chapter_summary_hindi)")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.white)
               
                Spacer()
            }.navigationTitle(chapter.name)

            .padding()
            
            .background(
                Image("wallpaper")
                    .resizable()
                    .blur(radius: 7.0)
                    .edgesIgnoringSafeArea(.all))
        }
    }
}


#Preview {
    GitaView()
}
