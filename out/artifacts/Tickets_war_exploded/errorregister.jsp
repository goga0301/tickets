<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

%>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="register.css?v=1.1">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">

</head>
<body style="overflow: hidden">
<main>
    <center>



        <div class="container" style="margin-top: 5px">
            <div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">

                <form class="col s12" method="post" action="checkregister.jsp">


                    <div class='row' style="float: left">

                        <div class='input-field col s12'>

                            <input class='validate' type='text' name='saxeli' id='saxeli' />
                            <label for='saxeli' >Enter your firstname</label>
                        </div>
                    </div>

                    <div class='row'style="float: left;margin-left: 3px">
                        <div class='input-field col s12'>
                            <input class='validate' type='text' name='gvari' id='gvari' />
                            <label for='gvari'>Enter your lastname</label>
                        </div>
                    </div>

                    <div class='row' >
                        <div class='input-field col s12'>
                            <input class='validate' type='text' name='idnum' id='idnum' />
                            <label for='idnum'>Enter your ID number</label>
                        </div>
                    </div>

                    <div class='row' >
                        <div class='input-field col s12'>
                            <input class='validate' type='email' name='email' id='email' />
                            <label for='email'>Enter your Email</label>
                        </div>
                    </div>

                    <div class='row'>
                        <div class='input-field col s12'>
                            <input class='validate' type='text' name='username' id='username' />
                            <label for='username'>Enter your Username</label>
                        </div>
                    </div>

                    <div class='row'>
                        <div class='input-field col s12'>
                            <input class='validate' type='password' name='password' id='password' />
                            <label for='password'>Enter your password</label>
                        </div>

                    </div>

                    <p style="color:red; margin-top: 3px">Username is already taken</p>

                    <center>
                        <div class='row' style="margin-bottom: 8px">
                            <button type='submit' name='btn_register' class='col s12 btn btn-large waves-effect indigo'>Register</button>
                        </div>
                    </center>
                    <a href="index.jsp" style="float: right">Login into your account</a>
                </form>
            </div>
        </div>

    </center>

</main>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>


</body>
</html>
