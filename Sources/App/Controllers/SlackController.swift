import Vapor

struct SlackController : RouteCollection
{
    func boot(router: Router) throws
    {
        // routes go here
        router.get("weather", use: getCurrentWeather)
    }
    
    func getCurrentWeather(_ req: Request) throws -> Future<SlackPayload>
    {
        return try req.client().get("https://api.darksky.net/forecast/[your-api-key]/42.3601,-71.0589").flatMap
        { response in
            return try response.content.decode(Forecast.self).map
            { forecast in
                var payload = SlackPayload()
                payload.text = "Here's the weather"
                
                var attachment = SlackAttachment()
                attachment.title = "It is currently \(forecast.currently.temperature.tempString()) \(forecast.currently.summary)"
                attachment.color = "good"
                
                let attachments = [attachment]
                payload.attachments = attachments
                return payload
            }
        }
    }

}

extension Double
{
    func tempString() -> String
    {
        return "\(Int(self.rounded()))º F"
    }
}

