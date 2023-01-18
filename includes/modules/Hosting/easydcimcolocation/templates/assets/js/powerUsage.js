$(document).ready(function () {
    let myPowerUsageChart;
    let url = window.location.href;
    $.ajax({
        type: "GET",
        url: url,
        data: {
            graphs : 'PowerUsage',
            interval: 'td'
        },
        success: function (data) {
            let graphData
            if (data != '')
            {
                graphData = JSON.parse(data).data;
            }else {
                graphData = {
                    labels: [],
                    datasets: []
                };
            }
            const labels = graphData.labels;
            let dataSet = [];
            if (graphData.datasets.length !== 0)
            {
                dataSet = graphData.datasets[0].data;
            }
            const dataForGraph = {
                labels: labels,
                datasets: [
                    {
                        backgroundColor: '#519259',
                        borderColor: '#519259',
                        spanGaps: false,
                        borderWidth: 1.3,
                        label: 'Power Usage (Amps)',
                        fill: true,
                        data:dataSet,
                    }]
            };

            const config = {
                type: 'line',
                data: dataForGraph,
                plugins:[{
                    afterInit: function(chart,options){
                        var canvasHeight = ctx.height();
                        let datasets = chart.data.datasets;

                        $.each(datasets, function(key, value) {
                            var mainColor = value.backgroundColor;

                            if($.isArray(mainColor)) {
                                var gradients = [];

                                $.each(mainColor, function( index, value ) {
                                    gradients.push(getGradientFill(ctx, value, canvasHeight));
                                });

                                chart.data.datasets[key].backgroundColor = gradients;
                                chart.data.datasets[key].hoverBackgroundColor = gradients;
                            } else {
                                chart.data.datasets[key].backgroundColor = getGradientFill(ctx, mainColor, canvasHeight);
                                chart.data.datasets[key].hoverBackgroundColor = getGradientFill(ctx, mainColor, canvasHeight);
                            }

                        });
                    }
                }],
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    interaction: {
                        intersect: false,
                    },
                    elements:{
                        line:{
                            tension: 0.4,
                        },
                        point:{
                            radius: false,
                        },
                    },
                    scales:{
                        y:{
                            display: true,
                            beginAtZero: true,
                            stacked: false,
                            grid: {
                                color: 'rgb(238,238,241,0.64)',
                                zeroLineColor: 'transparent',
                                drawBorder: 1,
                                tickMarkLength: 0,
                            },
                            title: {
                                display: false,
                            },
                        },
                        x:{
                            type: 'time',
                            time: {
                                unit: graphData.unit,
                                displayFormats: {
                                    hour:'hh:mm',
                                }
                            },
                        },
                    }
                },
            }
            let ctx = $('#powerUsageGraph');
            myPowerUsageChart = new Chart(
                ctx,
                config
            );
        },
        error: function (data) {
        },
    });

    $('#reloadPowerUsageGraphModal').on('click',function (e) {
        e.preventDefault();
        let option = $('#scope3 option:selected').val();
        hideModal();
        let url = window.location.href;
        $.ajax({
            type: "GET",
            url: url,
            data: {
                graphs : 'PowerUsage',
                interval: option
            },
            success: function (data) {
                let graphData
                if (data != '')
                {
                    graphData = JSON.parse(data).data;
                }else {
                    graphData = {
                        labels: [],
                        datasets: []
                    };
                }
                let dataSet = [];
                if (graphData.datasets.length !== 0)
                {
                    dataSet = graphData.datasets[0].data;
                }
                myPowerUsageChart.data.labels = graphData.labels
                myPowerUsageChart.data.datasets[0].data = dataSet;
                myPowerUsageChart.options.scales.x.time.unit = graphData.unit;
                myPowerUsageChart.update();
            },
            error: function (data) {
            },
        });
    });
});

function hexToRGB(hex, alpha) {
    var r = parseInt(hex.slice(1, 3), 16),
        g = parseInt(hex.slice(3, 5), 16),
        b = parseInt(hex.slice(5, 7), 16);

    if (alpha) {
        return "rgba(" + r + ", " + g + ", " + b + ", " + alpha + ")";
    } else {
        return "rgb(" + r + ", " + g + ", " + b + ")";
    }
}

function getGradientFill(c, color, height)
{
    var ctx = c[0].getContext("2d");

    var gradientFill = ctx.createLinearGradient(0,0,0,height);

    gradientFill.addColorStop(0, hexToRGB(color, 0.4));
    gradientFill.addColorStop(1, hexToRGB(color, 0.05));

    return gradientFill
}

function showModal() {
    $('#confirmationModal').addClass( "show" );
}

function hideModal() {
    $('#confirmationModal').removeClass( "show" );
}