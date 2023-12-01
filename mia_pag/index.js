$(() => {

    $("#data")[0].value = (new Date()).toISOString().substr(0, 10)

    $("#submit").click(() => {
        $.post("/new", $("form").serialize())
            .done(function () {
                // alert("OK");
            })
            .fail(function () {
                alert("error");
            })
    })

    $("label:eq(0)").click(() => {
        $("#esplode").toggle("slow");
    })


    var arrayPerGrafico = [];//alla pos 0 c'è il counter di vivalto su cui son salito, [1] di pr, ...
    $.get("/all").done(function (mappa) {
        Object.keys(mappa).reverse().forEach(key => {

            strMateriali =
                mappa[key].Materiali.map(mat => {
                    // console.log(`mat`, mat);
                    if (arrayPerGrafico[mat - 1] === undefined)
                        arrayPerGrafico[mat - 1] = 1
                    else arrayPerGrafico[mat - 1]++

                    if (mat == 1) return "<img width='90' src='/vivalto.png'>";
                    if (mat == 2) return "<img width='90' src='/pr.png'>";
                    if (mat == 3) return "<img width='90' src='/md.png'>";
                    if (mat == 4) return "<img width='90' src='/caravaggio.png'>";
                    if (mat == 5) return "<img width='90' src='/casaralta.png'>";
                    if (mat == 6) return "<img width='90' src='/taf.jpg'>";
                    if (mat == 7) return "<img width='90' src='/donizzetti.jpg'>";
                }).join()
            $("body").append("<div>" + mappa[key].data.toLocaleString().substr(0, 10) + strMateriali + "</div>")
        })

        const ctx = document.getElementById('myChart').getContext('2d');
        const data = {
            labels: ['Vivalto', 'PR', 'MD', 'Caravaggio', 'Casaralta', "TAF", "Donizzetti"],
            datasets: [
                {
                    label: 'Dataset 1',
                    data: arrayPerGrafico,
                    backgroundColor: ["#0040ff", '#267326', '#006600', '#00ff00', '#99ff99', '#8B07F2', '#ffff99'],
                }
            ]
        };
        const myChart = new Chart(ctx, {
            type: 'pie',
            data: data,
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: true,
                        text: 'Mezzi presi'
                    }
                }
            }
        });
    })
        .fail(function () {
            alert("error");
        })


    $.get("/allPuntualita").done(function (puntualita) {

        var mappaPuntualita = {}//1 => 13; 2=> 15; 3=>56 //cioè 13 volte sono stati scarsamente puntuali, 2 volte son stati ...

        for (let i = 0; i < puntualita.length; i++) {
            if (mappaPuntualita[puntualita[i].Puntualita] === undefined)
                mappaPuntualita[puntualita[i].Puntualita] = 1
            else mappaPuntualita[puntualita[i].Puntualita]++
        }

        const ctx2 = document.getElementById('chartPuntualita').getContext('2d');
        const data2 = {
            labels: ['Ottima', 'Media', 'Poca'],
            datasets: [
                {
                    label: 'Dataset 1',
                    data: Object.values(mappaPuntualita),
                    backgroundColor: ["#00ff00", '#ff6600', '#cc0000'],
                }
            ]
        };

        const myChart2 = new Chart(ctx2, {
            type: 'pie',
            data: data2,
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: true,
                        text: 'Puntualità riscontrata'
                    }
                }
            }
        });
    }).fail(function () {
        alert("error");
    })


})

// var data = {
//     "Mon Sep 27 2021 00:00:00 GMT+0000 (Coordinated Universal Time)": { "meteriali": [2, 3], "Puntualita": 1, "Controllore": 0 },
//     "Tue Sep 28 2021 00:00:00 GMT+0000 (Coordinated Universal Time)": { "meteriali": [1, 2], "Puntualita": 1, "Controllore": 1 },
//     "Wed Sep 29 2021 00:00:00 GMT+0000 (Coordinated Universal Time)": { "meteriali": [1, 2], "Puntualita": 2, "Controllore": 0 },
//     "Thu Sep 30 2021 00:00:00 GMT+0000 (Coordinated Universal Time)": { "meteriali": [1, 2, 3], "Puntualita": 1, "Controllore": 1 },
//     "Fri Oct 01 2021 00:00:00 GMT+0000 (Coordinated Universal Time)": { "meteriali": [1, 3], "Puntualita": 1, "Controllore": 1 },
//     "Mon Oct 04 2021 00:00:00 GMT+0000 (Coordinated Universal Time)": { "meteriali": [1, 2], "Puntualita": 1, "Controllore": 0 }
// }
