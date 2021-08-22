//
//  Toast.swift
//  MIL
//
//  Created by GoEun Jeong on 2021/08/22.
//

import SwiftUI

struct Toast: View {
    let title: String
    let image: String
    let backgroundColor: Color = Color(UIColor.secondarySystemBackground)
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Image(systemName: image)
                Text(title)
            }.font(.headline)
            .foregroundColor(.primary)
            .padding(.vertical, 20)
            .padding(.horizontal, 40)
            .background(backgroundColor)
            .clipShape(Capsule())
        }
        .frame(width: UIFrame.width / 1.25)
        .transition(.move(edge: .bottom).combined(with: .opacity))
        .onTapGesture {
            withAnimation {
                self.show = false
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.show = false
                }
            }
        }
    }
}

struct Toast_Previews: PreviewProvider {
    static var previews: some View {
        Toast(title: "toast message", image: "checkmark", show: .constant(true))
    }
}
