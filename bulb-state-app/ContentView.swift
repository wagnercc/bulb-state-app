//
//  ContentView.swift
//  bulb-state-app
//
//  Created by Wagner CC on 19/09/23.
//

import SwiftUI

enum BulbTemperature: String, CaseIterable {
    case quente, neutro, frio
    var id: Self { self }
}

struct ContentView: View {
    @State private var isBulbOn = true
    @State private var selectedBulbTemperature: BulbTemperature = .quente

    var circleColor: Color {
        if isBulbOn {
            if selectedBulbTemperature == .quente {
                return Color(red: 0.97, green: 0.83, blue: 0.34)
            } else if selectedBulbTemperature == .neutro {
                return Color(red: 0.97, green: 0.93, blue: 0.2)
            } else {
                return Color(red: 0.5, green: 0.83, blue: 0.94)
            }
        } else {
            return Color(uiColor: .systemGray3)
        }

    }

    var iconName: String {
        return isBulbOn ? "lightbulb.fill" : "lightbulb"
    }

    func iconColor() -> Color {
        if isBulbOn {
            return .white
        } else {
            return Color(uiColor: .systemGray)
        }
    }

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 270, height: 270)
                    .foregroundColor(circleColor)
                
                Image(systemName: iconName)
                    .font(.system(size: 170))
                    .foregroundColor(iconColor())
                    .transition(.opacity.animation(.default))
                Spacer()
                
            }
            HStack {
                Image(systemName: "lightbulb")
                    .font(.system(size: 20))
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .foregroundColor(.gray)
                Toggle("Lampada", isOn: $isBulbOn)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                    .font(.system(size: 18))
            }
            Picker("Flavor", selection: $selectedBulbTemperature) {
                Text("Quente").tag(BulbTemperature.quente)
                Text("Neutro").tag(BulbTemperature.neutro)
                Text("Frio").tag(BulbTemperature.frio)
            }
                .pickerStyle(.segmented)
                .padding(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
