//
//  ContentView.swift
//  MIL
//
//  Created by GoEun Jeong on 2021/08/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var applicationVM = ApplicationViewModel()
    
    var body: some View {
        ZStack {
            TabView {
                StudentView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("학생증")
                    }
                
                GraphView()
                    .tabItem {
                        Image(systemName: "chart.bar.fill")
                        Text("통계")
                    }
                
                ApplicationView()
                    .environmentObject(applicationVM)
                    .tabItem {
                        Image(systemName: "checkmark")
                        Text("신청")
                    }
            }.accentColor(Color(Asset.black))
            
            if applicationVM.isOffer {
                reportView(isOffer: true, show: $applicationVM.isOffer, title: $applicationVM.offerTitle, content: $applicationVM.offerContent, completionHandler: {})
            }
            
            if applicationVM.isBug {
                reportView(isOffer: false, show: $applicationVM.isBug, title: $applicationVM.bugTitle, content: $applicationVM.bugContent, completionHandler: {})
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
