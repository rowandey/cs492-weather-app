# WeatherWatcher: A Hands-Off Weather App

## Overview
This is a simple but reliable weather app for all of your weather viewing needs. It uses the offical [https://www.weather.gov/documentation/services-web-api](NOAA API) to pull the most recent weather information using a location of your choice, or your devices GPS location. The app will save any locations you look at, using GPS or manual input. It will display the temperature, short forecast for all avaible days, the detailed forecast for any day you select (along with the wind direction!).

## Build Instructions
### Step 0: Install Flutter and Android Studio
1. Flutter install instructions can be found here: 
    [https://docs.flutter.dev/install/manual](https://docs.flutter.dev/install/manual)
2. Android Studio instructions:
    [https://docs.flutter.dev/tools/vs-code](https://docs.flutter.dev/tools/vs-code)

### Step 1: Fork the Repository

1. Go to the main repository URL:  
   [https://github.com/rowandey/cs492-weather-app](https://github.com/rowandey/cs492-weather-app)

2. In the top-right corner, click the **Fork** button to create a copy of the repository under your own GitHub account.  
   - This will create a forked version of the repository that you can modify without affecting the original repository.

### Step 2: Clone Your Fork to Your Local Machine

1. Navigate to desired project location, like:
   ```bash
   cd ~/Documents/Projects
   ```

2. Clone the repository using the command below, or by clicking the green "code" button in GitHub.
  ```bash
  git clone https://github.com/YOUR_USERNAME/cs492-weather-app.git  
  ```

3. Navigate to the new directory
  ```bash
   cd cs492-weather-app
  ```

### Step 3: Run App (recommend this is done in VSCode!):
1. Get dependencies:
```bash
flutter pub get
```

2. Make sure the device or emulator you want is selected in the bottom right of VSCode.

3. Build and run the app:
```bash
flutter run
```

## Demo Video
[]()