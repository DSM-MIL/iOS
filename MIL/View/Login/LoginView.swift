//
//  LoginView.swift
//  MIL
//
//  Created by GoEun Jeong on 2021/08/21.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            Image(Asset.launchScreen)
                .resizable()
                .scaledToFill()
            
            VStack(spacing: 20) {
                Image(Asset.milCali)
                    .resizable()
                    .frame(width: UIFrame.width / 1.3, height: UIFrame.width / 2.5)
                
                HStack(alignment: .center) {
                    Text("Sign in")
                        .fontWeight(.bold)
                    Text("with")
                        .fontWeight(.bold)
                    Text("DSM Auth")
                        .fontWeight(.bold)
                }
                .font(.title2)
                .foregroundColor(.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(Asset.mil)))
                
//                Text("")
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
