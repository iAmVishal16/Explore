//
//  ContentView.swift
//  Explore
//
//  Created by Vishal Paliwal on 15/05/23.
//

import SwiftUI
import SpriteKit


struct ContentView: View {
    
    @State private var isRotate = false
    @State private var animate = false

    var body: some View {
        ZStack {

            Color("ColorBackground")
                .ignoresSafeArea()


            Image("back")
                .resizable()
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .ignoresSafeArea()
                .opacity(0.4)

            Image("Cover")
                .resizable()
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .ignoresSafeArea()
                .opacity(0.6)

            BlurContentView()

            Universe()

            VStack(alignment: .center, spacing: 0) {

                Spacer()

                Text("Explore the")
                    .font(.custom("fasthand", size: 36))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text("Universe!")
                    .font(.custom("fasthand", size: 36))
                    .foregroundColor(.mint)
                    .fontWeight(.bold)


            }


            //            ScrollView(.horizontal) {
            //                HStack {
            //                    Image("saturn")
            //                        .rotationEffect(.degrees(isRotate ? 360 : 0))
            //                }
            //            }
        }
        .onTapGesture {
            isRotate.toggle()
        }
        .overlay (alignment: .topTrailing) {
            Circle()
                .fill(.white.opacity(0.4))
                .frame(width: 60, height: 60)
                .scaleEffect(x: animate ? 1.1 : 1.0, y: animate ? 1.1 : 1.0, anchor: .center)
                .opacity(animate ? 0.0 : 1.0)
                .animation(Animation.spring().repeatForever(autoreverses: true), value: animate)
                .overlay {
                    ZStack {
                        Circle()
                            .fill(.white.opacity(1.0))
                        .frame(width: 50, height: 50)
                        
                        Image(systemName: "play.fill")
                    }
                }
                .padding(.trailing, 16)
                .onAppear {
                    animate.toggle()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Universe: View {
    
    @State private var rotation = false
    @State private var isRotating = 0.0
    var scene: SKScene {
        let scene = ExplodeScene()
        scene.size = CGSize(width: 300, height: 300)
        scene.scaleMode = .fill
        scene.backgroundColor = .clear
        return scene
    }
    
    var body: some View {
        ZStack {
            
            ZStack {
                
                Circle()
                    .fill(
                        LinearGradient(colors: [.orange, .orange, .red, .orange, .yellow], startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: 380)
                    .offset(x: -UIScreen.main.bounds.width/2)
                    .blur(radius: 25)
                    .opacity(0.8)
                
                Circle()
                    .fill(
                        LinearGradient(colors: [.orange, .orange, .red, .orange, .yellow], startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: 300)
                    .offset(x: -UIScreen.main.bounds.width/2)
                Circle()
                    .frame(width: 340)
                    .foregroundColor(.yellow.opacity(0.3))
                    .offset(x: -UIScreen.main.bounds.width/2)
                    .opacity(rotation ? 1 : 0.8)
                    .animation(Animation.easeOut(duration: 1.5).repeatForever(), value: rotation)
                
                Circle()
                    .frame(width: 380)
                    .foregroundColor(.yellow.opacity(0.1))
                    .offset(x: -UIScreen.main.bounds.width/2)
                    .opacity(rotation ? 1 : 0.4)
                    .animation(Animation.easeOut(duration: 1.5).repeatForever().delay(0.5), value: rotation)
                
//                SpriteView(scene: scene, options: [.allowsTransparency])
//                            .frame(width: 300, height: 300)
//                            .background(.clear)
//                            .clipShape(Circle())
//                            .offset(x: -UIScreen.main.bounds.width/2)
//                            .ignoresSafeArea()

            }
            
            
            Image("neptune")
                .resizable()
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(isRotating))
                .overlay {
                    Circle()
                        .trim(from: 0.0, to: 0.5)
                        .opacity(0.7)
                        .blur(radius: 8)
                        .frame(width: 170, height: 170)
                        .rotationEffect(.degrees(-190))
                }
                .offset(x: -230, y: -320)
            
            Image("uranus")
                .resizable()
                .frame(width: 180, height: 189)
                .overlay {
                    Circle()
                        .trim(from: 0.0, to: 0.5)
                        .opacity(0.7)
                        .blur(radius: 8)
                        .frame(width: 80, height: 80)
                        .rotationEffect(.degrees(-140))
                }
                .offset(x: -80, y: -280)
            
            Image("saturn")
                .resizable()
                .frame(width: 160, height: 139)
                .overlay {
                    Circle()
                        .trim(from: 0.0, to: 0.5)
                        .opacity(0.7)
                        .blur(radius: 8)
                        .frame(width: 100, height: 100)
                        .rotationEffect(.degrees(-120))
                }
                .offset(x: 20, y: -180)
            
            
            Image("jupiter")
                .resizable()
                .frame(width: 140, height: 140)
                .rotationEffect(.degrees(isRotating))
                .overlay {
                    Circle()
                        .trim(from: 0.0, to: 0.5)
                        .opacity(0.7)
                        .blur(radius: 8)
                        .frame(width: 100, height: 100)
                        .rotationEffect(.degrees(-90))
                }
                .offset(x: 60, y: -60)
            
            Image("mars")
                .resizable()
                .frame(width: 160, height: 160)
                .rotationEffect(.degrees(isRotating))
                .overlay {
                    Circle()
                        .trim(from: 0.1, to: 0.6)
                        .opacity(0.7)
                        .blur(radius: 8)
                        .frame(width: 90, height: 90)
                        .rotationEffect(.degrees(-90))
                }
                .offset(x: 50, y: 80)
            //                .rotationEffect(.degrees(45))
            
            Image("earth")
                .resizable()
                .frame(width: 87, height: 87)
                .rotationEffect(.degrees(isRotating))
                .overlay {
                    Circle()
                        .trim(from: 0.1, to: 0.6)
                        .opacity(0.7)
                        .blur(radius: 8)
                        .frame(width: 87, height: 87)
                        .rotationEffect(.degrees(-80))
                }
                .offset(x: -20, y: 180)
            
            //                .rotationEffect(.degrees(45))
            
            Image("venus")
                .resizable()
                .frame(width: 60, height: 60)
                .rotationEffect(.degrees(isRotating))
                .overlay {
                    Circle()
                        .trim(from: 0.0, to: 0.5)
                        .opacity(0.7)
                        .blur(radius: 8)
                        .frame(width: 60, height: 60)
                        .rotationEffect(.degrees(-40))
                }
                .offset(x: -100, y: 220)
            //                .rotationEffect(.degrees(45))
            
            Image("mercury")
                .resizable()
                .frame(width: 40, height: 40)
                .rotationEffect(.degrees(isRotating))
                .overlay {
                    Circle()
                        .trim(from: 0.0, to: 0.5)
                        .opacity(0.7)
                        .blur(radius: 8)
                        .frame(width: 40, height: 40)
                }
                .offset(x: -160, y: 230)
            
        }
        .onAppear {
            rotation.toggle()
            withAnimation(.linear(duration: 1)
                .speed(0.1).repeatForever(autoreverses: false)) {
                    isRotating = 360.0
                }
        }
    }
}


struct BlurContentView: View {
    @State private var run = false
    
    var body: some View {
        ZStack {
            GeometryReader { gp in
                ForEach(0..<8) {_ in
                    ForEach(0..<5) { _ in
                        Circle().fill(Color.white)
                            .frame(width: 3, height: 3)
                            .position(x: calculateRandom(in: gp.size.width),
                                      y: calculateRandom(in: gp.size.height))
                            .animation(nil)     // << no animation for above modifiers
                            .blur(radius: run ? 2 : 0)
                        
                    }
                }
            }
            .animation(Animation.easeInOut(duration: 6)
                .repeatForever(autoreverses: true), value: run) // animate one value
            .onAppear() {
                self.run = true
            }
        }
    }
    
    func calculateRandom(in value: CGFloat) -> CGFloat {
        return CGFloat(Int.random(in: 10..<Int(value) - 10))
    }
}

struct UniverseRotation: View {
    
    @State private var rotation = false
    @State private var isRotating = 0.0
    
    var body: some View {
        ZStack {
            
            Color("ColorBackground")
                .ignoresSafeArea()
            
            ZStack {
                
                Circle()
                    .fill(
                        AngularGradient(colors: [.orange, .orange, .red, .orange, .red, .yellow], center: .bottomLeading)
                    )
                    .frame(width: 180)
                    
                    .blur(radius: 25)
                    .opacity(0.8)
                
                Circle()
                    .fill(
                        AngularGradient(colors: [.orange, .orange, .red, .orange, .red, .yellow], center: .bottomLeading)
                    )
                    .frame(width: 100)
                    
                Circle()
                    .frame(width: 140)
                    .foregroundColor(.yellow.opacity(0.3))
                    
                    .opacity(rotation ? 1 : 0.8)
                    .animation(Animation.easeOut(duration: 1.5).repeatForever(), value: rotation)
                
                Circle()
                    .frame(width: 180)
                    .foregroundColor(.yellow.opacity(0.1))
                    
                    .opacity(rotation ? 1 : 0.8)
                    .animation(Animation.easeOut(duration: 1.5).repeatForever().delay(0.5), value: rotation)
            }
            
            
            ZStack {
                Image("neptune")
                    .resizable()
                    .frame(width: 87, height: 87)
                    .rotationEffect(.degrees(isRotating))
                    .overlay {
                        Circle()
                            .trim(from: 0.0, to: 0.5)
                            .opacity(0.7)
                            .blur(radius: 6)
                            .frame(width: 170, height: 170)
                            .rotationEffect(.degrees(-190))
                    }
                .offset(x: -80, y: -180)
                
                Image("uranus")
                    .resizable()
                    .frame(width: 180, height: 189)
                    .overlay {
                        Circle()
                            .trim(from: 0.0, to: 0.5)
                            .opacity(0.7)
                            .blur(radius: 6)
                            .frame(width: 80, height: 80)
                            .rotationEffect(.degrees(-140))
                    }
                    .offset(x: 100, y: -160)
                
                Image("saturn")
                    .resizable()
                    .frame(width: 160, height: 139)
                    .overlay {
                        Circle()
                            .trim(from: 0.0, to: 0.5)
                            .opacity(0.7)
                            .blur(radius: 6)
                            .frame(width: 100, height: 100)
                            .rotationEffect(.degrees(-120))
                    }
                    .offset(x: 180, y: -20)
                
                
                Image("jupiter")
                    .resizable()
                    .frame(width: 87, height: 87)
                    .rotationEffect(.degrees(isRotating))
                    .overlay {
                        Circle()
                            .trim(from: 0.0, to: 0.5)
                            .opacity(0.7)
                            .blur(radius: 6)
                            .frame(width: 100, height: 100)
                            .rotationEffect(.degrees(-90))
                    }
                    .offset(x: 140, y: 120)
                
                Image("mars")
                    .resizable()
                    .frame(width: 87, height: 87)
                    .rotationEffect(.degrees(isRotating))
                    .overlay {
                        Circle()
                            .trim(from: 0.1, to: 0.6)
                            .opacity(0.7)
                            .blur(radius: 6)
                            .frame(width: 90, height: 90)
                            .rotationEffect(.degrees(-90))
                    }
                    .offset(x: 20, y: 190)
                //                .rotationEffect(.degrees(45))
                
                Image("earth")
                    .resizable()
                    .frame(width: 87, height: 87)
                    .rotationEffect(.degrees(isRotating))
                    .overlay {
                        Circle()
                            .trim(from: 0.1, to: 0.6)
                            .opacity(0.7)
                            .blur(radius: 6)
                            .frame(width: 87, height: 87)
                            .rotationEffect(.degrees(-80))
                    }
                    .offset(x: -100, y: 160)
                
                //                .rotationEffect(.degrees(45))
                
                Image("venus")
                    .resizable()
                    .frame(width: 87, height: 87)
                    .rotationEffect(.degrees(isRotating))
                    .overlay {
                        Circle()
                            .trim(from: 0.0, to: 0.5)
                            .opacity(0.7)
                            .blur(radius: 8)
                            .frame(width: 60, height: 60)
                            .rotationEffect(.degrees(40))
                    }
                    .offset(x: -150, y: 80)
                //                .rotationEffect(.degrees(45))
                
                Image("mercury")
                    .resizable()
                    .frame(width: 87, height: 87)
                    .rotationEffect(.degrees(isRotating))
                    .overlay {
                        Circle()
                            .trim(from: 0.0, to: 0.5)
                            .opacity(0.7)
                            .blur(radius: 8)
                            .frame(width: 70, height: 70)
                            .rotationEffect(.degrees(90))
                    }
                    .offset(x: -160, y: -40)
            }
//            .rotationEffect(.degrees(isRotating))
            
            
        }
        .onAppear {
            rotation.toggle()
            withAnimation(.linear(duration: 1)
                .speed(0.1).repeatForever(autoreverses: false)) {
                    isRotating = 360.0
                }
        }
    }
}


class ExplodeScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        for _ in 0...20 {
            let explosion = SKEmitterNode(fileNamed: "Explosion")!
            explosion.particleSize = CGSize(width: 10, height: 10)
            explosion.position = CGPoint.random(rangeX:300, rangeY:300)
            self.addChild(explosion)
        }
        
        animateNodes(self.children)

//        let timer = Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true) { timer in
//            print("Timer fired!")
//
//            var i = 0
//            while (i<20) {
//                let explosion = SKEmitterNode(fileNamed: "Explosion")!
//                explosion.particleSize = CGSize(width: 10, height: 10)
//                explosion.position = CGPoint.random(rangeX:300, rangeY:300)
//                self.addChild(explosion)
//
//                //            self.run(SKAction.playSoundFileNamed("explosion.mp3", waitForCompletion: false))
//
//                let delayAction = SKAction.wait(forDuration: TimeInterval(i) * 2.5)
//                self.run(delayAction) {
//                    explosion.removeFromParent()
//                }
//
//                i += 1
//            }
//        }
    }

    func animateNodes(_ nodes: [SKNode]) {
            for (index, node) in nodes.enumerated() {
                // Offset each node with a slight delay depending on the index
                let delayAction = SKAction.wait(forDuration: TimeInterval(index) * 0.2)
                node.isHidden = false
                // Scale up and then back down
//                let scaleUpAction = SKAction.scale(to: 1.5, duration: 0.3)
//                let scaleDownAction = SKAction.scale(to: 1, duration: 0.3)

                // Wait for 2 seconds before repeating the action
                let waitAction = SKAction.wait(forDuration: 2)

                // Form a sequence with the scale actions, as well as the wait action
                let scaleActionSequence = SKAction.sequence([waitAction])

                // Form a repeat action with the sequence
                let repeatAction = SKAction.repeatForever(scaleActionSequence)

                // Combine the delay and the repeat actions into another sequence
                let actionSequence = SKAction.sequence([delayAction, repeatAction])

                // Run the action
                node.run(actionSequence)
                
//                let delayAction = SKAction.wait(forDuration: TimeInterval(index) * 2.5)
//                node.run(delayAction) {
//                    node.isHidden = true
//                }
            }
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        let location = touch.location(in: self)
//        let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
//        box.position = location
//        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
//        addChild(box)
    }
}

extension CGPoint {

    static func random()->CGPoint { return CGPoint(x:Int(arc4random()%1000),y:Int(arc4random()%1000))}

    static func random(range:Int)->CGPoint {
         return CGPoint(x:Int(arc4random() % UInt32(range)),y:Int(arc4random() % UInt32(range)))}

    static func random(rangeX:Int, rangeY:Int)->CGPoint {
         return CGPoint(x:Int(arc4random() % UInt32(rangeX)),y:Int(arc4random() % UInt32(rangeY)))}
}
