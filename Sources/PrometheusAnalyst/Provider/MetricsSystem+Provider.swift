
import Foundation

@available(macOS 12, *)
extension MetricsSystem {

    public static func provide<Provider: PrometheusProvider>(from provider: Provider) {
        self._prometheusProvider = provider
    }

    internal static var prometheusProvider: PrometheusProvider {
        get throws {
            guard let provider = _prometheusProvider else {
                throw PrometheusProviderError.notAvailable
            }
            return provider
        }
    }

    private static var _prometheusProvider: PrometheusProvider?

}
