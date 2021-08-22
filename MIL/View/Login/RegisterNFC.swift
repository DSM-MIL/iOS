//
//  RegisterNFC.swift
//  MIL
//
//  Created by GoEun Jeong on 2021/08/22.
//

import SwiftUI

struct RegisterNFC: View {
    @State var attempts: Int = 0 // 실패 시 shake
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(Asset.studentID)
                .resizable()
                .frame(width: UIFrame.width - 60, height: UIFrame.height / 3.5)
                .padding(.bottom, UIFrame.width / 12)
                .modifier(Shake(animatableData: CGFloat(attempts)))
                .onTapGesture {
                    withAnimation(.default) {
                        self.attempts += 1
                    }
                }
            Text("학생증 등록하기")
                .font(.title)
                .fontWeight(.bold)
            VStack {
                Text("학생증을 폰 가까이 대주세요")
                Text("등록한 이후에는 다시 등록할 필요 없습니다")
            }
        }
    }
}

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
                                                amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
                                              y: 0))
    }
}


struct RegisterNFC_Previews: PreviewProvider {
    static var previews: some View {
        RegisterNFC()
    }
}
