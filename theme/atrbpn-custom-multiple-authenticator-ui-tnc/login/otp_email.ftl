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

    <style>
        .modal-body {
            max-height: 80vh;
            overflow-y: auto;
        }
        .toc {
            background-color: #f8f9fa;
            padding: 25px;
            border-radius: 6px;
            margin-bottom: 30px;
            border-left: 4px solid #0d6efd;
        }
        .toc h3 {
            margin-top: 0;
            font-size: 18px;
            margin-bottom: 15px;
        }
        .toc ul {
            list-style: none;
            padding-left: 0;
        }
        .toc li {
            margin-bottom: 8px;
        }
        .toc a {
            color: #0d6efd;
            text-decoration: none;
        }
        .toc a:hover {
            text-decoration: underline;
        }
        .updated {
            color: #666;
            font-size: 14px;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e0e0e0;
        }
    </style>

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
                                    <input type="text" class="form-control" placeholder="6 Digits OTP" autocomplete="off" id="otp" name="otp" maxlength="6" required />
                                </div>
                            </div>

                            <div id="kc-form-buttons" >
                                <div class="custom-control custom-checkbox mb-2">
                                    <input type="checkbox" class="custom-control-input" id="termsCheck" name="termsCheck" required>
                                    <label class="custom-control-label" for="termsCheck">
                                        Saya telah membaca dan menyetujui <a href="#" id="show-terms-link">Syarat dan Ketentuan</a> Kementerian ATR/BPN
                                    </label>
                                </div>
                                <input type="submit" class="btn btn-primary w-100" id="kc-login" value="Login" />
                            </div>

                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-8 px-0">
                <div class="image" style="background-image: url('${url.resourcesPath}/images/image_login_2_1.png')"></div>
            </div>

            <!-- Terms and Conditions Modal -->
            <div class="modal fade" id="termsModal" tabindex="-1" role="dialog" aria-labelledby="termsModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="termsModalLabel">
                            <div id="tncMessageDiv" name="tncMessageDiv">
                                <#if tncMessage??>
                                    ${tncMessage?no_esc}
                                <#else>
                                    Error retrieving T&C data.
                                </#if>
                            </div>
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#termsModal').modal('hide')">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <!-- Replace the content below with your actual terms and conditions -->
                            <div id="tncContentDiv" name="tncContentDiv">
                                <#if tncContent??>
                                    ${tncContent?no_esc}
                                <#else>
                                    Error retrieving T&C data.
                                </#if>
                            </div>
                            <div class="updated">
                                <div>Versi T&C terbaru: 
                                    <span id="tncVersion" name="tncVersion">
                                        <#if tncVersionUpdated??>${tncVersionUpdated?js_string}</#if>
                                    </span>
                                </div>
                                <div>
                                    <#if tncUrl??>
                                        <a id="tncUrlLink" name="tncUrlLink" href="${tncUrl?js_string}" target="_blank">Unduh di sini</a>
                                    <#else>
                                        <span id="tncUrlLink" name="tncUrlLink" style="display: none;"></span>
                                    </#if>
                                </div>
                            </div>
                        </div>
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

    $('#kc-form-login').submit(function() {
        $("input").blur();
        $("body").addClass("loading");
    });

    // Enable/disable login button based on terms checkbox
    $('#termsCheck').on('change', function() {
        $('#kc-login').prop('disabled', !this.checked);
    });

    // Set initial state on page load
    $(function() {
        <#if tncStatus?? && tncStatus == 0>
            $('#termsCheck').prop('checked', false);
            $('#termsModal').modal('show');
        <#else>
            $('#termsCheck').prop('checked', true);
        </#if>
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
