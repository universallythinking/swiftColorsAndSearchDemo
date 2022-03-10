//
//  SearchView.swift
//  SampleApp
//
//  Created by Brooks Barnett on 2/22/22.
//

import SwiftUI
import Alamofire
import SwiftyJSON


struct SearchView: View {
    
    @State var selection = 0
    @State var searchQuery = ""
    @State var result = ""
    

    var body: some View {
            VStack {
                Text("Search Apple Music")
                    .background(Color(.black))
                    .frame(width: .infinity, height: 50)
                    .padding(.all, 10)
                    .font(.system(size: 22))
                Spacer()
                TextField("Enter search query", text: self.$searchQuery).frame(alignment: .center)
                Spacer()
                Button("Search") {
                    searchApple()
                }.frame(alignment: .center)
                Spacer()
                Text(self.result)
                Spacer()
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
    }
}

// I deleted the content previews for sake of speed while debugging
