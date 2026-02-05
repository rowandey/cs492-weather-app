String getAssetFromDescription(String description, bool isDaytime){
  if (description.toLowerCase().contains("sunny") || description.toLowerCase().contains("clear")){
    if (isDaytime){
      return "assets/icons/clear_day.svg";
    } else {
      return "assets/icons/clear_night.svg";
    }
  }
  if (description.toLowerCase().contains("cloudy")) {
    if (isDaytime) {
      return "assets/icons/partly_cloudy_day.svg";
    } else {
      return "assets/icons/partly_cloudy_night.svg";
    }
  }
  if (description.toLowerCase().contains("snow")) {
    if (isDaytime) {
      return "assets/icons/cloudy_with_snow_light.svg";
    } else {
      return "assets/icons/cloudy_with_snow_dark.svg";
    }
  }
  if (description.toLowerCase().contains("thunder")){
    if (isDaytime) {
      return "assets/icons/strong_thunderstorms.svg";
    } else {
      return "assets/icons/strong_thunderstorms.svg";
    }
  }
  if (description.toLowerCase().contains("rain") || description.toLowerCase().contains("drizzle") || description.toLowerCase().contains("showers")) {
    if (isDaytime) {
      return "assets/icons/showers_rain.svg";
    } else {
      return "assets/icons/showers_rain.svg";
    }
  }
  if (description.toLowerCase().contains("dust")) {
    if (isDaytime) {
      return "assets/icons/haze_fog_dust_smoke.svg";
    } else {
      return "assets/icons/haze_fog_dust_smoke.svg";
    }
  }
  if (description.toLowerCase().contains("smoke")) {
    if (isDaytime) {
      return "assets/icons/haze_fog_dust_smoke.svg";
    } else {
      return "assets/icons/haze_fog_dust_smoke.svg";
    }
  }
  if (description.toLowerCase().contains("fog")) {
    if (isDaytime) {
      return "assets/icons/haze_fog_dust_smoke.svg";
    } else {
      return "assets/icons/haze_fog_dust_smoke.svg";
    }
  }
  if (description.toLowerCase().contains("sleet")) {
    if (isDaytime) {
      return "assets/icons/mixed_rain_hail_sleet.svg";
    } else {
      return "assets/icons/mixed_rain_hail_sleet.svg";
    }
  }

  return "assets/icons/tornado.svg";
}