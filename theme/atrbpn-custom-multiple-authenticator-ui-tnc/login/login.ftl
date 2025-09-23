<!DOCTYPE html>
<html lang="en">
<head>
    <title>Halaman Login Utama Kementerian Agraria dan Tata Ruang / Badan Pertanahan Nasional</title>
    <link rel="shortcut icon" href="https://aplikasi.atrbpn.go.id/img/favicon/apple-touch-icon-114x114.png" type="image/x-icon" />
    <meta charset="utf-8">
    <meta name="description" content="Login Page for Kementerian ATR/BPN">
    <meta name="keywords" content="virtual, office, vo">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">

    <!-- Load Style -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" media="screen" />
        </#list>
    </#if>

    <!-- Load Scripts -->
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div class="login">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 px-0">
                <div class="login-panel" style="background-image: url('${url.resourcesPath}/images/typo.png')">
                    <img src="${url.resourcesPath}/images/bg.png" alt="" class="bg-bot">
                    <div class="logo"><img src="${url.resourcesPath}/images/logo.png" alt=""/>
                        <h5>Kementerian Agraria dan Tata Ruang /
                            Badan Pertanahan Nasional</h5></div>

                    <div class="login-wrap">
                        <h1>${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}</h1>
                        <p>Silahkan masuk untuk memulai aplikasi</p>

                        <div class="alert alert-danger" role="alert" id="error-div">
                            <span id="error-text"></span>
                        </div>

                        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">

                            <div id="username-field" class="wrap-input">
                                <img src="${url.resourcesPath}/images/user.png" alt="" class="prepend-icon">
                                <input type="text" class="form-control" placeholder="Username" autocomplete="off" id="username" name="username" >
                            </div>

                            <div id="password-field">
                                <label for="password">Password </label>
                                <div class="wrap-input password">
                                    <img src="${url.resourcesPath}/images/lock.png" alt="" class="prepend-icon">
                                    <input  id="password" type="password" class="form-control" autocomplete="off" name="password" placeholder="Password">
                                    <i class="fa fa-eye" id="toggleShow"></i>
                                    <i class="fa fa-eye-slash" id="toggleHide"></i>
                                </div>
                            </div>

                            
                            <div id="kantor-field" class="wrap-input">
                                <img src="${url.resourcesPath}/images/office.png" alt="" class="prepend-icon">
                                <img src="${url.resourcesPath}/images/chevron-down.png" alt="" class="append-icon">
                                <select name="kantor" id="kantor" class="form-control">
                                    <option value="0">--</option>
                                </select>
                            </div>

                            <div id="otp-field" class="wrap-input">
                                <img src="${url.resourcesPath}/images/shield.png" alt="" class="prepend-icon">
                                <img src="${url.resourcesPath}/images/chevron-down.png" alt="" class="append-icon">
                                <select name="otpType" id="otpType" class="form-control">
                                    <option value="email">OTP Lewat Email</option>
                                    <option value="authenticator">OTP Lewat Authenticator</option>
                                </select>
                            </div>


                            <div id="kc-form-options" class="custom-control custom-checkbox mb-2">
                                <#if realm.rememberMe && !usernameEditDisabled??>
                                    <div class="checkbox">
                                        <label>
                                            <#if login.rememberMe??>
                                                <input type="checkbox" class="custom-control-input" id="customCheck1"  name="rememberMe" checked>
                                                <label class="custom-control-label" for="customCheck1">Ingat saya?</label>
                                            <#else>
                                                <input type="checkbox" class="custom-control-input" id="customCheck1"  name="rememberMe">
                                                <label class="custom-control-label" for="customCheck1">Ingat saya?</label>
                                            </#if>
                                        </label>
                                    </div>
                                </#if>
                            </div>

                            <div id="kc-form-buttons-01">
                                <input type="button" class="btn btn-primary w-100" id="kc-next" value="Next" />
                            </div>

                            <div id="kc-form-buttons" >
                                <div class="custom-control custom-checkbox mb-2">
                                    <input type="checkbox" class="custom-control-input" id="termsCheck" name="termsCheck" required>
                                    <label class="custom-control-label" for="termsCheck">
                                        Saya telah membaca dan menyetujui <a href="#" id="show-terms-link">Syarat dan Ketentuan</a> Kementerian ATR/BPN
                                    </label>
                                </div>
                                <input type="submit" class="btn btn-primary w-100" id="kc-login" value="Next" />
                            </div>

                            <input type="hidden" id="statusTnc" name="statusTnc" value="" />

                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-8 px-0">
                <div class="image" style="background-image: url('${url.resourcesPath}/images/image_login_2_1.png')"></div>
            </div>

            <!-- Terms and Conditions Modal -->
            <div class="modal fade" id="termsModal" tabindex="-1" role="dialog" aria-labelledby="termsModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="termsModalLabel"><div id="tncMessageDiv" name="tncMessageDiv"></div></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#termsModal').modal('hide')">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="max-height:60vh;overflow-y:auto;">
                        <!-- Replace the content below with your actual terms and conditions -->
                        <p>
                            <div id="tncContentDiv" name="tncContentDiv"></div>
                        </p>
                        <p>
                            <div>Versi T&C terbaru: <span id="tncVersion" name="tncVersion"></span></div>
                            <div><a id="tncUrlLink" name="tncUrlLink" target="_blank"></a></div>
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="$('#termsModal').modal('hide')">Tutup</button>
                    </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="modal"></div>

