# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.draw_graph = ->
    ctx = document.getElementById("myChart").getContext('2d')
    month = 12
    labels = new Array(month)
    bgColors = new Array(month)
    bdColors = new Array(month)
    for i in [0...month]
        labels[i] =  i + 1 + '月'
        bgColors[i] = 'rgba(255, 99, 132, 0.2)'
        bdColors[i] = 'rgba(153, 102, 255, 1)'
    myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: '月額利用料',
                data: gon.data,
                backgroundColor: bgColors,
                borderColor: bdColors,
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    })
