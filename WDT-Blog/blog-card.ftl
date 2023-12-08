	<div class="my-blog-card container">
		<div class="row">
			<#if entries?has_content>
				<#list entries as curBlogEntry>
					<#if curBlogEntry.getCoverImageURL(themeDisplay)??>
						<#assign cardImage=true />
						<#else>
							<#assign cardImage=false />
					</#if>
					<div class="col-xs-12 col-sm-6 col-lg-3">
						<div class="card card-rounded">
							<div class="aspect-ratio card-item-first">
								<img alt="thumbnail" class="aspect-ratio-item aspect-ratio-item-fluid"
									src="${cardImage?then(curBlogEntry.getCoverImageURL(themeDisplay), portalUtil.getPathContext(renderRequest) + "
									/images/cover_image_placeholder.jpg")}" />
							</div>
							<div class="card-body d-flex justify-content-center">
							<#-- For local en the prefix of your site + /b/ -> there is an epic to make configurable also this display page prefix, validate for future trainings -->
								<h3 class="card-title d-flex pt-1">
									<a href="${" /b/" + curBlogEntry.getUrlTitle() }">${curBlogEntry.title}</a>
								</h3>
								<div class="autofit-col d-flex">
									<@clay["dropdown-actions"] additionalProps=blogsEntryActionDropdownAdditionalProps
										dropdownItems=blogsEntryActionDropdownItemsProvider.getActionDropdownItems(curBlogEntry)
										propsTransformer="blogs_admin/js/ElementsPropsTransformer"
										propsTransformerServletContext=blogsEntryActionDropdownPropsTransformerServletContext />
								</div>
								<p class="card-text">${curBlogEntry.getDescription()}</p>
							</div>
						</div>
					</div>
				</#list>
			</#if>
		</div>
	</div>