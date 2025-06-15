# Task 2 - Weather Info Web App – VB.NET (ASP.NET Web Forms)

This project is a simple weather information web application built using **VB.NET** and **ASP.NET Web Forms**. It allows users to **search for weather information by city name** using the **OpenWeatherMap API**, and displays the results with UI effects like loading indicators and fade-in transitions.

---

## Features

- Search weather by city name
- Integration with [OpenWeatherMap API](https://openweathermap.org/api)
- Display weather results in a clean **card layout**
- Loading state + fade-in animation
- Built using ASP.NET Web Forms (VB.NET)

---

## How to Run Locally

### Requirements:
- Visual Studio (2019/2022)
- .NET Framework (4.x)
- Internet connection (to access API)

### Steps:
1. **Open Visual Studio**
2. Clone the project 
   ```bash
    git clone https://github.com/cuongtr1704/Weather-Web-App.git
   ```
3. Sign up at [OpenWeatherMap](https://openweathermap.org/api) and **get an API key**.
4. Open the code-behind file (`Default.aspx.vb`) and replace:
   ```vb
    Dim apiKey As String = "YOUR_API_KEY" 
   ```