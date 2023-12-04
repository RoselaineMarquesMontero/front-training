<header class="bg-dark navbar navbar-dark py-4 section-header text-white">
	<div class="container flex-column flex-lg-row justify-content-between text-break">
		<a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
			<img class="section-header-logo" alt="${logo_description}" src="${site_logo}" />
		</a>
		<div class="align-items-center d-flex flex-column flex-lg-row mt-3 mt-lg-0">
			<#if has_navigation && is_setup_complete>
				<#include "${full_templates_path}/navigation.ftl" />
			</#if>
			<#if !is_signed_in>
			<span class="ml-lg-3 mt-4 mt-lg-0 sign-in">
				<a class="btn btn-outline-light btn-sm" data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
			</span>
			</#if>
            <#if is_signed_in>
            <#assign preferences = freeMarkerPortletPreferences.getPreferences({"portletSetupPortletDecoratorId": "borderless", "destination": "/search"}) />

							<div class="autofit-col autofit-col-expand">
								<#if show_header_search>
									<div class="justify-content-md-end mr-4 navbar-form" role="search">
										<@liferay.search_bar default_preferences="${preferences}" />
									</div>
								</#if>
							</div>

							<div class="autofit-col">
								<@liferay.user_personal_bar />
							</div>
            </#if>
		</div>
	</div>
</header>