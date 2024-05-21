//
//  ContentView.swift
//  Moonshot
//
//  Created by Dillon Teakell on 5/17/24.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
        VStack {
            Text("\(astronauts.count)")
        }
    }
}

#Preview {
    ContentView()
}
