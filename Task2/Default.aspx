<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background: #f7f7f7;
            text-align: center;
        }

        .input-box {
            display: inline-block;
            padding: 10px 20px 20px 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
        }

        .input-box input[type="text"] {
            padding: 10px;
            font-size: 16px;
            width: 250px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .input-box input[type="submit"] {
            padding: 10px 15px;
            font-size: 16px;
            background: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            margin-left: 10px;
            cursor: pointer;
        }

        .input-box input[type="submit"]:hover {
            background: #0056b3;
        }

        .weather-card,
        .error-card {
            width: 400px;
            margin: 30px auto 0 auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            display: none;
            text-align: left;
        }

        .weather-card h3 {
            margin-top: 0;
        }

        .weather-icon {
            float: right;
        }

        .weather-detail {
            margin: 10px 0;
        }

        .label {
            font-weight: bold;
            color: black;
            font-size: 16px;
        }

        .error-text {
            color: red;
            font-weight: bold;
        }
    </style>

    <div class="input-box">
        <h2>Check Current Weather</h2>
        <asp:TextBox ID="txtCity" runat="server" placeholder="Enter city name" />
        <asp:Button ID="btnGetWeather" runat="server" Text="Get Weather" OnClick="btnGetWeather_Click" />
    </div>

    <asp:UpdatePanel ID="upPanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <asp:Panel ID="pnlResult" runat="server" CssClass="weather-card">
                <h3>
                    <asp:Label ID="lblCity" runat="server" />
                    <asp:Image ID="imgIcon" runat="server" Width="60" Height="60" CssClass="weather-icon" />
                </h3>

                <div class="weather-detail">
                    <span class="label">Temperature:</span>
                    <asp:Label ID="lblTemp" runat="server" />
                </div>

                <div class="weather-detail">
                    <span class="label">Feels Like:</span>
                    <asp:Label ID="lblFeelsLike" runat="server" />
                </div>

                <div class="weather-detail">
                    <span class="label">Min / Max Temp:</span>
                    <asp:Label ID="lblMinMax" runat="server" />
                </div>

                <div class="weather-detail">
                    <span class="label">Humidity:</span>
                    <asp:Label ID="lblHumidity" runat="server" />
                </div>

                <div class="weather-detail">
                    <span class="label">Pressure:</span>
                    <asp:Label ID="lblPressure" runat="server" />
                </div>

                <div class="weather-detail">
                    <span class="label">Wind Speed:</span>
                    <asp:Label ID="lblWind" runat="server" />
                </div>

                <div class="weather-detail">
                    <span class="label">Description:</span>
                    <asp:Label ID="lblDesc" runat="server" />
                </div>

                <div class="weather-detail">
                    <span class="label">Sunrise:</span>
                    <asp:Label ID="lblSunrise" runat="server" />
                </div>

                <div class="weather-detail">
                    <span class="label">Sunset:</span>
                    <asp:Label ID="lblSunset" runat="server" />
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlError" runat="server" CssClass="error-card">
                <div class="error-text">
                    <asp:Label ID="lblError" runat="server" Text="" />
                </div>
            </asp:Panel>

        </ContentTemplate>

        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnGetWeather" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="updProgress" runat="server" AssociatedUpdatePanelID="upPanel">
        <ProgressTemplate>
            <div style="color: blue; font-style: italic;">Loading weather data...</div>
        </ProgressTemplate>
    </asp:UpdateProgress>

</asp:Content>
