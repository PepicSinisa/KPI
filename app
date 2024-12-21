<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>KPI Score Calculator</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
    }
    table {
      border-collapse: collapse;
      margin-bottom: 20px;
    }
    table, th, td {
      border: 1px solid #ccc;
      padding: 8px;
    }
    th {
      background-color: #f5f5f5;
    }
    input[type="number"] {
      width: 80px;
    }
    .btn {
      padding: 10px 20px;
      background-color: #2c7cac;
      color: #fff;
      border: none;
      cursor: pointer;
      margin-right: 10px;
    }
    .btn:hover {
      background-color: #245e7f;
    }
    #result {
      font-size: 1.2em;
      font-weight: bold;
      color: #333;
    }
  </style>
</head>
<body>

  <h1>KPI Score Calculator</h1>
  <p>Unesite podatke za svaki KPI, a zatim kliknite na “Calculate KPI Score”.</p>
  
  <table>
    <thead>
      <tr>
        <th>KPI Name</th>
        <th>Weight (%)</th>
        <th>Result (ostvareno)</th>
        <th>Target (planirano)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><input type="text" id="kpiName1" value="Ukupan obim prodaje" /></td>
        <td><input type="number" id="kpiWeight1" value="30" /></td>
        <td><input type="number" id="kpiResult1" value="400" /></td>
        <td><input type="number" id="kpiTarget1" value="500" /></td>
      </tr>
      <tr>
        <td><input type="text" id="kpiName2" value="Broj novih klijenata" /></td>
        <td><input type="number" id="kpiWeight2" value="20" /></td>
        <td><input type="number" id="kpiResult2" value="3" /></td>
        <td><input type="number" id="kpiTarget2" value="5" /></td>
      </tr>
      <tr>
        <td><input type="text" id="kpiName3" value="Naplata potraživanja" /></td>
        <td><input type="number" id="kpiWeight3" value="10" /></td>
        <td><input type="number" id="kpiResult3" value="90" /></td>
        <td><input type="number" id="kpiTarget3" value="100" /></td>
      </tr>
    </tbody>
  </table>

  <button class="btn" onclick="calculateKpiScore()">Calculate KPI Score</button>
  <span id="result"></span>

  <script>
    function calculateKpiScore() {
      // Uzimamo vrednosti iz polja za tri KPI-ja (lako proširivo ako dodajete više KPI redova)
      let weight1 = parseFloat(document.getElementById('kpiWeight1').value) || 0;
      let result1 = parseFloat(document.getElementById('kpiResult1').value) || 0;
      let target1 = parseFloat(document.getElementById('kpiTarget1').value) || 0;

      let weight2 = parseFloat(document.getElementById('kpiWeight2').value) || 0;
      let result2 = parseFloat(document.getElementById('kpiResult2').value) || 0;
      let target2 = parseFloat(document.getElementById('kpiTarget2').value) || 0;

      let weight3 = parseFloat(document.getElementById('kpiWeight3').value) || 0;
      let result3 = parseFloat(document.getElementById('kpiResult3').value) || 0;
      let target3 = parseFloat(document.getElementById('kpiTarget3').value) || 0;

      // Sabiramo pondere (opciono, radi provere ako želimo da budu tačno 100)
      let totalWeight = weight1 + weight2 + weight3;

      // Izbegavanje deljenja sa nulom
      let partialScore1 = 0;
      let partialScore2 = 0;
      let partialScore3 = 0;

      if (target1 > 0) {
        let realization1 = (result1 / target1) * 100;  // rezultat u %
        partialScore1 = realization1 * (weight1 / 100);
      }
      if (target2 > 0) {
        let realization2 = (result2 / target2) * 100;
        partialScore2 = realization2 * (weight2 / 100);
      }
      if (target3 > 0) {
        let realization3 = (result3 / target3) * 100;
        partialScore3 = realization3 * (weight3 / 100);
      }

      let totalScore = partialScore1 + partialScore2 + partialScore3;

      // Ako želimo da normalizujemo vrednost na skalu 0–100 bez obzira na zbir pondera:
      // let normalizedScore = totalWeight > 0 ? (totalScore / totalWeight) * 100 : 0;

      // Ali ako smo se dogovorili da je zbir pondera = 100, onda je totalScore već u rangu 0-100
      // Prosto ga ispisujemo:
      document.getElementById('result').textContent = 
        "KPI Score = " + totalScore.toFixed(2) + " / 100";
    }
  </script>

</body>
</html>
