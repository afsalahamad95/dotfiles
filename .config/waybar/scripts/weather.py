#!/usr/bin/env python3
import json
import urllib.request

# Change 'Coimbatore' to your preferred location or leave empty for auto-detect based on IP
location = "Coimbatore"
url = f"https://wttr.in/{location}?format=j1"

try:
    with urllib.request.urlopen(url) as response:
        data = json.loads(response.read())
        current = data['current_condition'][0]
        temp = current['temp_C']
        desc = current['weatherDesc'][0]['value']
        
        # Simple icon mapping based on wttr.in descriptions
        icons = {
            "Sunny": "☀️", "Clear": "🌙", "Cloudy": "☁️", "Partly cloudy": "⛅",
            "Rain": "🌧️", "Showers": "🌦️", "Snow": "❄️", "Fog": "🌫️"
        }
        icon = next((v for k, v in icons.items() if k.lower() in desc.lower()), "🌡️")
        
        print(json.dumps({
            "text": f"{icon} {temp}°C",
            "tooltip": f"{desc} | Feels like {current['FeelsLikeC']}°C"
        }))
except Exception:
    print(json.dumps({"text": "☁️ Err", "tooltip": "Weather unavailable"}))
