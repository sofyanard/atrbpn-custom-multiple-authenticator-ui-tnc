<!DOCTYPE html>
<html lang="en" style="height: 100%;">
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

<body style="height: 100%;">

<div class="login" style="height: 100%;">
    <div class="container-fluid" style="height: 100%;">
        <div class="row" style="height: 100%;">
            <div class="col-md-4 px-0" style="flex: 1;overflow-y: scroll;height: 100%;">
                <div class="login-panel" style="background-image: url('${url.resourcesPath}/images/typo.png')">
                    <img src="${url.resourcesPath}/images/bg.png" alt="" class="bg-bot">
                    <div class="logo"><img src="${url.resourcesPath}/images/logo.png" alt=""/>
                        <h5>Kementerian Agraria dan Tata Ruang /
                            Badan Pertanahan Nasional</h5></div>

                    <div class="login-wrap">
                        <h1>${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}</h1>
                        <p>Silahkan konfigurasi OTP Authenticator anda</p>

        <ol id="kc-totp-settings">
            <li>
                <p>${msg("loginTotpStep1")}</p>

                <ul id="kc-totp-supported-apps">
                    <#list totp.policy.supportedApplications as app>
                        <li>${app}</li>
                    </#list>
                </ul>
            </li>

            <#if mode?? && mode = "manual">
                <li>
                    <p>${msg("loginTotpManualStep2")}</p>
                    <p><span id="kc-totp-secret-key">${totp.totpSecretEncoded}</span></p>
                    <p><a href="${totp.qrUrl}" id="mode-barcode">${msg("loginTotpScanBarcode")}</a></p>
                </li>
                <li>
                    <p>${msg("loginTotpManualStep3")}</p>
                    <p>
                    <ul>
                        <li id="kc-totp-type">${msg("loginTotpType")}: ${msg("loginTotp." + totp.policy.type)}</li>
                        <li id="kc-totp-algorithm">${msg("loginTotpAlgorithm")}: ${totp.policy.getAlgorithmKey()}</li>
                        <li id="kc-totp-digits">${msg("loginTotpDigits")}: ${totp.policy.digits}</li>
                        <#if totp.policy.type = "totp">
                            <li id="kc-totp-period">${msg("loginTotpInterval")}: ${totp.policy.period}</li>
                        <#elseif totp.policy.type = "hotp">
                            <li id="kc-totp-counter">${msg("loginTotpCounter")}: ${totp.policy.initialCounter}</li>
                        </#if>
                    </ul>
                    </p>
                </li>
            <#else>
                <li>
                    <p>${msg("loginTotpStep2")}</p>
                    <img id="kc-totp-secret-qr-code" src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"><br/>
                    <p><a href="${totp.manualUrl}" id="mode-manual">${msg("loginTotpUnableToScan")}</a></p>
                </li>
            </#if>
            <li>
                <p>${msg("loginTotpStep3")}</p>
                <p>${msg("loginTotpStep3DeviceName")}</p>
            </li>
        </ol>

        <form action="${url.loginAction}" class="${properties.kcFormClass!}" id="kc-totp-settings-form" method="post">

                <div class="alert alert-danger" role="alert" id="error-div">
                    <span id="error-text"></span>
                </div>

                <div id="totp-field">

                    <label for="totp">One-Time Code</label> 
                    <div class="wrap-input totp">
                        <img src="${url.resourcesPath}/images/shield.png" alt="" class="prepend-icon">
                        <input type="text" id="totp" name="totp" autocomplete="off" class="form-control"  maxlength="6" />                                            
                    </div>

                </div>
                <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
                <#if mode??><input type="hidden" id="mode" name="mode" value="${mode}"/></#if>

                
                <div id="userLabel-field">

                    <label for="userLabel">Nama Device</label> 
                    <div class="wrap-input totp">
                        <img src="${url.resourcesPath}/images/shield.png" alt="" class="prepend-icon">
                        <input type="text" id="userLabel" name="userLabel" autocomplete="off" class="form-control" />
                    </div>

                </div>

            <#if isAppInitiatedAction??>
                <input type="submit"
                       class="btn btn-primary w-100 ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}"
                       id="saveTOTPBtn" value="${msg("doSubmit")}"
                />
                <button type="submit"
                        class="btn btn-primary w-100 ${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!} ${properties.kcButtonLargeClass!}"
                        id="cancelTOTPBtn" name="cancel-aia" value="true" />${msg("doCancel")}
                </button>
            <#else>
                <div class="custom-control custom-checkbox mb-2">
                    <input type="checkbox" class="custom-control-input" id="termsCheck" name="termsCheck" required>
                    <label class="custom-control-label" for="termsCheck">
                        Saya telah membaca dan menyetujui <a href="#" id="show-terms-link">Syarat dan Ketentuan</a> Kementerian ATR/BPN
                    </label>
                </div>
                <input type="submit"
                       class="btn btn-primary w-100 ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                       id="saveTOTPBtn" value="${msg("doSubmit")}"
                />
            </#if>
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

        $('#error-div').removeClass();
        $('#error-div').hide();

    $('#kc-form-login').submit(function() {
        $("input").blur();
        $("body").addClass("loading");
    });

    <#if messagesPerField.existsError('userLabel')>
        $('#error-text').text("${kcSanitize(messagesPerField.get('userLabel'))?no_esc}");
        $('#error-div').addClass("alert alert-danger");
        $('#error-div').show();
    </#if>

    
    <#if messagesPerField.existsError('totp')>
        $('#error-text').text(" ${kcSanitize(messagesPerField.get('totp'))?no_esc}");
        $('#error-div').addClass("alert alert-danger");
        $('#error-div').show();
    </#if>

    function retrieveTncContent() {
        <#if tncMessage??>
            $('#tncMessageDiv').html('${tncMessage?js_string}');
        <#else>
            $('#tncMessageDiv').html('Error retrieving T&C data');
        </#if>

        <#if tncContent??>
            $('#tncContentDiv').html('${tncContent?js_string}');
        <#else>
            $('#tncContentDiv').html('Error retrieving T&C data');
        </#if>

        <#if tncVersionUpdated??>
            $('#tncVersion').text('${tncVersionUpdated?js_string}');
        <#else>
            $('#tncVersion').text('N/A');
        </#if>

        <#if tncUrl??>
            $('#tncUrlLink').attr('href', '${tncUrl?js_string}').text('Unduh di sini');
        <#else>
            $('#tncUrlLink').hide();
        </#if>
    }

    // Enable/disable login button based on terms checkbox
    $('#termsCheck').on('change', function() {
        $('#saveTOTPBtn').prop('disabled', !this.checked);
    });

    // Set initial state on page load
    $(function() {
        retrieveTncContent();
        <#if tncStatus?? && tncStatus == 0>
            $('#termsCheck').prop('checked', false);
            $('#termsModal').modal('show');
        <#else>
            $('#termsCheck').prop('checked', true);
        </#if>
        $('#saveTOTPBtn').prop('disabled', !$('#termsCheck').is(':checked'));
    });

    // Show modal when link is clicked
    $('#show-terms-link').on('click', function(e) {
        e.preventDefault();
        $('#termsModal').modal('show');
    });

</script>

</body>
</html>

