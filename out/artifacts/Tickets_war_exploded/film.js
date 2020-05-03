function ShowTrailer() {
    var trailer = document.getElementById("trailer-div");
    if (trailer.style.display == "block") {
        trailer.style.display = "none";
    } else {
        trailer.style.display = "block";
    }


}

$("#filter").change(function () {
    var choice = $(this).val().toUpperCase();
    $("table tr").each(function (index) {
        if (index !== 0) {
            $row = $(this);
            var id = $row.find("td.type").text().toUpperCase();
            if (id.indexOf(choice) == -1) {
                $row.hide();
            }
            else {
                $row.show();
            }
        }
    });
});