
window.onload = ->
  # if (window.location.pathname.split("/")[2] == 'dashboard')
  dashBar = document.getElementById("dashBar").getContext("2d")
  window.myBar = new Chart(dashBar).Bar(barChartData,
    responsive: true
  )
  dashDoughnut = document.getElementById("dashDoughnut").getContext("2d")
  window.myDoughnut = new Chart(dashDoughnut).Doughnut(doughnutData,
    responsive: true
  )
  dashLine = document.getElementById("dashLine").getContext("2d")
  window.myLine = new Chart(dashLine).Line(lineChartData,
    responsive: true
  )
  dashPie = document.getElementById("dashPie").getContext("2d")
  window.myPie = new Chart(dashPie).Pie(pieData,
    responsive: true
  )
  # return

randomScalingFactor = ->
  Math.round Math.random() * 100

barChartData =
  labels: [
    "January"
    "February"
    "March"
    "April"
    "May"
    "June"
    "July"
  ]
  datasets: [
    {
      fillColor: "rgba(220,220,220,0.5)"
      strokeColor: "rgba(220,220,220,0.8)"
      highlightFill: "rgba(220,220,220,0.75)"
      highlightStroke: "rgba(220,220,220,1)"
      data: [
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
      ]
    }
    {
      fillColor: "rgba(151,187,205,0.5)"
      strokeColor: "rgba(151,187,205,0.8)"
      highlightFill: "rgba(151,187,205,0.75)"
      highlightStroke: "rgba(151,187,205,1)"
      data: [
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
      ]
    }
  ]

doughnutData = [
  {
    value: 300
    color: "#F7464A"
    highlight: "#FF5A5E"
    label: "Red"
  }
  {
    value: 50
    color: "#46BFBD"
    highlight: "#5AD3D1"
    label: "Green"
  }
  {
    value: 100
    color: "#FDB45C"
    highlight: "#FFC870"
    label: "Yellow"
  }
  {
    value: 40
    color: "#949FB1"
    highlight: "#A8B3C5"
    label: "Grey"
  }
  {
    value: 120
    color: "#4D5360"
    highlight: "#616774"
    label: "Dark Grey"
  }
]


lineChartData =
  labels: [
    "January"
    "February"
    "March"
    "April"
    "May"
    "June"
    "July"
  ]
  datasets: [
    {
      label: "My First dataset"
      fillColor: "rgba(220,220,220,0.2)"
      strokeColor: "rgba(220,220,220,1)"
      pointColor: "rgba(220,220,220,1)"
      pointStrokeColor: "#fff"
      pointHighlightFill: "#fff"
      pointHighlightStroke: "rgba(220,220,220,1)"
      data: [
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
      ]
    }
    {
      label: "My Second dataset"
      fillColor: "rgba(151,187,205,0.2)"
      strokeColor: "rgba(151,187,205,1)"
      pointColor: "rgba(151,187,205,1)"
      pointStrokeColor: "#fff"
      pointHighlightFill: "#fff"
      pointHighlightStroke: "rgba(151,187,205,1)"
      data: [
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
        randomScalingFactor()
      ]
    }
  ]

pieData = [
  {
    value: 300
    color: "#F7464A"
    highlight: "#FF5A5E"
    label: "Red"
  }
  {
    value: 50
    color: "#46BFBD"
    highlight: "#5AD3D1"
    label: "Green"
  }
  {
    value: 100
    color: "#FDB45C"
    highlight: "#FFC870"
    label: "Yellow"
  }
  {
    value: 40
    color: "#949FB1"
    highlight: "#A8B3C5"
    label: "Grey"
  }
  {
    value: 120
    color: "#4D5360"
    highlight: "#616774"
    label: "Dark Grey"
  }
]
