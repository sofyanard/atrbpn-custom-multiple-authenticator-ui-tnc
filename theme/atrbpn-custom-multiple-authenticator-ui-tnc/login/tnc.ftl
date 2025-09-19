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
                        <p>Terms and Condition</p>

                        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">

                            <div id="tnc-field" class="wrap-input">
                                <p style="text-align: justify;">
                                    We assume no liability for the availability, errors or inaccuracies of the information, products or services provided on
                                    this Website. We may experience delays in updating information on this Website and in our advertising on other websites.
                                    The information, products and services found on the Website may contain errors or inaccuracies or may not be complete or
                                    current. Products or services may be incorrectly priced or unavailable.

                                    We expressly reserve the right to correct any pricing errors on our Website.
                                    The inclusion or offering of any product or service on this Website does not constitute an endorsement or
                                    recommendation of such product or service by us.
                                </p>
                                <p style="text-align: justify;">
                                    This Website may contain hyperlinks to websites operated by third parties and not by us.
                                    We provide such hyperlinks for your reference only. We do not control such websites and are not responsible for their
                                    contents or the privacy or other practices of such websites. Further, it is your responsibility to take precautions
                                    to ensure that whatever links you click on or software that you download, whether from this Website or other websites
                                    or applications, is free of such items as viruses, worms, trojan horses, defects and other items of a destructive nature.

                                    Our inclusion of hyperlinks to such websites does not imply any endorsement of the material on such websites or any
                                    association with their operators.
                                </p>
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
