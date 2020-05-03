
var arr = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
var pricesum = 0;
function FillArray() {
    var element = document.getElementsByClassName("tktbtn");

    for (i = 0; i < 16; i++) {

        if (element[i].disabled) {
            arr[i] = 0;
            console.log(element[i].value)
        } else {
            arr[i] = 1;
        }
    }
    document.getElementById('tkt').value = arr;
    console.log(arr)
}
$(function () {
    $('#paymentselect').change(function () {
        $('.payment').hide();
        $('#'+$(this).val()).show();
    });
});
function selectonchange() {
    var select  = document.getElementById("paymentselect").value.option.findIndex();
    console.log(select)
    if(select==1){
        document.getElementById('submit').disabled = true;
    }else{
        document.getElementById('submit').disabled = false;
    }
}

function onClickBtn(i){
    var price = parseFloat(document.getElementById('price').innerHTML);
    var btn = document.getElementsByClassName("btn")

    if(btn[i].disabled == true)
    {

        arr[i]=0;
        document.getElementById('tkt').value=arr;

    }
    else if(btn[i].style.backgroundColor =='blue' ){

        btn[i].style.backgroundColor=defaultStatus;
        arr[i]=1;
        document.getElementById('tkt').value=arr;
        pricesum=pricesum-price;
        document.getElementById('pricesum').innerHTML=pricesum;
    }
    else{
        btn[i].style.backgroundColor='blue';
        arr[i]=0;
        console.log(arr)
        document.getElementById('tkt').value=arr;
        pricesum=pricesum+price;
        document.getElementById('pricesum').innerHTML = pricesum;
    }
}


