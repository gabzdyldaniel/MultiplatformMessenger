//
//  MqttService.swift
//  MultiplatformMessenger
//
//  Created by Daniel Gabzdyl on 14.05.2022.
//

import SwiftUI
import CocoaMQTT

protocol MqttObserver {
    func onMessageReceive(_ payloadString: String, topic: String)
}

class MqttService: ObservableObject {

    static let shared = MqttService()

    @Published public var status: CocoaMQTTConnState = .disconnected

    private var client: CocoaMQTT?
    private var observers: [MqttObserver] = []

    func prepareMqttConnection() {
        let client = CocoaMQTT(clientID: "386a9184-6776-44d9-8cf2-985a331f3c3d",
                               host: "b2a-backend.dico.dev06.b2a.cz",
                               port: 21317)
        client.keepAlive = 0
        client.delegate = self
        client.autoReconnect = true
        client.autoReconnectTimeInterval = 5
        client.enableSSL = true
        client.logLevel = .debug
        client.cleanSession = true

        self.client = client
    }

    func connect() {
        guard status != .connected, status != .connecting else { return }
        _ = client?.connect()
    }

    func registerObserver(_ observer: MqttObserver) {
        observers.append(observer)
    }

    func subscribe(to topic: String) {
        client?.subscribe(topic)
    }

    func unsubscribe(from topic: String) {
        client?.unsubscribe(topic)
    }

    func publish(string payload: String, topic: String, qos: CocoaMQTTQoS = .qos1, retain: Bool = false) {
        client?.publish(topic, withString: payload, qos: qos, retained: retain)
    }
}

extension MqttService: CocoaMQTTDelegate {
    public func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        if ack == .accept {
            status = .connected
        }
    }

    public func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
        status = .disconnected
    }

    public func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        DispatchQueue.main.async {
            if let payload = message.string {
                for observer in self.observers {
                    observer.onMessageReceive(payload, topic: message.topic)
                }
            }
        }
    }


    public func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {}
    public func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {}
    public func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopics success: NSDictionary, failed: [String]) {}
    public func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopics topics: [String]) {}
    public func mqttDidPing(_ mqtt: CocoaMQTT) {}
    public func mqttDidReceivePong(_ mqtt: CocoaMQTT) {}
}
