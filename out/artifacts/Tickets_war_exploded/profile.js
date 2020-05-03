

$('#addcardbtn').on('click', function () {
    $('.center').show();
    $(this).hide();
})

$('#close').on('click', function () {
    $('.center').hide();
    $('#addcardbtn').show();
})

function ShowEditCard(id){

        $('#card-edit-div'+id).show();
        $(this).hide();

    $('#editclose'+id).on('click', function () {
        $('.editcenter').hide();
        $('#'+id).show();
    })
}