<script>
    $('#toggleHide').hide()
    $('#toggleShow').on('click', function() {
        $('#inputPassword').get(0).type = 'text';
        $('#toggleShow').hide();
        $('#toggleHide').show();
    })
    $('#toggleHide').on('click', function() {
        $('#inputPassword').get(0).type = 'password';
        $('#toggleHide').hide();
        $('#toggleShow').show();
    })

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

        $('#error-div').removeClass();
        $('#error-div').hide();

        var publicapi = '/auth/realms/${realm.name}/protocol/openid-connect/token';
        $.post(publicapi, {
                'username': $('#username').val().trim(),
                'password': $('#password').val().trim(),
                'client_id': 'public-client-tnc',
                'scope': 'openid',
                'grant_type': 'password'
            },
            function(response) {
                $("#kantor").empty();
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

                $('#tncMessageDiv').html(response.tnc?.message ?? 'Error retrieving data');
                $('#tncContentDiv').html(response.tnc?.data?.KONTEN ?? 'Error retrieving data');
                $('#tncVersion').html(response.tnc?.data?.VERSI_TNC_TERBARU);
                $('#tncUrlLink').attr('href', response.tnc?.data?.URL).text('Unduh di sini');

                if (response.tnc?.data?.STATUS_TNC === 0) {
                    // updating hidden input for triggering tnc update for login backend
                    $('#statusTnc').val(response.tnc?.data?.STATUS_TNC);
                    $('#termsModal').modal('show');
                } else {
                    $(function() {
                        $('#termsCheck').prop('checked', true);
                        $('#kc-login').prop('disabled', !$('#termsCheck').is(':checked'));
                    });
                }
            })
            .fail(function(jqXHR, textStatus, errorThrown) {

                const errorResponse = JSON.parse(jqXHR.responseText);

                $("body").removeClass("loading");
                $('#error-text').text(errorResponse.error_description);
                $('#error-div').addClass("alert alert-danger");
                $('#error-div').show();
            });
    }

    $('#kc-next').on('click', function (e) {
        login();
    });

    $('#kc-form-buttons').hide();
    $('#otp-field').hide();
    $('#kantor-field').hide();
    $('#error-div').hide();

    <#if message?? && message?has_content>
        $('#error-text').text("${message.summary}");
        $('#error-div').addClass("alert alert-danger");
        $('#error-div').show();
    </#if>

    // Enable/disable login button based on terms checkbox
    $('#termsCheck').on('change', function() {
        $('#kc-login').prop('disabled', !this.checked);
    });
    // Set initial state on page load
    $(function() {
        $('#kc-login').prop('disabled', !$('#termsCheck').is(':checked'));
    });

    // Show modal when link is clicked
    $('#show-terms-link').on('click', function(e) {
        e.preventDefault();
        $('#termsModal').modal('show');
    });

</script>

</body>
</html>
