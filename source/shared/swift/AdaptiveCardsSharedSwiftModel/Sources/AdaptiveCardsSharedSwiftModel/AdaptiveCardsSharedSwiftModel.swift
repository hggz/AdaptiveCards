import UIKit

@objc(AdaptiveCardsSharedSwift)
@objcMembers public class AdaptiveCardsSharedSwift: NSObject {
    
    private var activePayload: [String: Any]? = nil
    
    public func parse(payload: String) {
        guard let payloadData = payload.data(using: .utf8) else {
            debugPrint("unable to load payload data:\n\(payload)")
            return
        }
        do {
            let rawResponse = try JSONSerialization.jsonObject(with: payloadData, options: .allowFragments) as? [String: Any]
//            let adaptiveCardsPl = try JSONDecoder().decode(AdaptiveCardsPayload.self, from: payloadData)
            debugPrint("successfully loaded adaptive cards payload data")
            activePayload = rawResponse
        } catch {
            debugPrint("unable to parse adaptive cards payload: \(error)\n\(payload)")
        }
    }
    
    public func renderedView(cardData: String) -> UIView {
        let config = HostConfig()
        let items = [CardElement]()
        let container = Container(hostConfig: config, items: items)
        return container.renderItems()
    }
}
