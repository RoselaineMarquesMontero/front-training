<nav id="navigation" role="navigation">
	<#if header_navigation_menu_id?has_content && desktop_header_navigation_menu_widget_template_key?has_content>
		<#assign 
			preferences = freeMarkerPortletPreferences.getPreferences({
				"siteNavigationMenuId": "${header_navigation_menu_id}", 
				"displayStyle": "ddmTemplate_${desktop_header_navigation_menu_widget_template_key}", 
				"displayStyleGroupId": "${group_id}"
			}) 
		/>
        <@liferay_portlet["runtime"]
            defaultPreferences="${preferences}"
            instanceId="${header_navigation_menu_id}DesktopHeaderNavigationMenu${desktop_header_navigation_menu_widget_template_key}"
            persistSettings=true
            portletName="com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet"
        />
	</#if>
</nav>
