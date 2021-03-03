//
//  Clock.swift
//  watchOSPresentation
//
//  Created by Maxim Macari on 3/3/21.
//

import SwiftUI

struct Clock: View {
    var body: some View {
        ZStack{
            Image("1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 95, height: 95)
                
                
            Image("essence\(String(Int.random(in: 1...5)))")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
        }
        
    }
}

struct Clock_Previews: PreviewProvider {
    static var previews: some View {
        Clock()
    }
}
