//
//  Test.swift
//  watchOSPresentation
//
//  Created by Maxim Macari on 3/3/21.
//

import SwiftUI

struct Test: View {
    
    @State private var scrollViewContentOffset = CGFloat.zero
    
    var body: some View{
        
        VStack(spacing: 0){
            TrackableScrollView(.vertical, showIndicators: false, contentOffset: $scrollViewContentOffset){
                CustomContent(offsetScrollView: Double(scrollViewContentOffset))
                
            }
        }
        .background(
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
        )
        
        
    }
}

struct CustomContent: View{
    
    
    var offsetScrollView = 0.0
    var upperSpacer = CGFloat(UIScreen.main.bounds.height * 0.25)
    @State var fullRotated = false
    @State var colorScheme: ColorScheme = .light
    @State var endSpace: CGFloat = CGFloat.zero
    
    
    
    var body: some View{
        //Content
        VStack(spacing: 0){
            Spacer(minLength: CGFloat(self.offsetScrollView) < upperSpacer ? CGFloat(self.offsetScrollView) : upperSpacer)
            
            Header(offsetScrollView: self.offsetScrollView, rotated: self.fullRotated)
            
            VStack(spacing: 0){
                //                Text("watchOS 7 ha llegado para cambiarlo todo. Ahora las personas de tu familia que no tengan iPhone pueden usar un Apple Watch. Con las nuevas y prácticas esferas aprovechas cada minuto del día. Y por la noche, el reloj y la app Sueño trabajan para que tú descanses mejor.")
                //                    .font(.caption2)
                
                VStack{
                    Text("Id sea utamur aperiam, te per choro accusamus consulatu. Brute munere corrumpit ut pri. Ea ipsum appareat erroribus mea. Mei probo inani aliquid ad. Omnis fabulas concludaturque an vix, an noluisse takimata facilisis pro, sit te volumus mandamus. Ad malorum imperdiet duo, ea possim utamur accusamus vix. An vim commodo dolorem volutpat, cu expetendis voluptatum usu, et mutat consul adversarium his. His natum numquam legimus an, diam fabulas mei ut. Melius fabellas sadipscing vel id. Partem diceret mandamus mea ne, has te tempor nostrud. Aeque nostro eum no. Lorem salutandi eu mea, eam in soleat iriure assentior. Tamquam lobortis id qui. Ea sanctus democritum mei, per eu alterum electram adversarium. Ea vix probo dicta iuvaret, posse epicurei suavitate eam an, nam et vidit menandri. Ut his accusata petentium. Virtute equidem ceteros in mel. Id volutpat neglegentur eos. Eu eum facilisis voluptatum, no eam albucius verterem. Sit congue platonem adolescens ut. Offendit reprimique et has, eu mei homero imperdiet. No his munere interesset. At soluta accusam gloriatur eos, ferri commodo sed id, ei tollit legere nec. Eum et iudico graecis, cu zzril instructior per, usu at augue epicurei. Saepe scaevola takimata vix id. Errem dictas posidonium id vis, ne modo affert incorrupte eos. Eam ex integre quaeque bonorum, ea assum solet scriptorem pri, et usu nonummy accusata interpretaris. Debitis necessitatibus est no. Eu probo graeco eum, at eius choro sit, possit recusabo corrumpit vim ne. Noster diceret delicata vel id.")
                        .foregroundColor(fullRotated ? Color.white : Color("customBlack"))
                        .multilineTextAlignment(.center)
                        .padding()
                        
                    Text("Content offset: \(Int(self.offsetScrollView))")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                        .padding(.top, endSpace)
                    
                    Button(action: {
                        self.endSpace += 20
                    }, label: {
                        Text("Add more space to the scroll")
                            .font(.title2)
                            .fontWeight(.bold)
                    })
                    .padding()
                    .shadow(color: .blue, radius: 10, x: 5, y: 5)
                    .shadow(color: .blue, radius: 10, x: -5, y: -5)
                    .background(Color.blue.opacity(0.8))
                    .buttonStyle(PlainButtonStyle())
                    .cornerRadius(15)
                        
                }
                .padding(.vertical)
                .background(Color(.systemBackground)) // fullRotated ? Color("customBlack") : Color.white
            }
            .padding(.top, -UIScreen.main.bounds.height * 0.25)
        }
        .onChange(of: self.offsetScrollView, perform: { value in
            if value >= 195 {
                withAnimation(.spring()){
                    //dark
                    self.fullRotated = true
                    colorScheme = .dark
                }
            } else {
                withAnimation(.spring()){
                    //light
                    self.fullRotated = false
                    colorScheme = .light
                }
            }
        })
        .ignoresSafeArea(.all, edges: .top)
        .environment(\.colorScheme, colorScheme)
        
    }
    
    
    struct Header: View {
        
        var width = UIScreen.main.bounds.width
        var offsetScrollView = 0.0
        var rotated = false
        
        var body: some View{
            
            
            ZStack(){
                ForEach(0..<10){ position in
                    
                    let watchDegrees = Double(position) * 36
                    Clock()
                        .frame(width: 95, height: 95)
                        .offset(y: (width - 80) / 1.5)
                        //360 / 10 = 36
                        .rotationEffect(.init(degrees:watchDegrees))
                    
                }
//                280 * 0,2 = 56 maximum value for rotation effect
                .rotationEffect(.init(degrees: self.rotated ? Double(56) : Double(self.offsetScrollView) * 0.2))
                
                VStack(spacing: 0){
                    
                    Spacer()
                    
                    Text("watchOS 7")
                        .fontWeight(.medium)
                        .font(.caption)
                        .foregroundColor(self.rotated ? Color.white : Color.black)
                    
                    
                    Text("Un cambio como \ndel día a la noche")
                        .fontWeight(.medium)
                        .font(.title)
                        .foregroundColor(self.rotated ? Color.white : Color.black)
                    
                    Spacer()
                    
                    Spacer()
                    
                    
                    
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.5)
            .padding(.top, 100)
            .background(Color(.systemBackground)) //self.rotated ? Color("customBlack") : Color.white
            .ignoresSafeArea(.all)
            
            
        }
    }
}



struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}


