//
//  TermsView.swift
//  MIL
//
//  Created by GoEun Jeong on 2021/08/22.
//

import SwiftUI

struct TermsView: View {
    var body: some View {
        VStack {
            Image(Asset.milImage)
                .resizable()
                .frame(width: UIFrame.width / 1.5, height: UIFrame.width / 2.5)
            
            ScrollView {
                VStack {
                    HStack(spacing: 20) {
                        Text("이용약관, 개인정보 수집 및 이용 학생증 nfc......(대충 약관)...............에 모두 동의합니다.")
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .frame(width: 23, height: 23)
                    }
                    
                    Color(Asset.mil).frame(height: 1)
                        .padding(.vertical)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Text("약관 1..............대충 약관 1")
                            Spacer()
                            Image(systemName: "checkmark.circle")
                                .resizable()
                                .frame(width: 23, height: 23)
                        }
                        Text("약관 1..............대충 약관 1 내용............................................................. .....................................")
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(UIColor.secondarySystemBackground)).border(Color.gray))
                    }
                }.frame(width : UIFrame.width - 60)
                .padding()
                .border(Color.gray)
            }
            
            Text("시작")
                .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.bold)
                .padding()
                .frame(width: UIFrame.width - 70)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(Asset.mil)))
                .padding(.bottom)
        }
    }
}

struct TermsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsView()
    }
}
