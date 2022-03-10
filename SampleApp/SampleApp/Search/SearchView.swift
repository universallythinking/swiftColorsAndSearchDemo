//
//  SearchView.swift
//  SampleApp
//
//  Created by Brooks Barnett on 2/22/22.
//

import SwiftUI
import Alamofire
import SwiftyJSON

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SearchView: View {
    
    @State var selection = 0
    @State var searchQuery = ""
    @State var result = ""

    var body: some View {
        //ZStack(alignment: .top){
        VStack {
            Text("Search Apple Music")
                .background(Color(.black))
                .frame(width: .infinity, height: 50)
                .padding(.all, 10)
                .font(.system(size: 22))
            TextField("Enter search query: ", text: self.$searchQuery)
                .frame(alignment: .center)
                .padding(.horizontal, 30)
                .padding(.top, 20).background(Color.black)
            Text(self.result)
            Spacer()
            Button(action: {
                searchApple()
            }) {
                HStack {
                    Image(systemName: "magnifyingglass.circle.fill")
                    Text("Search Apple Music")
                }.padding(10.0)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(lineWidth: 2.0)
                )
            }
        }
    }
    
    func searchApple() {
        let baseURL = URL(string: "https://itunes.apple.com/search")
        let parameters: Parameters = [ "term": $searchQuery.wrappedValue ]
        var json: JSON?
        if (baseURL != nil) {
            AF.request(baseURL!, method: .get, parameters: parameters).responseJSON {
                response in
                if response.data != nil {
                    json = try? JSON(data: response.data!)
                    setSearchResults(json!["results"])
                } else {
                    json = "{}"
                    setSearchResults(json)
                }
            }
        }
    }
    
    func setSearchResults(_ json: JSON?) {
        if (!json!.isEmpty) {
            for (_, value) in json! {
                if (value["trackName"] != JSON(rawValue: NSNull())) {
                    self.result = "The first returned track was \(value["trackName"].rawValue as! String)"
                    break
                } else {
                    self.result = "No results found..."
                }
            }
        }
        endEditing()
    }
    
    func endEditing() {
        UIApplication.shared.endEditing()
    }
}

// I deleted the content previews for sake of speed while debugging
