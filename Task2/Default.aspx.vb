Imports System.Net
Imports System.Web.Script.Serialization

Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub btnGetWeather_Click(sender As Object, e As EventArgs) Handles btnGetWeather.Click
        Dim city As String = txtCity.Text.Trim()
        If city = "" Then Return

        Dim apiKey As String = "YOUR_API_KEY"
        Dim url As String = String.Format("http://api.openweathermap.org/data/2.5/weather?q={0}&units=metric&lang=en&appid={1}",
                                          HttpUtility.UrlEncode(city), apiKey)
        Try
            Dim client As New WebClient()
            Dim json As String = client.DownloadString(url)
            Dim jss As New JavaScriptSerializer()
            Dim data As Object = jss.DeserializeObject(json)

            If data.ContainsKey("cod") AndAlso data("cod").ToString() = "404" Then
                ShowError("City not found.")
                Return
            End If

            Dim cityName As String = data("name") & ", " & data("sys")("country")
            Dim temp As Double = data("main")("temp")
            Dim feelsLike As Double = data("main")("feels_like")
            Dim tempMin As Double = data("main")("temp_min")
            Dim tempMax As Double = data("main")("temp_max")
            Dim humidity As Integer = data("main")("humidity")
            Dim pressure As Integer = data("main")("pressure")
            Dim windSpeed As Double = data("wind")("speed")
            Dim desc As String = data("weather")(0)("description")
            Dim iconCode As String = data("weather")(0)("icon")
            Dim sunriseUnix As Long = data("sys")("sunrise")
            Dim sunsetUnix As Long = data("sys")("sunset")

            lblCity.Text = cityName
            lblTemp.Text = $"{Math.Round(temp, 1)} °C"
            lblFeelsLike.Text = $"{Math.Round(feelsLike, 1)} °C"
            lblMinMax.Text = $"{Math.Round(tempMin)} °C / {Math.Round(tempMax)} °C"
            lblHumidity.Text = $"{humidity}%"
            lblPressure.Text = $"{pressure} hPa"
            lblWind.Text = $"{windSpeed} m/s"
            lblDesc.Text = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(desc)
            lblSunrise.Text = UnixToTime(sunriseUnix).ToString("HH:mm") & " (local)"
            lblSunset.Text = UnixToTime(sunsetUnix).ToString("HH:mm") & " (local)"
            imgIcon.ImageUrl = $"https://openweathermap.org/img/wn/{iconCode}@2x.png"

            pnlResult.Visible = True
            pnlError.Visible = False
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowResult", $"$('#{pnlResult.ClientID}').fadeIn('slow');", True)
        Catch ex As Exception
            ShowError("Unable to fetch city's weather data. Please try again.")
        End Try
    End Sub

    Private Function UnixToTime(unixTime As Long) As DateTime
        Dim dt1970 As New DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc)
        Return dt1970.AddSeconds(unixTime).ToLocalTime()
    End Function

    Private Sub ShowError(message As String)
        lblError.Text = message
        pnlError.Visible = True
        pnlResult.Visible = False
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowError", $"$('#{pnlError.ClientID}').fadeIn('fast');", True)
    End Sub

End Class
