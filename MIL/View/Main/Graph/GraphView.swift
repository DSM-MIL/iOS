//
//  GraphView.swift
//  MIL
//
//  Created by GoEun Jeong on 2021/08/21.
//

import SwiftUI

struct GraphView: View {
    @State var error = false
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: UIFrame.width / 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    
                    VStack(spacing: UIFrame.width / 20) {
                        HStack {
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Spacer()
                                    Text("나의 급식")
                                }
                                Rectangle().foregroundColor(Color(Asset.yellow))
                                   
                            }.frame(width: UIFrame.width / 2, height: UIFrame.height / 12)
                            Spacer()
                        }
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Spacer()
                                    Text("평균 급식량")
                                }
                                Rectangle().foregroundColor(Color(Asset.yellow))
                                   
                            }.frame(width: UIFrame.width / 2, height: UIFrame.height / 12)
                            Spacer()
                        }
                    }
                    
                    
                }.frame(width: UIFrame.width - 70, height: UIFrame.height / 3.8)
                
                VStack(alignment: .leading) {
                    Text("2021.06.03")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("아침")
                            Rectangle().foregroundColor(Color(Asset.white))
                                .border(Color(UIColor.gray))
                                .frame(height: 10)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("점심")
                            Rectangle().foregroundColor(Color(Asset.white))
                                .border(Color(UIColor.gray))
                                .frame(height: 10)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("저녁")
                            Rectangle().foregroundColor(Color(Asset.white))
                                .border(Color(UIColor.gray))
                                .frame(height: 10)
                        }
                    }.frame(width: UIFrame.width / 1.4)
                }
                VStack(alignment: .leading) {
                    GraphRow(title: "지난 한 달 동안 주말 급식 통계", date: "2021.05")
                    GraphRow(title: "지난 1년 동안 주말 급식 통계", date: "2020")
                    GraphRow(title: "전체 주말 급식 통계 보기", date: "2020.06.02~2021.06.03")
                }
                
            }
            .padding(.bottom, 20)
            .frame(width: UIFrame.width - 60)
            .navigationTitle("주말 급식 통계")
        }
        
    }
}

struct GraphRow: View {
    let title: String
    let date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                Text(date)
                    .foregroundColor(.gray)
            }
            Spacer()
        }.padding()
        .frame(width: UIFrame.width - 60)
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(UIColor.secondarySystemBackground)))
        
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
