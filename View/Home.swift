//
//  Home.swift
//  watchOSPresentation
//
//  Created by Maxim Macari on 2/3/21.
//

import SwiftUI

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct Home: View {
    @State private var topOffset: Int = Int.zero
    @State private var isShowingContent = false
    
    var width = UIScreen.main.bounds.width
    
    struct TopOffsetKey: PreferenceKey {
        typealias Value = Int
        
        static var defaultValue: Value = Int.zero
        
        static func reduce(value: inout Value,nextValue: () -> Value) {
            value = nextValue()
        }
    }
    
    struct DetermineYOffset: View {
        typealias key = TopOffsetKey
        
        var body: some View {
            GeometryReader{ geo in
                let yOffset = geo.frame(in: .named("ScrollView")).origin.y
                Color.clear.preference(key: key.self, value: Int(yOffset))
            }
        }
    }
    
    var body: some View {
        
        
        ScrollView(.vertical, showsIndicators: false) {
            
            ZStack{
                
                DetermineYOffset()
                
                
                //Content
                VStack {
                    ZStack{
                        ForEach(0..<12){ position in
                            Image("1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .offset(y: (width - 120) / 2)
                                .rotationEffect(.init(degrees: Double(position) * 30))
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.5, alignment: .center)
                    .padding(40)
                    .rotationEffect(.init(degrees: Double(TopOffsetKey.defaultValue) * 0.2))
                    
                    
                    ForEach(0..<10) { _ in
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 100)
                    }
                }
            }
            
            
        }
        .onPreferenceChange(TopOffsetKey.self) { value in
            //            topOffset = value
            print(value)
        }
        .coordinateSpace(name: "ScrollView")
    }
}



