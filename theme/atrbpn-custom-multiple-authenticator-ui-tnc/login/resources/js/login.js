$( document ).ready(function() {

    $('#username, #password').on('keypress', function (e) {
        if(e.which == 13) {
            login();

            e.preventDefault();
            return false;
        }
    });

    function login() {
        $("input").blur();
        $("body").addClass("loading");

        $('#error-icon').removeClass();
        $('#error-div').removeClass();
        $('#error-div').hide();


        $.post('/auth/realms/internal-realm/protocol/openid-connect/token', {
                'username': $('#username').val().trim(),
                'password': $('#password').val().trim(),
                'client_id': 'public-client',
                'scope': 'openid',
                'grant_type': 'password'
        },
        function(response) {
            $("#kantor").empty();
            $("#kantor").append('<option value="0">--</option>');
            $.each(response.kantor, function(i, item) {
                $("#kantor").append('<option value="'+item.kantorid+'">'+item.kantorname+'</option>');
            });

            $("body").removeClass("loading");
            $("#username-field").hide();
            $("#password-field").hide();
            $("#kc-form-buttons-01").hide();

            $('#kc-form-buttons').show();
            $('#otp-field').show();
            $('#kantor-field').show();

            $('#error-text').text("OTP terkirim ke "+response.to);
            $('#error-icon').addClass("pficon pficon-info");
            $('#error-div').addClass("alert alert-info");
            $('#error-div').show();
        })
        .fail(function() {
            $("body").removeClass("loading");
            $('#error-text').text("Username atau Password salah.");
            $('#error-icon').addClass("pficon pficon-error-circle-o");
            $('#error-div').addClass("alert alert-error");
            $('#error-div').show();
        });
    }

    $('#kc-form-buttons-01').on('click', function (e) {
        login();
    });

    $('#kc-form-buttons').hide();
    $('#otp-field').hide();
    $('#kantor-field').hide();
    $('#error-div').hide();

    var getUrlParameter = function getUrlParameter(sParam) {
        var sPageURL = window.location.search.substring(1),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
            }
        }
        return false;
    };

    if(getUrlParameter('redirect_uri').indexOf("ujiaplikasi.atrbpn.go.id") == -1){
        // display warning, login not from main page
        $('#error-text').text("Mohon Login dari Aplikasi Utama (ujiaplikasi.atrbpn.go.id).");
        $('#error-icon').addClass("pficon pficon-info");
        $('#error-div').addClass("alert alert-info");
        $('#error-div').show();

        $("#username-field").hide();
        $("#password-field").hide();
        $("#kc-form-buttons-01").hide();
    }
});