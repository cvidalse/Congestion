<%@page import="Datos.CSV"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title> CongestionTemuco</title>

        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <link rel="shortcut icon" type="image/x-icon" href="docs/images/favicon.ico" />

        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.4/dist/leaflet.css" integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA==" crossorigin=""/>
        <script src="https://unpkg.com/leaflet@1.3.4/dist/leaflet.js" integrity="sha512-nMMmRyTVoLYqjP9hrbed9S+FzjZHW5gY1TWCHA5ckwXZBadntCNs8kEqAWdrb9O7rxbCaA4lKTIWjDXZxflOcA==" crossorigin=""></script>

        <link rel="stylesheet" href="leaflet-routing-machine-3.2.7/dist/leaflet-routing-machine.css" />

        <script src="leaflet-routing-machine-3.2.7/dist/leaflet-routing-machine.js"></script>


        <script src="https://code.jquery.com/jquery-1.12.4.min.js"

                integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"

                crossorigin="anonymous">

        </script>

    </head>

    <body bgcolor="solid green">

        <h2 align="center">Centro de Temuco en Horarios Punta</h2> 

        <script>
            var baseData = ${datos};
        </script>

        <div class=centrado id="mapid" style="width: 1300px; height: 700px;vertical-align:top"></div>
        <style type='text/css'>
            .centrado {
                display: block;
                margin-right:auto;
                margin-left: auto;  }
            </style>

            <script>

                var mymap = L.map('mapid').setView([-38.736277, -72.590618], 16);
                L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href=”http://osm.org/copyright”>OpenStreetMap</a> contributors'
                }).addTo(mymap);
                //newMap.fitBounds(datalayer.getBounds());

                function trazarEnMapa(pos1, pos2, pos3, pos4, color) {
                    L.Routing.control({
                        waypoints: [
                            L.latLng(pos1, pos2),
                            L.latLng(pos3, pos4)
                        ],
                        routeWhileDragging: true,
                        createMarker: function () {
                            return null;
                        },
                        lineOptions: {
                            styles: [{color: color, opacity: 1, weight: 5}]
                        },
                        fitSelectedRoutes: false,
                        show: false

                    }).addTo(mymap);
                }

                function getColor(flujo) {
                    //console.log(flujo);    
                    if (flujo <= 2 && flujo > 0) {
                        return "green";
                    } else if (flujo < 2.5 && flujo > 2) {
                        return "blue";
                    } else if (flujo >= 2.5) {
                        return "red";
                    } else if (flujo == -0.33333) {
                        return "black";
                    }
                }

                function procesarMapa(valor) {
                    var textoCompleto = JSON.stringify(baseData);
                    var lineas = textoCompleto.split("},");

                    for (var i in lineas) {
                        var temp = lineas[i].replace(/[\[\]{:}'"a-zA-Z\s]+/g, "");

                        var temp2 = temp.split(",");

                        var color = getColor(parseFloat(temp2[valor]));

                        trazarEnMapa(parseFloat(temp2[0]), parseFloat(temp2[1]), parseFloat(temp2[2]), parseFloat(temp2[3]), color);
                    }
                }

                //Leyenda

                var legend = L.control({position: 'bottomright'});
                legend.onAdd = function (mymap) {

                    var div = L.DomUtil.create('div', 'info legend');
                    labels = ['<strong>Promedio vehiculos por minuto</strong>'],
                            categories = ['Menos de 2', 'Entre 2 y 2.5', 'Más de 2.5', 'Sólo locomoción colectiva'];
                    colors = [2, 2.3, 3, -0.33333];

                    for (var i = 0; i < categories.length; i++) {
                        div.innerHTML +=
                                labels.push(
                                        '<i class="circle" style="background:' + getColor(colors[i]) + '"></i> ' +
                                        (categories[i] ? categories[i] : '+'));
                        console.log(getColor(categories[i]));
                    }
                    div.innerHTML = labels.join('<br>');
                    return div;
                };
                legend.addTo(mymap);



            </script>


        <style>  
            .legend {
                border: 3px solid black;
                font-weight: bold;
                color: black;
                text-align: left;
                width: 300px;
                height: 100px;
                line-height: 18px;
                background: white;
                opacity: 1;
            }

            .legend i {
                width: 25px;
                height: 25px;
                float: left;
                margin-right: 8px;
                opacity: 0.7;
            }

            .legend .square2 {
                border-radius: 50%;
                width: 50px;
                height: 50px;
                margin-top: 8px;
            } 
        </style>

        <div class="botoneraCentrada">
            <button onclick="procesarMapa(5)" >Horario 07-08</button>
            <button onclick="procesarMapa(6)">Horario 13-14</button>
            <button onclick="procesarMapa(7)">Horario 18-19</button>
        </div>
        <style type='text/css'>
            .botoneraCentrada{
                margin: auto;
                display: flex;
                flex-direction: row;
                justify-content: center;
            }
        </style>
</html>
