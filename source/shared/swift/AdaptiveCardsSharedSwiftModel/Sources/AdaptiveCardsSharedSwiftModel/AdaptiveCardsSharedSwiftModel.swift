import Foundation

@objc(AdaptiveCardsSharedSwift)
@objcMembers public class AdaptiveCardsSharedSwift: NSObject {
    
    public func parse(payload: String) {
        guard let payloadData = payload.data(using: .utf8) else {
            debugPrint("unable to load payload data:\n\(payload)")
            return
        }
        do {
            let rawResponse = try JSONSerialization.jsonObject(with: payloadData, options: .allowFragments) as? [String: Any]
//            let adaptiveCardsPl = try JSONDecoder().decode(AdaptiveCardsPayload.self, from: payloadData)
            let adaptiveCardsPl = try JSONDecoder().decode(AdaptiveCardProperties.self, from: payloadData)
            debugPrint("successfully loaded adaptive cards payload data")
        } catch {
            debugPrint("unable to parse adaptive cards payload: \(error)\n\(payload)")
        }
    }
}
