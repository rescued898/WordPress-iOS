import Foundation

// A single place to put all of our WPiOS events
// Very similar to what we've been doing so far
enum WPAnalyticsEvent: String {
    case mediaEditorShown = "media_editor_shown"
    case mediaEditorUsed = "media_editor_used"

    var properties: [AnyHashable: Any]? {
        switch self {
        case .mediaEditorShown:
            return ["foo": "bar"]
        default:
            return nil
        }
    }
}

extension WPAnalytics {

    /// Track a event
    ///
    /// This will call each registered tracker and fire the given event
    /// - Parameter event: a `String` that represents the event name
    ///
    static func track(_ event: WPAnalyticsEvent) {
        WPAnalytics.trackEvent(event.rawValue)
    }

    /// Track a event
    ///
    /// This will call each registered tracker and fire the given event
    /// - Parameter event: a `String` that represents the event name
    /// - Parameter properties: a `Hash` that represents the properties
    ///
    static func track(_ event: WPAnalyticsEvent, properties: [AnyHashable: Any]) {
        var mergedProperties: [AnyHashable: Any] = event.properties ?? [:]
        mergedProperties.merge(properties) { (_, new) in new }

        WPAnalytics.trackEvent(event.rawValue, withProperties: mergedProperties)
    }

}
