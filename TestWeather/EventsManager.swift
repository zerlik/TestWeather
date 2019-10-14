//
//  EventsManager.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/14/19.
//  Copyright © 2019 Home. All rights reserved.
//
//
//import Foundation
//import Amplitude_iOS
//
//enum Event: String {
//    case launchFirstTime = "Launch first time"
//    case sessionStart = "Session start"
//    case continueTapped = "continue_tapped"
//    case masterCreated = "master_Created"
//    case masterConfirmed = "master_confirmed"
//    case instructionStart = "instruction_start"
//    case settingsPressed = "settings_pressed"
//    case instructionSkip = "instruction_skip"
//    case instructionContinue  = "instruction_continue "
//    case password_start = "password_start"
//    case nameFinished = "name_finished"
//    case loginFinished = "login_finished"
//    case passFinished = "pass_finished"
//    case passwordFinished = "password_finished"
//    case synchronization = "Synchronization"
//    case subscriptionSettings = "subscription_settings" //1. Purchased ( yes/no) - купил ли пользователь подписку 2. purchaseType (month/year/lifetime) - тип купленной подписки 3. Screen_type (1/2) - первый( экран с годовой подпиской), второй( экран с лайфтайм подпиской)
//    case subscriptionPassword = "subscription_password" //1. Purchased ( yes/no) - купил ли пользователь подписку 2. purchaseType (month/year/lifetime) - тип купленной подписки 3. Screen_type (1/2) - первый( экран с годовой подпиской), второй( экран с лайфтайм подпиской)
//}
//
//enum TrackerType {
//    case amplitude
//}
//
//protocol TrackerProtocol {
//    var type: TrackerType { get }
//    func track(_ log: Event, desc: [AnyHashable: Any]?)
//    init()
//}
//
//final class AmplitudeUser: TrackerProtocol {
//
//    func track(_ log: Event, desc: [AnyHashable: Any]?) {
////        if isDebug {
////            print("Keeper AI event with log \(log.rawValue)")
////        } else {
//            if desc != nil {
//                amplitude?.logEvent(log.rawValue, withEventProperties: desc)
//            } else {
//                amplitude?.logEvent(log.rawValue)
//            }
////        }
//    }
//
//    enum Constants {
//        static let key = "enter your key here"
//    }
//
//    let amplitude = Amplitude.instance()
//    var type: TrackerType = .amplitude
//
//    init() {
//        amplitude?.initializeApiKey(Constants.key)
//        amplitude?.setUserProperties(userProperties(), replace: true)
//    }
//
////    private func userProperties() -> [AnyHashable: Any] {
//////        let realm = try! Realm()
//////        var userSettings = UserDefaultsStorage.userFirstTime
//////        userSettings.updateValue( realm.objects(RealmAccountModel.self).count, forKey: "object_amount")
//////        return userSettings
////    }
//}
//
//class TrackManager {
//
//    static let shared = TrackManager()
//
//    var trackers: [TrackerProtocol] {
//        return [
//            AmplitudeUser()
//        ]
//    }
//
//    func track(_ types: TrackerType..., log: Event, desc: [AnyHashable: Any]? = nil) {
//        trackers.forEach {
//            if types.contains($0.type) {
//                $0.track(log, desc: desc)
//            }
//        }
//    }
//}
//
//
//
////MARK:- event first start or session start
////if UserDefaultsStorage.isFirstTime {
////    TrackManager.shared.track(.amplitude, log: .launchFirstTime)
////} else {
////    TrackManager.shared.track(.amplitude, log: .sessionStart)
////}
