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
                        <p>Silahkan masukkan OTP anda</p>

                        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">

                            <div id="tnc-field" class="wrap-input">
                                <div id="otp-field" class="wrap-input">
                                    <img src="${url.resourcesPath}/images/shield.png" alt="" class="prepend-icon" />
                                    <input type="text" class="form-control" placeholder="6 Digits OTP" autocomplete="off" id="otp" name="otp" maxlength="6" />
                                </div>
                            </div>

                            <div id="kc-form-buttons" >
                                <input type="submit" class="btn btn-primary w-100" id="kc-login" value="Login" />
                            </div>

                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-8 px-0">
                <div class="image" style="background-image: url('${url.resourcesPath}/images/image_login_2_1.png')"></div>
            </div>
        </div>
    </div>
</div>

<div class="modal"></div>

<script>

    $('#kc-form-login').submit(function() {
        $("input").blur();
        $("body").addClass("loading");
    });

</script>

</body>
</html>
