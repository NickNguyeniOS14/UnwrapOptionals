// This playground was written to illustrate 2 ways to safely unwrap optionals:
// through optional binding (if let) and the guard statement.
// I chose to illustrate with these 2 methods to compare the messiness of
// nested if-statements with the cleaner looking code of using guard.
// More ways to safely unwrap optionals can be found here:
// https://www.raywenderlich.com/762435-swift-interview-questions-and-answers#toc-anchor-011

// Note: in case you're wondering why I'm not demonstrating with a dictionary entry
// of [nil, nil], it's because there is already a key with nil [nil: 67],
// and so this dictionary would have duplicate keys and not compile.
// Plus, I think one entry w/ a nil key and one entry w/ a nil value is enough
// to demonstrate my point about safely unwrapping optionals

var locationWeatherDict = [String?: Int?]()

locationWeatherDict = ["New York City": 34,
                       nil: 67,
                       "Denver": nil,
                       "Houston": 81,
                       "Minneapolis": 20]


func UnwrapWithOptionalBinding() {
  print("Results of Unwrapping Optionals Using Optional Binding:")
  for (location, weather) in locationWeatherDict {
    var weatherReport = "The weather in "
    if let validLocation = location {
      weatherReport.append(contentsOf: validLocation)
      if let validWeather = weather {
        weatherReport.append(contentsOf: " is " + String(validWeather) +  " degrees")
        print(weatherReport)
      }
    }
  }
}

func UnwrapWithGuard() {
  print("Results of Unwrapping Optionals Using Guard:")
  for (location, weather) in locationWeatherDict {
    var weatherReport = "The weather in "
    guard let validLocation = location else {
      continue
    }
    guard let validWeather = weather else {
      continue
    }
    weatherReport = weatherReport + validLocation + " is " + String(validWeather) + " degrees"
    print(weatherReport)
  }
}

func ForcedUnwrapping() {
  print("Results of Forced Unwrapping of Optionals:")
  for (location, weather) in locationWeatherDict {
    var weatherReport = "The weather in "
    weatherReport = weatherReport + location! + " is " + String(weather!) + " degrees"
    print(weatherReport)
  }
}

UnwrapWithOptionalBinding()
print("\n")
UnwrapWithGuard()
print("\n")

// Note: uncomment below to see the results of
// forced unwrapping. Warning: Program will crash!
//ForcedUnwrapping()

