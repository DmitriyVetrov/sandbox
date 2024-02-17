from flask import Flask, render_template
import requests

app = Flask(__name__)

@app.route('/')
def weather():
    # OpenWeatherMap API
    api_key = "f09fe095281a7200c87bc7a65ee71730"
    base_url = "http://api.openweathermap.org/data/2.5/weather?q=Bratislava&appid=" + api_key

    response = requests.get(base_url)
    data = response.json()

    if data["cod"] != "404":
        main = data["main"]
        temperature = main["temp"]
        # convert temperature from Kelvin to Celsius
        temperature_in_celsius = round(temperature - 273.15, 2)
        return render_template('weather.html', temperature=temperature_in_celsius)
    else:
        return "Error retrieving weather information"

if __name__ == "__main__":
    app.run(debug=True)