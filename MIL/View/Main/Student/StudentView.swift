//
//  StudentView.swift
//  MIL
//
//  Created by GoEun Jeong on 2021/08/21.
//

import SwiftUI

struct StudentView: View {
    @State var error = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Spacer()
                VStack(spacing: UIFrame.width / 12) {
                    
                    if error {
                        Text("현재 학생증을 찍을 수 없습니다.")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color(Asset.red))
                            .frame(width: UIFrame.width - 60, height: UIFrame.height / 3.5)
                            .background(
                                RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(radius: 5))
                    } else {
                        Image(Asset.studentID)
                            .resizable()
                            .frame(width: UIFrame.width - 60, height: UIFrame.height / 3.5)
                    }
                    
                  
                    
                    HStack {
                        VStack(spacing: 3) {
                            HStack(alignment: .bottom) {
                                Text("고도현")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("2202")
                            }
                            Text("소프트웨어개발과")
                        }
                        
                        Spacer()
                        
                        HStack {
                            Button(action: {}, label: {
                                Text("로그아웃")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(Asset.blue)))
                            })
                            
                        }
                    }.padding(.bottom, 5)
                    
                    StudentTermsView()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    DSMView()
                }
            }.padding(.bottom, 20)
            .frame(width: UIFrame.width - 60)
            .navigationTitle("학생증")
        }
    }
}

struct StudentTermsView: View {
    var body: some View {
            VStack(alignment: .leading) {
                Text("1. 본 카드는 대덕소프트웨어마이스터고등학교 출입에만 사용할 수 있습니다.")
                Text("2. 본 카드는 타인에게 대여할 수 없습니다.")
                Text(" 3. 교직원의 요청 시 제시하여야 합니다.")
            }
            .font(.callout)
            .padding()
            .multilineTextAlignment(.leading)
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color(UIColor.secondarySystemBackground)))
        }
}

struct DSMView: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
            Text("대덕소프트웨어마이스터고등학교장")
                .fontWeight(.bold)
            VStack(alignment: .trailing) {
                Text("대덕소프트웨어마이스터고등학교")
                    .fontWeight(.bold)
                    .font(.caption)
                VStack(alignment: .trailing) {
                    Text("[305-343] 대덕광역시 유성구 가정북로 76(장동 23-9)")
                    Text("TEL 042-866-8822(교무)")
                }.font(.caption2)
            }
        }.foregroundColor(.gray)
    }
}

struct StudentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentView()
    }
}
