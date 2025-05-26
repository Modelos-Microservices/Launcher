<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "header">
        <div class="login-header">
            <h1>Bienvenido</h1>
            <p>Inicia sesión en tu cuenta</p>
        </div>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <#if realm.password>
                    <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                        <div class="form-group">
                            <label for="username" class="sr-only">
                                <#if !realm.loginWithEmailAllowed>${msg("username")}
                                <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                                <#else>${msg("email")}</#if>
                            </label>
                            <div class="input-wrapper">
                                <span class="input-icon">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                </span>
                                <#if usernameEditDisabled??>
                                    <input tabindex="1" id="username" class="form-control" name="username" value="${(login.username!'')}" type="text" disabled placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"/>
                                <#else>
                                    <input tabindex="1" id="username" class="form-control" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"/>
                                </#if>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="sr-only">${msg("password")}</label>
                            <div class="input-wrapper">
                                <span class="input-icon">
                                    <i class="fa fa-lock" aria-hidden="true"></i>
                                </span>
                                <input tabindex="2" id="password" class="form-control" name="password" type="password" autocomplete="off" placeholder="${msg("password")}"/>
                            </div>
                        </div>

                        <div class="form-group login-options">
                            <div id="kc-form-options">
                                <#if realm.rememberMe && !usernameEditDisabled??>
                                    <div class="checkbox">
                                        <label class="remember-me">
                                            <#if login.rememberMe??>
                                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> 
                                                <span class="checkbox-text">${msg("rememberMe")}</span>
                                            <#else>
                                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> 
                                                <span class="checkbox-text">${msg("rememberMe")}</span>
                                            </#if>
                                        </label>
                                    </div>
                                </#if>
                            </div>
                            <div class="forgot-password">
                                <#if realm.resetPasswordAllowed>
                                    <a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                                </#if>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div id="kc-form-buttons">
                                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                                <button tabindex="4" class="btn btn-primary btn-block btn-lg" name="login" id="kc-login" type="submit">
                                    <span class="btn-text">${msg("doLogIn")}</span>
                                </button>
                            </div>
                        </div>
                        
                        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                            <div class="register-link">
                                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                            </div>
                        </#if>
                    </form>
                </#if>
            </div>
        </div>

        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="social-providers">
                <div class="social-providers-divider">
                    <span class="divider-line"></span>
                    <span class="divider-text">${msg("identity-provider-login-label")}</span>
                    <span class="divider-line"></span>
                </div>
                <ul class="social-links">
                    <#list social.providers as p>
                        <li>
                            <a id="social-${p.alias}" class="social-link social-link-${p.providerId}" type="button" href="${p.loginUrl}">
                                <#if p.iconClasses?has_content><i class="${p.iconClasses}" aria-hidden="true"></i></#if>
                                <span class="text">${p.displayName!}</span>
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>