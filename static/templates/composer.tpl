<div component="composer" class="composer<!-- IF resizable --> resizable<!-- ENDIF resizable --><!-- IF !isTopicOrMain --> reply<!-- ENDIF !isTopicOrMain -->">

	<div class="composer-container" style="background:black;">
		<nav class="navbar navbar-fixed-top mobile-navbar hidden-md hidden-lg" style="background:unset;">
			<div class="btn-group">
				<button class="btn btn-sm composer-discard" style="background:unset;" data-action="discard" tabindex="-1"><i class="fa fa-times text-danger"></i></button>
				<button class="btn btn-sm composer-minimize" style="background:unset;" data-action="minimize" tabindex="-1"><i class="fa fa-pause"></i></button>
			</div>
			<!-- IF isTopic -->
			<div class="category-name-container">
				<span class="category-name"></span> <i class="fa fa-sort"></i>
			</div>
			<!-- ENDIF isTopic -->
			<!-- IF !isTopicOrMain -->
			<h4 class="title">[[sejultopic:composer.replying_to, "{title}"]]</h4>
			<!-- ENDIF !isTopicOrMain -->
			<div class="display-scheduler pull-right{{{ if !canSchedule }}} hidden{{{ end }}}">
				<i class="fa fa-clock-o"></i>
			</div>
			<div class="btn-group">
				<button class="btn btn-sm composer-submit" style="background:unset;" data-action="post" tabindex="-1"><i class="fa fa-check text-success"></i></button>
			</div>
		</nav>
		<div class="row title-container">
			{{{ if isTopic }}}
			<div class="category-list-container hidden-sm hidden-xs">
				<!-- IMPORT partials/category-selector.tpl -->
			</div>
			{{{ end }}}

			<!-- IF showHandleInput -->
			<div data-component="composer/handle">
				<input class="handle form-control" type="text" tabindex="1" placeholder="[[sejultopic:composer.handle_placeholder]]" value="{handle}" />
			</div>
			<!-- ENDIF showHandleInput -->
			<div data-component="composer/title">
				<!-- IF isTopicOrMain -->
				<input class="title form-control" type="text" tabindex="1" placeholder="[[sejultopic:composer.title_placeholder]]" value="{title}"/>
				<!-- ELSE -->
				<span class="title form-control">[[sejultopic:composer.replying_to, "{title}"]]</span>
				<!-- ENDIF isTopicOrMain -->
				<div id="quick-search-container" class="quick-search-container hidden">
					<div class="text-center loading-indicator"><i class="fa fa-spinner fa-spin"></i></div>
					<div class="quick-search-results-container"></div>
				</div>
			</div>

			<div class="pull-right draft-icon hidden-xs hidden-sm"></div>

			<div class="display-scheduler pull-right hidden-sm hidden-xs{{{ if !canSchedule }}} hidden{{{ end }}}">
				<i class="fa fa-clock-o"></i>
			</div>

			<div class="btn-group pull-right action-bar hidden-sm hidden-xs">
				<button class="btn btn-default composer-discard" data-action="discard" tabindex="-1"><i class="fa fa-times"></i> [[sejultopic:composer.discard]]</button>

				<ul class="dropdown-menu">{{{ each submitOptions }}}<li><a href="#" data-action="{./action}">{./text}</a></li>{{{ end }}}</ul>
				<button class="btn btn-primary composer-submit" data-action="post" tabindex="6" data-text-variant=" [[sejultopic:composer.schedule]]"><i class="fa fa-check"></i> [[sejultopic:composer.submit]]</button>
				<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<span class="caret"></span>
					<span class="sr-only">[[sejultopic:composer.additional-options]]</span>
				</button>
			</div>
		</div>
<!--
		<div class="category-tag-row">
			<div class="btn-toolbar formatting-bar">
				<ul class="formatting-group">
					<!-- BEGIN formatting -->
						<!-- IF formatting.spacer -->
						<li class="spacer"></li>
						<!-- ELSE -->
						{{{ if (./visibility.desktop && ((isTopicOrMain && ./visibility.main) || (!isTopicOrMain && ./visibility.reply))) }}}
						<li tabindex="-1" data-format="{formatting.name}" title="{formatting.title}"><i class="{formatting.className}"></i></li>
						{{{ end }}}
						<!-- ENDIF formatting.spacer -->
					<!-- END formatting -->

					<!-- IF privileges.upload:post:image -->
					<li class="img-upload-btn" data-format="picture" tabindex="-1" title="[[modules:composer.upload-picture]]">
						<i class="fa fa-file-image-o"></i>
					</li>
					<!-- ENDIF privileges.upload:post:image -->
					<!-- IF privileges.upload:post:file -->
					<li class="file-upload-btn" data-format="upload" tabindex="-1" title="[[modules:composer.upload-file]]">
						<i class="fa fa-file-o"></i>
					</li>
					<!-- ENDIF privileges.upload:post:file -->

					<form id="fileForm" method="post" enctype="multipart/form-data">
						<input type="file" id="files" name="files[]" multiple class="gte-ie9 hide"/>
					</form>
				</ul>
			</div>
		</div>
--> 
		<div class="row write-preview-container">
			<div class="write-container">
				<div class="pull-right draft-icon hidden-md hidden-lg"></div>
				<textarea class="write" style="border-bottom:unset" tabindex="4" placeholder="[[sejulmodules:composer.textarea.placeholder]]"></textarea>
			</div>
			<div class="hidden-sm hidden-xs preview-container hide">
				<div class="help-text">
					<span class="toggle-preview">[[sejulmodules:composer.hide_preview]]</span>
				</div>
				<div class="preview well"></div>
			</div>
		</div>

		<div style="margin-top:0.5rem;">
			<input class="preview form-control" type="text" tabindex="5" placeholder="[[sejultopic:composer.referlink]]" value="{referlink}"/>
		</div>
		<div style="margin-top:0.5rem;">
			<input class="preview form-control" type="text" tabindex="6" placeholder="[[sejultopic:composer.selfreply]]" value="{selfreply}"/>
		</div>
		<div class="clearfix" style="margin:0.5rem 0; padding:10px 11px;">
			<span class="pull-left">[[sejultopic:composer.allowreply]]</span>
			<label class="pull-right toggle-control">
				<input type="checkbox" checked="checked">
				<span class="control"></span>
			</label>

		</div>

		<!-- IF isTopicOrMain -->
		<div class="tag-row">
			<div class="tags-container">
				<div class="btn-group dropup <!-- IF !tagWhitelist.length -->hidden<!-- ENDIF !tagWhitelist.length -->" component="composer/tag/dropdown">
					<button class="btn btn-default dropdown-toggle" data-toggle="dropdown" type="button">
						<span class="visible-sm-inline visible-md-inline visible-lg-inline"><i class="fa fa-tags"></i></span>
						[[sejultags:select_tags]]
					</button>

					<ul class="dropdown-menu">
						<!-- BEGIN tagWhitelist -->
						<li data-tag="{@value}"><a href="#">{@value}</a></li>
						<!-- END tagWhitelist -->
					</ul>
				</div>
				<input class="tags" type="text" class="form-control" placeholder="[[sejultags:enter_tags_here, {minimumTagLength}, {maximumTagLength}]]" tabindex="5"/>
			</div>
		</div>
		<!-- ENDIF isTopicOrMain -->

		<div class="imagedrop"><div>[[sejultopic:composer.drag_and_drop_images]]</div></div>

		<div class="resizer"><div class="trigger text-center"><i class="fa"></i></div></div>
	</div>
</div>
