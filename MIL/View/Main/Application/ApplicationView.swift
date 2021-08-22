//
//  ApplicationView.swift
//  MIL
//
//  Created by GoEun Jeong on 2021/08/21.
//

import SwiftUI

struct ApplicationView: View {
    @EnvironmentObject var viewModel: ApplicationViewModel
    @State var show = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: UIFrame.width / 8) {
                        Button(action: {
                            viewModel.isMeal.toggle()
                        }, label: {
                            HStack(spacing: 20) {
                                Image(Asset.meal.name)
                                    .resizable()
                                    .frame(width: UIFrame.width / 3, height: UIFrame.width / 3)
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("주말 급식 신청")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(Asset.black))
                                    Text("주말 급식을 간편하게 앱으로 신청합니다")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        })
                        
                        Button(action: {
                            viewModel.isOffer.toggle()
                        }, label: {
                            HStack(spacing: 20) {
                                Image(Asset.offer.name)
                                    .resizable()
                                    .frame(width: UIFrame.width / 3, height: UIFrame.width / 3)
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("기능 건의")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(Asset.black))
                                    Text("추가하고 싶은 기능이 있다면 건의하세요")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        })
                        
                        Button(action: {
                            viewModel.isBug.toggle()
                        }, label: {
                            HStack(spacing: 20) {
                                Image(Asset.bug.name)
                                    .resizable()
                                    .frame(width: UIFrame.width / 3, height: UIFrame.width / 3)
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("버그 신고")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(Asset.black))
                                    Text("문제가 있으면 알려주세요")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        })
                    }
                    Spacer()
                    Spacer()
                }.frame(width: UIFrame.width - 70)
                
                VStack {
                    Spacer()
                    if self.show {
                        Toast(title: "주말 급식이 신청되었습니다.", image: "checkmark.circle", show: self.$show)
                            .padding(.bottom)
                    }
                }
            }
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        self.show = true
                    }
                }
            }
            .navigationTitle("신청")
        }.ignoresSafeArea(.all, edges: .all)
    }
}

struct reportView: View {
    var isOffer: Bool
    @Binding var show: Bool
    @Binding var title: String
    @Binding var content: String
    var completionHandler: () -> ()
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.25)
                .ignoresSafeArea(.all)
                .onTapGesture {
                    self.show.toggle()
                }
            
            VStack(alignment: .leading, spacing: 10) {
                if isOffer {
                    Text("기능 건의")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.top)
                } else {
                    Text("버그 신고")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.top)
                }
                
                TextField("제목", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: UIFrame.width / 1.7)
                
                TextView(text: $content)
                    .frame(height: UIFrame.height / 6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(UIColor.secondarySystemBackground), lineWidth: 1)
                    ).padding(.bottom, 10)
                
                HStack {
                    Spacer()
                    Text("취소")
                        .foregroundColor(Color(Asset.red))
                        .fontWeight(.bold)
                        .onTapGesture {
                            self.show.toggle()
                        }
                    Spacer()
                    Spacer()
                    Text("전송")
                        .foregroundColor(Color(Asset.blue))
                        .fontWeight(.bold)
                        .onTapGesture {
                            completionHandler()
                            self.show.toggle()
                        }
                    Spacer()
                }
                
            }.padding()
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white) .shadow(radius: 3))
            .frame(width: UIFrame.width / 1.3)
        }
    }
}

struct ApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationView()
    }
}
