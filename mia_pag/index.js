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
    // GIT
    // GIT
    // GIT
    // GIT
    // GIT
    // GIT
    // GIT
    $.get("/all").done(function (mappa) {
        Object.keys(mappa).forEach(key => {
            console.log(`mappa[key]`, mappa[key]);
            strMateriali =
                mappa[key].Materiali.map(mat => {
                    if (mat == 1) return "Vivalto";
                    if (mat == 2) return "PR";
                    if (mat == 3) return "MD";
                    if (mat == 4) return "Caravaggio";
                }).join()
            $("body").append("<div>" + mappa[key].data.toLocaleString().substr(0, 10) + strMateriali + "</div>")
        })
    })
        .fail(function () {
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
