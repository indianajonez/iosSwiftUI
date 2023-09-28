//
//  PlayerView.swift
//  HWSwiftUI
//
//  Created by Ekaterina Saveleva on 22.09.2023.
//

import SwiftUI
import AVFoundation

class PlayerViewModel: ObservableObject {
    // свойство c модификатор @Published отправлять сообщения о том, что изменилась значение maxDuration
   @Published public var maxDuration = 0.0
    private var player: AVAudioPlayer?
    
    public func play() {
        playSong(name: "test")
        player?.play()
    }
    
    public func stop() {
        player?.stop()
    }
    
    public func setTime(value: Float) {
        guard let time = TimeInterval(exactly: value) else { return }
        player?.currentTime = time
        player?.play()
    }
    
    private func playSong(name: String) {
        guard let audioPath = Bundle.main.path( forResource: name, ofType: "mp3") else { return }
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            maxDuration = player?.duration ?? 0.0
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct PlayerView: View {
    
    @State private var progress: Float = 0
    @ObservedObject var viewModel = PlayerViewModel()
    
    var body: some View {
        VStack {
//            Slider(value: $progress).padding().accentColor(Color.cyan)
//            Slider(value: $progress, in: 0...100).padding()
            
            Slider(value: Binding(get: {
                Double(self.progress)
            }, set: { newValue in
                self.progress = Float(newValue)
                self.viewModel.setTime(value: Float(newValue))
            }), in: 0...viewModel.maxDuration).padding().accentColor(Color.green)
            
            HStack {
                Button(action: {
                    self.viewModel.play()
                       }, label: {
                    Text("Play")
                               .foregroundColor(Color.white)
                })
                .frame(width: 100, height: 50)
                .background(Color.orange)
                .cornerRadius(10)
                
                Button(action: {
                    self.viewModel.stop()
                       }, label: {
                    Text("Stop")
                               .foregroundColor(Color.white)
                })
                .frame(width: 100, height: 50)
                .background(Color.orange)
                .cornerRadius(10)
            }
            
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
