<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BMI Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: white;
            padding: 20px 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            margin-bottom: 20px;
            color: #333;
        }

        .input-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        input {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .result {
            margin-top: 20px;
            font-size: 20px;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>BMI Calculator</h1>
        <div class="input-group">
            <label for="height">Height (cm):</label>
            <input type="number" id="height" placeholder="Enter your height">
        </div>
        <div class="input-group">
            <label for="weight">Weight (kg):</label>
            <input type="number" id="weight" placeholder="Enter your weight">
        </div>
        <button onclick="calculateBMI()">Calculate</button>
        <div id="result" class="result"></div>
    </div>

    <script>
        function calculateBMI() {
            const height = document.getElementById('height').value / 100;
            const weight = document.getElementById('weight').value;
            const bmi = weight / (height * height);
            document.getElementById('result').innerText = `Your BMI is ${bmi.toFixed(2)}`;
        }
    </script>
</body>
</html>



![download (3)](https://github.com/Deeptha99/BMI_Calculater/assets/118300866/9db03b1f-e2e1-4dda-95a4-cd6ee0861e7e)
