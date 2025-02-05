<@link href="/css/cms/finger.css" rel="stylesheet"/>
<@link href="/css/cms/via.css" rel="stylesheet"/>
<@script src="/js/cms/pagefingeradd.js"></@script>
<@script src="/js/cms/pageadd_pagelist.js"></@script>
<@script src="/js/cms/pageadd_voiceeditor.js"></@script>
<@script src="/js/cms/pageadd_voicemanager.js"></@script>
<@script src="/js/cms/pagefinger_batch_audio.js"></@script>
<@script src="/js/cms/pageadd_batchuploadaudio.js"></@script>
<@script src="/js/common/Sortable.js"/>
<@script src="/js/common/jquery-sortable.js"/>
<@script src="/js/common/bootstrap-contextmenu.js" />
<@script src="/js/cms/via_finger.js" />
<@script src="/js/cms/finger_anno.js" />


<div id="pageAdd" class="picture-book-page-add" tabindex="1" style="outline: none;">

  <nav class="navbar navbar-default navbar-static-top flt">
    <div id="pageList" style="width: 200px;height: 100%;padding-top: 10px;">
      <div id="batchItem" style="position: fixed">
        <div id="batchUploadFingerAudioBtn" class="button" onmouseover="this.style.backgroundColor='#D3D3D3'"
             onMouseOut="this.style.backgroundColor='white'"
             style="display: inline-block;margin-left: 16px;float: left;cursor: pointer">
          <span style="background: #42bcef;padding: 8px 10px;color: #ffffff; float: left;cursor: pointer">批量上传真人录音</span>
        </div>

        <div id="helpFingerBtn" class="button" style="margin-top: 5px;margin-left: 11px;float: left;cursor: pointer">
          <img src="/static/images/help.png" style="width: 20px">
        </div>
      </div>
      <div id="pageListContainer" class="page-list-container">
        <div id="itemTemplate" class="col-md-2" style="display:none; width: 180px">
          <div id="thumbnailContainer" class="thumbnail-container text-center center-block">
            <div id="thumbnail" class="page-thumbnail-container">
              <img
                  src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIwAAACgBAMAAAAsgJlAAAAAGFBMVEXc29y7u7zExMXU09TNzM3JyMnQ0NHAv8ANuow4AAABgElEQVRo3u3UvW7CMBSG4dOG0LU2DazYhbI6MT8rgRRWirgA4AoKS2+/JyZEqoJUW2zoeyTWN/YnEgIAAAAAAAAAAHgk7XcqPffpLq0OlZ5eqV3UVpSLq05g5lnUJOW6MvLJRHbyZu0lE1k269oS5YZoUD3mf+4E8pJx0mojzsRd70y7WCTFKtNaySGVlKkzuVum5b9NejnTkacQurTnTFvy1iokU10qdxUltZpz5kvtKTrtW4ETu4tInuuVUs5kSZxQ3vXbJhWlab+ZsXM6/EjjlxkXpazTzBiK1iLxy7BoyT95zQhWnWZykjYX5yJgYmWqTK8o1pfMrDcwRBMVkjlsGpeamlicd3u/S8V6JPWQr3Rrm08l+kEvQ8tcM9Zm1wyzhoL+fs2JzYsuOBWYaZ4m46LcmcBMcxsaL07CNxMnW9W/nWFjv0sdBZObpVXff17NwK9f2huuDJESYu4yDmcCv8UROVv9Qe5STnWpers72PpBhgAAAAAAAAAAAB7EL5cHSvDhqEN7AAAAAElFTkSuQmCC"
                  style="" alt="封面图" class="img-thumbnail">
            </div>
            <div id="status" class="page-status-container" style="display:none">
              <span class="label picture-book-status">未审核</span>
            </div>
            <div id="editBtnContainer" class="edit-btn-container" style="display:none">
              <span id="editBtn" class="edit-btn glyphicon glyphicon-edit" aria-hidden="true"
                    style="display: none;"></span>

            </div>
          </div>
          <div class="row picture-book-title-container">
            <div id="paginationText" class="picture-book-title text-center"></div>
          </div>
        </div>
      </div>
      <@checkPrivilege url="/cms/convertFingerAudio.do">
        <div id="convertResource" style="cursor: pointer;padding: 5px 36px;position: fixed; bottom: 0">
          <div style="padding: 8px 10px;color: #000; display: inline-block">将音频用于领读</div>
          <div style="display: inline-block"><img src="/static/images/right_arrow.png" style="width: 20px"></div>
        </div>
      </@checkPrivilege>
    </div>
  </nav>

  <div class="row toolbar flt">
    <div id="togglePageListPanelBtn" class="col-md-2 toolbar-btn-container">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    </div>
  </div>

  <div id="bookEdit" class="flt" style="">
    <div class="row error-panel">
      <div class="col-md-12">
        <div id="error" class="alert alert-danger error" role="alert"></div>
      </div>
    </div>
    <!-- 书页类型选择 -->
    <div class="page-container"
         style="font-size: 14px;background: #f9fbff; border-radius: 0; line-height: 40px;border: 1px solid #eee; height: 40px">
      <div class="frame-resize-btn" style="margin-left: 15px;float: left;height: 40px">
        <div class="resize resize-left"><img title="开关左侧缩略图列表" src="static/images/finger/l_open.png" width="20"></div>
        <div class="resize resize-right"><img title="开关右侧区域名列表" src="static/images/finger/r_open.png" width="20"></div>
      </div>
      <div class="frame-delete-btn" style="margin-left: 15px; float: left; height: 40px">
        <div class="delete-btn-container delete-all-region noselect" style="cursor:pointer">
          <img title="删除全部热区" src="static/images/finger/delete.png" width="20">
          <span style="color: black">清空热区</span>
        </div>
      </div>
      <div class="left-page-info" style="margin-left: 15px;float: left; color: #343434;"></div>
      <div class="right-page-info" style="margin-right: 15px;float: right; color: #737373;width: 80%">
        <@checkPrivilege url = "/virtual/scanogram">
          <#--用户切换左右视图的按钮-->
          <div id="switchFrame">
            <ul id="switchBtn" class="switch-btn">
              <li id="leftBtn" class="switch active">左视图</li>
              <li id="rightBtn" class="switch">右视图</li>
            </ul>
          </div>
          <button id="switchToViewButton" class="frame-Button-b Button-right"
                  style="float: left;margin-right: 10px;margin-top: 5px;height: 30px;line-height: 13px;margin-left: 70%">
            查看正视图
          </button>
          <button id="switchToEditorButton" class="frame-Button-b Button-right"
                  style="display: none;float: left;margin-right: 10px;margin-top: 5px;height: 30px;line-height: 13px">
            编辑点读区域
          </button>
          <div id="fingerHelpBtn2" class="button" style="margin-top: 10px;margin-right: 10px;float: left;cursor: pointer;display: none"
               role="button" data-toggle="popover" data-trigger="hover"  data-content="切换至编辑模式进行编辑。经编辑的资源只能在编辑模式下查看改动"
          >
            <img src="/static/images/help.png" style="width: 20px">
          </div>
        </@checkPrivilege>
        <div class="message-class" style="width: 30%;margin-left: 76%">
          <span id="pageType"></span>第<span id="pagination" class="cur-page">1</span>页
          ,物理页第<span id="phyPage" class="cur-phy-page">1</span>页,
          物理页状态为<span id="phyState" class="cur-phy-state">1</span>
        </div>
      </div>
    </div>
    <!-- 图片上传及点读配置区域 -->
    <div id="picManager" class="row pic-upload-panel" style="display: inline-block; width: 1024px;height:576px">
    <#--      <canvas id="myCanvas" width="768" height="432" >-->
    <#--        Your browser does not support the HTML5 canvas tag.-->
    <#--      </canvas>-->
      <div class="via-container">
        <!--
                SVG icon set definitions
                Material icons downloaded from https://material.io/icons
              -->
        <svg style="display:none;" version="1.1" xmlns="http://www.w3.org/2000/svg"
             xmlns:xlink="http://www.w3.org/1999/xlink">
          <defs>
            <symbol id="via_logo">
              <!-- Logo designed by Abhishek Dutta <adutta@robots.ox.ac.uk>, May 2018 -->
              <title>VGG Image Annotator Logo</title>
              <rect width="400" height="160" x="0" y="0" fill="#212121"></rect>

              <text x="56" y="130" font-family="Serif" font-size="100" fill="white">V</text>
              <text x="180" y="130" font-family="Serif" font-size="100" fill="white">I</text>
              <text x="270" y="130" font-family="Serif" font-size="100" fill="white">A</text>

              <rect width="80" height="100" x="52" y="40" stroke="yellow" fill="none" stroke-width="2"></rect>
              <text x="72" y="30" font-family="'Comic Sans MS', cursive, sans-serif" font-size="18" fill="yellow">VGG
              </text>

              <rect width="50" height="100" x="175" y="45" stroke="yellow" fill="none" stroke-width="2"></rect>
              <text x="175" y="35" font-family="'Comic Sans MS', cursive, sans-serif" font-size="18" fill="yellow">
                Image
              </text>

              <rect width="80" height="100" x="265" y="40" stroke="yellow" fill="none" stroke-width="2"></rect>
              <text x="265" y="30" font-family="'Comic Sans MS', cursive, sans-serif" font-size="18" fill="yellow">
                Annotator
              </text>
            </symbol>
            <symbol id="shape_rectangle">
              <title>以矩形方式标注点读元素</title>
              <rect width="20" height="12" x="6" y="10" stroke-width="2"></rect>
            </symbol>
            <symbol id="shape_circle">
              <title>以圆形方式标注点读元素</title>
              <circle r="10" cx="16" cy="16" stroke-width="2"></circle>
            </symbol>
            <symbol id="shape_ellipse">
              <title>Elliptical region shape</title>
              <ellipse rx="12" ry="8" cx="16" cy="16" stroke-width="2"></ellipse>
            </symbol>
            <symbol id="shape_polygon">
              <title>以多边形方式标注点读元素</title>
              <path d="M 15.25,2.2372 3.625,11.6122 6,29.9872 l 20.75,-9.625 2.375,-14.75 z" stroke-width="2"></path>
            </symbol>
            <symbol id="shape_point">
              <title>Point region shape</title>
              <circle r="3" cx="16" cy="16" stroke-width="2"></circle>
            </symbol>
            <symbol id="shape_polyline">
              <title>Polyline region shape</title>
              <path d="M 2,12 10,24 18,12 24,18" stroke-width="2"></path>
              <circle r="1" cx="2" cy="12" stroke-width="2"></circle>
              <circle r="1" cx="10" cy="24" stroke-width="2"></circle>
              <circle r="1" cx="18" cy="12" stroke-width="2"></circle>
              <circle r="1" cx="24" cy="18" stroke-width="2"></circle>
            </symbol>

            <!-- Material icons downloaded from https://material.io/icons -->
            <symbol id="icon_settings">
              <path
                  d="M19.43 12.98c.04-.32.07-.64.07-.98s-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65C14.46 2.18 14.25 2 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98s.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path>
            </symbol>
            <symbol id="icon_save">
              <path
                  d="M17 3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V7l-4-4zm-5 16c-1.66 0-3-1.34-3-3s1.34-3 3-3 3 1.34 3 3-1.34 3-3 3zm3-10H5V5h10v4z"></path>
            </symbol>
            <symbol id="icon_open">
              <path
                  d="M20 6h-8l-2-2H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V8c0-1.1-.9-2-2-2zm0 12H4V8h16v10z"></path>
            </symbol>
            <symbol id="icon_gridon">
              <path
                  d="M20 2H4c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zM8 20H4v-4h4v4zm0-6H4v-4h4v4zm0-6H4V4h4v4zm6 12h-4v-4h4v4zm0-6h-4v-4h4v4zm0-6h-4V4h4v4zm6 12h-4v-4h4v4zm0-6h-4v-4h4v4zm0-6h-4V4h4v4z"></path>
            </symbol>
            <symbol id="icon_gridoff">
              <path
                  d="M8 4v1.45l2 2V4h4v4h-3.45l2 2H14v1.45l2 2V10h4v4h-3.45l2 2H20v1.45l2 2V4c0-1.1-.9-2-2-2H4.55l2 2H8zm8 0h4v4h-4V4zM1.27 1.27L0 2.55l2 2V20c0 1.1.9 2 2 2h15.46l2 2 1.27-1.27L1.27 1.27zM10 12.55L11.45 14H10v-1.45zm-6-6L5.45 8H4V6.55zM8 20H4v-4h4v4zm0-6H4v-4h3.45l.55.55V14zm6 6h-4v-4h3.45l.55.54V20zm2 0v-1.46L17.46 20H16z"></path>
            </symbol>
            <symbol id="icon_next">
              <path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path>
            </symbol>
            <symbol id="icon_prev">
              <path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"></path>
            </symbol>
            <symbol id="icon_list">
              <path d="M3 13h2v-2H3v2zm0 4h2v-2H3v2zm0-8h2V7H3v2zm4 4h14v-2H7v2zm0 4h14v-2H7v2zM7 7v2h14V7H7z"></path>
            </symbol>
            <symbol id="icon_zoomin">
              <path
                  d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
              <path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z"/>
            </symbol>
            <symbol id="icon_zoomout">
              <path
                  d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14zM7 9h5v1H7z"></path>
            </symbol>
            <symbol id="icon_copy">
              <path
                  d="M16 1H4c-1.1 0-2 .9-2 2v14h2V3h12V1zm3 4H8c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h11c1.1 0 2-.9 2-2V7c0-1.1-.9-2-2-2zm0 16H8V7h11v14z"></path>
            </symbol>
            <symbol id="icon_paste">
              <path
                  d="M19 2h-4.18C14.4.84 13.3 0 12 0c-1.3 0-2.4.84-2.82 2H5c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-7 0c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1zm7 18H5V4h2v3h10V4h2v16z"></path>
            </symbol>
            <symbol id="icon_pasten">
              <path
                  d="M19 2h-4.18C14.4.84 13.3 0 12 0c-1.3 0-2.4.84-2.82 2H5c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-7 0c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1zm7 18H5V4h2v3h10V4h2v16z"></path>
              <text x="8" y="18">n</text>
            </symbol>
            <symbol id="icon_pasteundo">
              <path
                  d="M19 2h-4.18C14.4.84 13.3 0 12 0c-1.3 0-2.4.84-2.82 2H5c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-7 0c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1zm7 18H5V4h2v3h10V4h2v16z"></path>
              <text x="8" y="18">x</text>
            </symbol>
            <symbol id="icon_selectall">
              <path
                  d="M3 5h2V3c-1.1 0-2 .9-2 2zm0 8h2v-2H3v2zm4 8h2v-2H7v2zM3 9h2V7H3v2zm10-6h-2v2h2V3zm6 0v2h2c0-1.1-.9-2-2-2zM5 21v-2H3c0 1.1.9 2 2 2zm-2-4h2v-2H3v2zM9 3H7v2h2V3zm2 18h2v-2h-2v2zm8-8h2v-2h-2v2zm0 8c1.1 0 2-.9 2-2h-2v2zm0-12h2V7h-2v2zm0 8h2v-2h-2v2zm-4 4h2v-2h-2v2zm0-16h2V3h-2v2zM7 17h10V7H7v10zm2-8h6v6H9V9z"></path>
            </symbol>
            <symbol id="icon_close">
              <path
                  d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
            </symbol>
            <symbol id="icon_insertcomment">
              <path
                  d="M20 2H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h14l4 4V4c0-1.1-.9-2-2-2zm-2 12H6v-2h12v2zm0-3H6V9h12v2zm0-3H6V6h12v2z"></path>
            </symbol>
            <symbol id="icon_checkbox">
              <path
                  d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"></path>
            </symbol>
            <symbol id="icon_fileupload">
              <path d="M9 16h6v-6h4l-7-7-7 7h4zm-4 2h14v2H5z"></path>
            </symbol>
            <symbol id="icon_filedownload">
              <path d="M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z"></path>
            </symbol>
          </defs>
        </svg>

        <!-- used by invoke_with_user_inputs() to gather user inputs -->
        <div id="user_input_panel"></div>

        <!-- to show status messages -->
        <div id="message_panel">
          <div id="message_panel_content" class="content" style="display: none"></div>
        </div>

        <!-- spreadsheet like editor for annotations -->
        <div id="annotation_editor_panel">
          <div class="button_panel">
            <span class="text_button" onclick="edit_region_metadata_in_annotation_editor()"
                  id="button_edit_region_metadata" title="Manual annotations of regions">Region Annotations</span>
            <span class="text_button" onclick="edit_file_metadata_in_annotation_editor()" id="button_edit_file_metadata"
                  title="Manual annotations of a file">File Annotations</span>

            <span class="button" style="float:right;margin-right:0.2rem;"
                  onclick="annotation_editor_toggle_all_regions_editor()"
                  title="Close this window of annotation editor">&times;</span>
            <span class="button" style="float:right;margin-right:0.2rem;"
                  onclick="annotation_editor_increase_panel_height()"
                  title="Increase the height of this panel">&uarr;</span>
            <span class="button" style="float:right;margin-right:0.2rem;"
                  onclick="annotation_editor_decrease_panel_height()"
                  title="Decrease the height of this panel">&darr;</span>
            <span class="button" style="float:right;margin-right:0.2rem;"
                  onclick="annotation_editor_increase_content_size()"
                  title="Increase size of contents in annotation editor">&plus;</span>
            <span class="button" style="float:right;margin-right:0.2rem;"
                  onclick="annotation_editor_decrease_content_size()"
                  title="Decrease size of contents in annotation editor">&minus;</span>
          </div>
          <!-- here, a child div with id="annotation_editor" is added by javascript -->
        </div>

        <div class="top_panel" id="ui_top_panel" style="display: none">
          <!-- menu bar -->
          <div class="menubar">
            <ul>
              <li onclick="show_home_panel()" style="cursor:pointer;">Home</li>
              <li>Project
                <ul>
                  <li onclick="project_open_select_project_file()" title="Load a VIA project (from a JSON file)">Load
                  </li>
                  <li onclick="project_save_with_confirm()" title="Save this VIA project (as a JSON file)">Save</li>
                  <li onclick="settings_panel_toggle()" title="Show/edit project settings">Settings</li>
                  <li class="submenu_divider"></li>
                  <li onclick="sel_local_images()" title="Add images locally stored in this computer">Add local files
                  </li>
                  <li onclick="project_file_add_url_with_input()"
                      title="Add images from a web URL (e.g. http://www.robots.ox.ac.uk/~vgg/software/via/images/swan.jpg)">
                    Add files from URL
                  </li>
                  <li onclick="project_file_add_abs_path_with_input()"
                      title="Add images using absolute path of file (e.g. /home/abhishek/image1.jpg)">Add file using
                    absolute path
                  </li>
                  <li onclick="sel_local_data_file('files_url')"
                      title="Add images from a list of web url or absolute path stored in a text file (one url or path per line)">
                    Add url or path from text file
                  </li>
                  <li onclick="project_file_remove_with_confirm()"
                      title="Remove selected file (i.e. file currently being shown)">Remove file
                  </li>
                  <li class="submenu_divider"></li>
                  <li onclick="sel_local_data_file('attributes')"
                      title="Import region and file attributes from a JSON file">Import region/file attributes
                  </li>
                  <li onclick="project_save_attributes()" title="Export region and file attributes to a JSON file">
                    Export region/file attributes
                  </li>
                </ul>
              </li>

              <li>Annotation
                <ul>
                  <li onclick="download_all_region_data('csv')" title="Export annotations to a CSV file">Export
                    Annotations (as csv)
                  </li>
                  <li onclick="download_all_region_data('json')" title="Export annotaitons to a JSON file">Export
                    Annotations (as json)
                  </li>
                  <li onclick="download_all_region_data('coco', 'json')"
                      title="Export annotaitons to COCO (http://cocodataset.org) format">Export Annotations (COCO
                    format)
                  </li>
                  <li onclick="" class="submenu_divider"></li>
                  <li onclick="sel_local_data_file('annotations')" title="Import annotations from a CSV file">Import
                    Annotations (from csv)
                  </li>
                  <li onclick="sel_local_data_file('annotations')" title="Import annotations from a JSON file">Import
                    Annotations (from json)
                  </li>
                  <li onclick="sel_local_data_file('annotations_coco')"
                      title="Import annotations from a COCO (http://cocodataset.org) formatted JSON file">Import
                    Annotations (COCO format)
                  </li>

                  <li class="submenu_divider"></li>
                  <li onclick="show_annotation_data()"
                      title="Show a preview of annotations (opens in a new browser windows)">Preview Annotations
                  </li>
                  <li onclick="download_as_image()" title="Download an image containing the annotations">Download as
                    Image
                  </li>
                </ul>
              </li>

              <li>View
                <ul>
                  <li onclick="image_grid_toggle()" title="Toggle between single image view and image grid view">Toggle
                    image grid view
                  </li>
                  <li onclick="leftsidebar_toggle()" title="Show or hide the sidebar shown in left hand side">Toggle
                    left sidebar
                  </li>
                  <li onclick="toggle_img_fn_list_visibility()"
                      title="Show or hide a panel to update annotations corresponding to file and region">Toggle image
                    filename list
                  </li>
                  <li class="submenu_divider"></li>
                  <li onclick="toggle_attributes_editor()"
                      title="Show or hide a panel to update file and region attributes">Toggle attributes editor
                  </li>
                  <li onclick="annotation_editor_toggle_all_regions_editor()"
                      title="Show or hide a panel to update annotations corresponding to file and region">Toggle
                    annotation editor (Space)
                  </li>
                  <li class="submenu_divider"></li>
                  <li onclick="toggle_region_boundary_visibility()" title="Show or hide the region boundaries">Show/hide
                    region boundaries (b)
                  </li>
                  <li onclick="toggle_region_id_visibility()" title="Show or hide the region id labels">Show/hide region
                    labels (l)
                  </li>
                  <li onclick="toggle_region_info_visibility()" title="Show or hide the image coordinates">Show/hide
                    region info.
                  </li>
                </ul>
              </li>

              <li>Help
                <ul>
                  <li onclick="set_display_area_content(VIA_DISPLAY_AREA_CONTENT_NAME.PAGE_GETTING_STARTED)"
                      title="Show a guide to get started with this application">Getting Started
                  </li>
                  <li title="Visit the project page for this application"><a
                      href="http://www.robots.ox.ac.uk/~vgg/software/via/" target="_blank">VGG Project Page</a></li>
                  <li onclick=""
                      title="Report an issue to the developers of this application (requires an account at gitlab.com)">
                    <a href="https://gitlab.com/vgg/via/issues" target="_blank">Report issues</a></li>
                  <li class="submenu_divider"></li>
                  <li><a target="_blank" href="https://gitlab.com/vgg/via/blob/master/Contributors.md"
                         title="List of people who have contributed towards the development of VIA">Contributors</a>
                  </li>
                  <li onclick="set_display_area_content(VIA_DISPLAY_AREA_CONTENT_NAME.PAGE_LICENSE)"
                      title="View license of this application">License
                  </li>
                  <li onclick="set_display_area_content(VIA_DISPLAY_AREA_CONTENT_NAME.PAGE_ABOUT)"
                      title="Show more details about this application">About VIA
                  </li>
                </ul>
              </li>
            </ul>
          </div> <!-- end of menubar -->

          <!-- Shortcut toolbar -->
          <div class="toolbar">
            <svg onclick="project_open_select_project_file()" viewbox="0 0 24 24">
              <use xlink:href="#icon_open"></use>
              <title>Open Project</title></svg>
            <svg onclick="project_save_with_confirm()" viewbox="0 0 24 24">
              <use xlink:href="#icon_save"></use>
              <title>Save Project</title></svg>
            <svg onclick="settings_panel_toggle()" viewbox="0 0 24 24">
              <use xlink:href="#icon_settings"></use>
              <title>Update Project Settings</title></svg>
            <!--
            <svg onclick="" viewbox="0 0 24 24"><use xlink:href="#icon_checkbox"></use><title>Locate Files</title></svg>
            -->

            <svg onclick="sel_local_data_file('annotations')" style="margin-left:1rem;" viewbox="0 0 24 24">
              <use xlink:href="#icon_fileupload"></use>
              <title>Import Annotations from CSV</title></svg>
            <svg onclick="download_all_region_data('csv')" viewbox="0 0 24 24">
              <use xlink:href="#icon_filedownload"></use>
              <title>Download Annotations as CSV</title></svg>

            <svg onclick="image_grid_toggle()" id="toolbar_image_grid_toggle" style="margin-left:1rem;"
                 viewbox="0 0 24 24">
              <use xlink:href="#icon_gridon"></use>
              <title>Switch to Image Grid View</title></svg>
            <svg onclick="annotation_editor_toggle_all_regions_editor()" viewbox="0 0 24 24">
              <use xlink:href="#icon_insertcomment"></use>
              <title>Toggle Annotation Editor</title></svg>

            <svg onclick="move_to_prev_image()" style="margin-left:1rem;" viewbox="0 0 24 24">
              <use xlink:href="#icon_prev"></use>
              <title>Previous</title></svg>
            <svg onclick="toggle_img_fn_list_visibility()" viewbox="0 0 24 24">
              <use xlink:href="#icon_list"></use>
              <title>Toggle Filename List</title></svg>
            <svg onclick="move_to_next_image()" viewbox="0 0 24 24">
              <use xlink:href="#icon_next"></use>
              <title>Next</title></svg>

            <svg onclick="zoom_in()" style="margin-left:1rem;" viewbox="0 0 24 24">
              <use xlink:href="#icon_zoomin"></use>
              <title>Zoom In</title></svg>
            <svg onclick="zoom_out()" viewbox="0 0 24 24">
              <use xlink:href="#icon_zoomout"></use>
              <title>Zoom Out</title></svg>

            <svg onclick="sel_all_regions()" viewbox="0 0 24 24" style="margin-left:1rem;">
              <use xlink:href="#icon_selectall"></use>
              <title>Select All Regions</title></svg>
            <svg onclick="copy_sel_regions()" viewbox="0 0 24 24">
              <use xlink:href="#icon_copy"></use>
              <title>Copy Regions</title></svg>
            <svg onclick="paste_sel_regions_in_current_image()" viewbox="0 0 24 24">
              <use xlink:href="#icon_paste"></use>
              <title>Paste Regions</title></svg>
            <svg onclick="paste_to_multiple_images_with_confirm()" viewbox="0 0 24 24">
              <use xlink:href="#icon_pasten"></use>
              <title>Paste Region in Multiple Images</title></svg>
            <svg onclick="del_sel_regions_with_confirm()" viewbox="0 0 24 24">
              <use xlink:href="#icon_pasteundo"></use>
              <title>Undo Regions Pasted in Multiple Images</title></svg>
            <svg onclick="del_sel_regions()" viewbox="0 0 24 24">
              <use xlink:href="#icon_close"></use>
              <title>Delete Region</title></svg>
          </div>
          <!-- end of shortcut toolbar -->
          <input type="file" id="invisible_file_input" name="files[]" style="display:none">
        </div> <!-- endof #top_panel -->

        <!-- Middle Panel contains a left-sidebar and image display areas -->
        <div class="middle_panel">
          <!-- this panel contains a button to shows the left side bar -->
          <div id="leftsidebar_collapse_panel">
            <span class="text_button" onclick="leftsidebar_toggle()" title="Show left sidebar">&rtrif;</span>
          </div>

          <div id="leftsidebar">
            <div class="leftsidebar_accordion_panel show" style="float:right; border:2px solid #f2f2f2;">
              <span class="text_button" onclick="leftsidebar_decrease_width()"
                    title="Reduce width of this toolbar panel">&larr;</span>
              <span class="text_button" onclick="leftsidebar_increase_width()"
                    title="Increase width of this toolbar panel">&rarr;</span>
              <span class="text_button" onclick="leftsidebar_toggle()"
                    title="Show/hide this toolbar panel">&ltrif;</span>
            </div>

            <button class="leftsidebar_accordion active">Region Shape</button>
            <div class="leftsidebar_accordion_panel show">
              <ul class="region_shape">
                <li id="region_shape_rect" class="selected" onclick="select_region_shape('rect')"
                    title="Rectangle (Shortcut key 1)">
                  <svg height="32" viewbox="0 0 32 32">
                    <use xlink:href="#shape_rectangle"></use>
                  </svg>
                </li>
                <li id="region_shape_polygon" onclick="select_region_shape('polygon')" title="Polygon (Shortcut key 4)">
                  <svg height="32" viewbox="0 0 32 32">
                    <use xlink:href="#shape_polygon"></use>
                  </svg>
                </li>
              </ul>
              <div id="region_info" class="display_none">&nbsp;</div>
            </div>

            <!-- Project -->
            <button class="leftsidebar_accordion active" id="project_panel_title">Project</button>
            <div class="leftsidebar_accordion_panel show" id="img_fn_list_panel">
              <div id="project_info_panel">
                <div class="row">
                  <span class="col"><label for="project_name">Name: </label></span>
                  <span class="col"><input type="text" value="" onchange="project_on_name_update(this)"
                                           id="project_name" title="VIA project name"></span>
                </div>
              </div>
              <div id="project_tools_panel">
                <div class="button_panel" style="margin:0.1rem 0;">
                  <select style="width:48%" id="filelist_preset_filters_list"
                          onchange="img_fn_list_onpresetfilter_select()"
                          title="Filter file list using predefined filters">
                    <option value="all">All files</option>
                    <option value="files_without_region">Show files without regions</option>
                    <option value="files_missing_region_annotations">Show files missing region annotations</option>
                    <option value="files_missing_file_annotations">Show files missing file annotations</option>
                    <option value="files_error_loading">Files that could not be loaded</option>
                    <option value="regex">Regular Expression</option>
                  </select>
                  <input style="width:50%" type="text" placeholder="regular expression" oninput="img_fn_list_onregex()"
                         id="img_fn_list_regex" title="Filter using regular expression">
                </div>
              </div>
              <div id="img_fn_list"></div>
              <p>
              <div class="button_panel">
                <span class="button" onclick="sel_local_images()" title="Add new file from local disk">Add Files</span>
                <span class="button" onclick="project_file_add_url_with_input()"
                      title="Add new file using URL">Add URL</span>
                <span class="button" onclick="project_file_remove_with_confirm()"
                      title="Remove selected file (i.e. file currently being shown) from project">Remove</span>
              </div>
              </p>
            </div>

            <!-- Attributes -->
            <button class="leftsidebar_accordion" id="attributes_editor_panel_title">Attributes</button>
            <div class="leftsidebar_accordion_panel" id="attributes_editor_panel">
              <div class="button_panel" style="padding:1rem 0;">
                <span class="text_button" onclick="show_region_attributes_update_panel()"
                      id="button_show_region_attributes" title="Show region attributes">Region Attributes</span>
                <span class="text_button" onclick="show_file_attributes_update_panel()" id="button_show_file_attributes"
                      title="Show file attributes">File Attributes</span>
              </div>
              <div id="attributes_update_panel">
                <div class="button_panel">
                  <input style="width:70%" type="text" placeholder="attribute name" id="user_input_attribute_id"
                         value="">
                  <span id="button_add_new_attribute" class="button" onclick="add_new_attribute_from_user_input()"
                        title="Add new attribute">&plus;</span>
                  <span id="button_del_attribute" class="button" onclick="delete_existing_attribute_with_confirm()"
                        title="Delete existing attribute">&minus;</span>
                </div>
                <div class="button_panel" style="margin:0.1rem 0;">
                  <select style="width:100%" id="attributes_name_list" onchange="update_current_attribute_id(this)"
                          title="List of existing attributes"></select>
                </div>
                <div id="attribute_properties"></div>
                <div id="attribute_options"></div>
                <p style="text-align:center">
                  <span class="text_button" title="Show a spreadsheet like editor for all manual annotations"
                        onclick="annotation_editor_toggle_all_regions_editor()">Toggle Annotation Editor</span>
                </p>
              </div>
            </div>

            <button class="leftsidebar_accordion">Keyboard Shortcuts</button>
            <div class="leftsidebar_accordion_panel">
              <div style="display:block; text-align:center; padding:1rem;">Available only on image focus</div>
              <table>
                <tr>
                  <td style="width:8em;"><span class="key">&larr;</span>&nbsp;<span class="key">&uarr;</span>&nbsp;<span
                      class="key">&rarr;</span>&nbsp;<span class="key">&darr;</span></td>
                  <td>Move selected region by 1 px (Shift to jump)</td>
                </tr>
                <tr>
                  <td><span class="key">a</span></td>
                  <td>Select all regions</td>
                </tr>

                <tr>
                  <td><span class="key">c</span></td>
                  <td>Copy selected regions</td>
                </tr>
                <tr>
                  <td><span class="key">v</span></td>
                  <td>Paste selected regions</td>
                </tr>
                <tr>
                  <td><span class="key">d</span></td>
                  <td>Delete selected regions</td>
                </tr>
                <tr>
                  <td><span class="key">Ctrl</span> + Wheel</td>
                  <td>Zoom in/out (mouse cursor is over image)</td>
                </tr>
                <tr>
                  <td><span class="key">l</span></td>
                  <td>Toggle region label</td>
                </tr>
                <tr>
                  <td><span class="key">b</span></td>
                  <td>Toggle region boundary</td>
                </tr>
                <tr>
                  <td><span class="key">Enter</span></td>
                  <td>Finish drawing polyshape</td>
                </tr>
                <tr>
                  <td><span class="key">Backspace</span></td>
                  <td>Delete last polyshape vertex</td>
                </tr>
              </table>

              <div style="display:block; text-align:center; padding:1rem;">Always Available</div>
              <table>
                <tr>
                  <td style="width:8em;"><span class="key">&larr;</span>&nbsp;<span class="key">&rarr;</span></td>
                  <td>Move to next/previous image</td>
                </tr>
                <tr>
                  <td><span class="key">+</span>&nbsp;<span class="key">-</span>&nbsp;<span class="key">=</span></td>
                  <td>Zoom in/out/reset</td>
                </tr>
                <tr>
                  <td><span class="key">&uarr;</span></td>
                  <td>Update region label</td>
                </tr>
                <tr>
                  <td><span class="key">&darr;</span></td>
                  <td>Update region colour</td>
                </tr>
                <tr>
                  <td><span class="key">Spacebar</span></td>
                  <td>Toggle annotation editor (Ctrl to toggle on image editor)</td>
                </tr>
                <tr>
                  <td><span class="key">Home</span> / <span class="key">h</span></td>
                  <td>Jump to first image</td>
                </tr>
                <tr>
                  <td><span class="key">End</span> / <span class="key">e</span></td>
                  <td>Jump to last image</td>
                </tr>
                <tr>
                  <td><span class="key">PgUp</span> / <span class="key">u</span></td>
                  <td>Jump several images</td>
                </tr>
                <tr>
                  <td><span class="key">PgDown</span> / <span class="key">d</span></td>
                  <td>Jump several images</td>
                </tr>

                <tr>
                  <td><span class="key">Esc</span></td>
                  <td>Cancel ongoing task</td>
                </tr>
              </table>
            </div>

          </div> <!-- end of leftsidebar -->

          <!-- Main display area: contains image canvas, ... -->
          <div id="display_area">
            <div id="option_panel">
              <ul>
                <li style="line-height: 32px;padding-left: 0;font-weight: 800;">选择标注点读元素方式:</li>
                <li id="rectBtn" class="selected">
                  <svg height="32" viewbox="0 0 32 32">
                    <use xlink:href="#shape_rectangle"></use>
                  </svg>
                </li>
                <li id="polygonBtn">
                  <svg height="32" viewbox="0 0 32 32">
                    <use xlink:href="#shape_polygon"></use>
                  </svg>
                </li>
              </ul>
            <#--              <button id="exportBtn">输出json</button>-->
            </div>
            <div id="image_panel" class="display_area_content display_none">
              <!-- buffer images using <img> element will be added here -->
              <div id="close_tip" style="position: absolute"></div>
              <!-- @todo: in future versions, this canvas will be replaced by a <svg> element -->
              <canvas id="region_canvas" width="768" tabindex="1" style="user-select: none;">Sorry, your browser does
                not support HTML5 Canvas functionality which is required for this application.
              </canvas>
              <!-- here, a child div with id="annotation_editor" is added by javascript -->
            </div>
            <div id="image_grid_panel" class="display_area_content display_none">

              <div id="image_grid_group_panel">
                <span class="tool">Group by&nbsp; <select id="image_grid_toolbar_group_by_select"
                                                          onchange="image_grid_toolbar_onchange_group_by_select(this)"></select></span>
              </div>

              <div id="image_grid_toolbar">
                <span>Selected</span>
                <span id="image_grid_group_by_sel_img_count">0</span>
                <span>of</span>
                <span id="image_grid_group_by_img_count">0</span>
                <span>images in current group, show</span>

                <span>
              <select id="image_grid_show_image_policy" onchange="image_grid_onchange_show_image_policy(this)">
                <option value="all">all images (paginated)</option>
                <option value="first_mid_last">only first, middle and last image</option>
                <option value="even_indexed">even indexed images (i.e. 0,2,4,...)</option>
                <option value="odd_indexed">odd indexed images (i.e. 1,3,5,...)</option>
                <option value="gap5">images 1, 5, 10, 15,...</option>
                <option value="gap25">images 1, 25, 50, 75, ...</option>
                <option value="gap50">images 1, 50, 100, 150, ...</option>
              </select>
            </span>

                <div id="image_grid_nav"></div>
              </div>

              <div id="image_grid_content">
                <div id="image_grid_content_img"></div>
                <svg xmlns:xlink="http://www.w3.org/2000/svg" id="image_grid_content_rshape"></svg>
              </div>

              <div id="image_grid_info">
              </div>
            </div> <!-- end of image grid panel -->

            <div id="settings_panel" class="display_area_content display_none">
              <h2>Settings</h2>
              <div class="row">
                <div class="variable">
                  <div class="name">Project Name</div>
                </div>

                <div class="value">
                  <input type="text" id="_via_settings.project.name"/>
                </div>
              </div>

              <div class="row">
                <div class="variable">
                  <div class="name">Default Path</div>
                  <div class="desc">If all images in your project are saved in a single folder, set the default path to
                    the location of this folder. The VIA application will load images from this folder by default. Note:
                    a default path of <code>"./"</code> indicates that the folder containing <code>via.html</code>
                    application file also contains the images in this project. For example: <code>/datasets/VOC2012/JPEGImages/</code>
                    or <code>C:\Documents\data\</code>&nbsp;<strong>(note the trailing <code>/</code> and <code>\</code></strong>)
                  </div>
                </div>

                <div class="value">
                  <input type="text" id="_via_settings.core.default_filepath"
                         placeholder="/datasets/pascal/voc2012/VOCdevkit/VOC2012/JPEGImages/"/>
                </div>
              </div>

              <div class="row">
                <div class="variable">
                  <div class="name">Search Path List</div>
                  <div class="desc">If you define multiple paths, all these folders will be searched to find images in
                    this project. We do not recommend this approach as it is computationally expensive to search for
                    images in multiple folders.
                    <ol id="_via_settings.core.filepath"></ol>
                  </div>
                </div>

                <div class="value">
                  <input type="text" id="settings_input_new_filepath"
                         placeholder="/datasets/pascal/voc2012/VOCdevkit/VOC2012/JPEGImages"/>
                </div>
              </div>

              <div class="row">
                <div class="variable">
                  <div class="name">Region Label</div>
                  <div class="desc">By default, each region in an image is labelled using the region-id. Here, you can
                    select a more descriptive labelling of regions.
                  </div>
                </div>

                <div class="value">
                  <select id="_via_settings.ui.image.region_label"></select>
                </div>
              </div>

              <div class="row">
                <div class="variable">
                  <div class="name">Region Colour</div>
                  <div class="desc">By default, each region is drawn using a single colour. Using this setting, you can
                    assign a unique colour to regions grouped according to a region attribute.
                  </div>
                </div>

                <div class="value">
                  <select id="_via_settings.ui.image.region_color"></select>
                </div>
              </div>

              <div class="row">
                <div class="variable">
                  <div class="name">Region Label Font</div>
                  <div class="desc">Font size and font family for showing region labels.</div>
                </div>

                <div class="value">
                  <input id="_via_settings.ui.image.region_label_font" placeholder="12px Arial"/>
                </div>
              </div>

              <div class="row">
                <div class="variable">
                  <div class="name">Preload Buffer Size</div>
                  <div class="desc">Images are preloaded in buffer to allow smoother navigation of next/prev images. A
                    large buffer size may slow down the overall browser performance. To disable preloading, set buffer
                    size to 0.
                  </div>
                </div>
                <div class="value">
                  <input type="text" id="_via_settings.core.buffer_size"/>
                </div>
              </div>

              <div class="row">
                <div class="variable">
                  <div class="name">On-image Annotation Editor</div>
                  <div class="desc">When a single region is selected, the on-image annotation editor is gets activated
                    which the user to update annotations of this region. By default, this on-image annotation editor is
                    placed near the selected region.
                  </div>
                </div>

                <div class="value">
                  <select id="_via_settings.ui.image.on_image_annotation_editor_placement">
                    <option value="NEAR_REGION">close to selected region</option>
                    <option value="IMAGE_BOTTOM">at the bottom of image being annotated</option>
                    <option value="DISABLE">DISABLE on-image annotation editor</option>
                  </select>
                </div>
              </div>

              <div class="row" style="border:none;">
                <button onclick="settings_save()" value="save_settings" style="margin-top:2rem">Save</button>
                <button onclick="settings_panel_toggle()" value="cancel_settings" style="margin-left:2rem;">Cancel
                </button>
              </div>
            </div> <!-- end of settings panel -->

            <div id="page_404" class="display_area_content display_none narrow_page_content">
              <h2>Perspective Img Not Found</h2>
              <p>Filename: <span style="font-family:Mono;" id="page_404_filename"></span></p>
            </div> <!-- end of file not found panel -->

            <div id="page_start_info" class="display_area_content display_none narrow_page_content">
              <ul>
                <li>To start annotation, <span class="text_button" title="Load or Add Images"
                                               onclick="sel_local_images()">select images</span> (or, add images from
                  <span class="text_button"
                        title="Add images from a web URL (e.g. http://www.robots.ox.ac.uk/~vgg/software/via/images/swan.jpg)"
                        onclick="project_file_add_url_with_input()">URL</span> or <span class="text_button"
                                                                                        title="Add images using absolute path of file (e.g. /home/abhishek/image1.jpg)"
                                                                                        onclick="project_file_add_abs_path_with_input()">absolute path</span>)
                  and draw regions
                </li>
                <li>Use <span class="text_button" title="Toggle attributes editor panel"
                              onclick="toggle_attributes_editor()">attribute editor</span> to define attributes (e.g.
                  name) and <span class="text_button" title="Toggle annotations editor panel"
                                  onclick="annotation_editor_toggle_all_regions_editor()">annotation editor</span> to
                  describe each region (e.g. cat) using these attributes.
                </li>
                <li>Remember to <span class="text_button" onclick="project_save_with_confirm()">save</span> your project
                  before closing this application so that you can <span class="text_button"
                                                                        onclick="project_open_select_project_file()">load</span>
                  it later to continue annotation.
                </li>
                <li>For help, see the <span class="text_button"
                                            onclick="set_display_area_content(VIA_DISPLAY_AREA_CONTENT_NAME.PAGE_GETTING_STARTED)">Getting Started</span>
                  page and pre-loaded demo: <a href="http://www.robots.ox.ac.uk/~vgg/software/via/via_demo.html">image
                    annotation</a> and <a href="http://www.robots.ox.ac.uk/~vgg/software/via/via_face_demo.html">face
                    annotation</a>.
                </li>
              </ul>

            </div>

            <div id="page_getting_started" class="display_area_content display_none narrow_page_content">
              <p>A more detailed user guide (with screenshots and descriptions) is <a
                  href="http://www.robots.ox.ac.uk/~vgg/software/via/docs/user_guide.html">available here</a>.</p>
              <ol>
                <li><strong>Load Images</strong>: The first step is to load all the images that you wish to annotate.
                  There are multiple ways to add images to a VIA project. Choose the method that suits your use case.
                  <ul>
                    <li>Method 1: Selecting local files using browser's file selector
                      <ol>
                        <li>Click <span class="text_button" title="Load or Add Images"
                                        onclick="sel_local_images()"><code>Project &rarr; Add local files</code></span>
                        </li>
                        <li>Select desired images and click <code>Open</code></li>
                      </ol>
                    </li>
                    <li>Method 2: Adding files from URL or absolute path
                      <ol>
                        <li>Click <span class="text_button"
                                        title="Add images from a web URL (e.g. http://www.robots.ox.ac.uk/~vgg/software/via/images/swan.jpg)"
                                        onclick="project_file_add_url_with_input()"><code>Project &rarr; Add files from URL</code></span>
                        </li>
                        <li>Enter URL and click <code>OK</code></li>
                      </ol>
                    </li>
                    <li>Method 3: Adding files from list of url or absolute path stored in text file
                      <ol>
                        <li>Create a text file containing URL and absolute path (one per line)</li>
                        <li>Click <span class="text_button"
                                        title="Add images from a list of web url or absolute path stored in a text file (one url or path per line)"
                                        onclick="sel_local_data_file('files_url')"><code>Project &rarr; Add url or path from text file</code></span>
                        </li>
                        <li>Select the text file and click <code>Open</code></li>
                      </ol>
                    </li>
                  </ul>
                </li>
                <li><strong>Draw Regions</strong>: Select a region shape (<span class="text_button"
                                                                                onclick="select_region_shape('rect')">rectangle</span>,
                  <span class="text_button" onclick="select_region_shape('circle')">circle</span>, <span
                      class="text_button" onclick="select_region_shape('ellipse')">ellipse</span>, <span
                      class="text_button" onclick="select_region_shape('polygon')">polygon</span>, <span
                      class="text_button" onclick="select_region_shape('point')">point</span>, <span class="text_button"
                                                                                                     onclick="select_region_shape('polyline')">polyline</span>)
                  from the left sidebar and draw regions as follows:

                  <ul>
                    <li>Rectangle, Circle and Ellipse
                      <ul>
                        <li>Press left mouse button, drag mouse cursor and release mouse button.</li>
                        <li>To define a point inside an existing region, click inside the region to select it (if not
                          already selected), now press left mouse button, drag and release to draw region inside
                          existing region.
                        </li>
                        <li>To select, click inside the region. If the click point contains multiple regions, then
                          clicking multiple times at that location shuffles selection through those regions.
                        </li>
                      </ul>
                    </li>
                  </ul>

                  <ul>
                    <li>Point
                      <ul>
                        <li>Click to define points.</li>
                        <li>To draw a region inside existing region, click inside the region to select it (if not
                          already selected), now click again to define the point.
                        </li>
                        <li>To select, click on (or near) the existing point.</li>
                      </ul>
                    </li>
                  </ul>

                  <ul>
                    <li>Polygon and Polyline
                      <ul>
                        <li>Click to define vertices.</li>
                        <li>Press <strong>[Enter]</strong> to finish drawing the region or press [Esc] to cancel.</li>
                        <li>If the first vertex needs to be defined inside an existing region, click inside the region
                          to select it (if not already selected), now click again to define the vertex.
                        </li>
                        <li>To select, click inside the region. If the click point contains multiple regions, then
                          clicking multiple times at that location shuffles selection through those regions.
                        </li>
                      </ul>
                    </li>
                  </ul>
                </li>

                <li><strong>Create Annotations</strong>: For a more detailed description of this step, see <a
                    href="http://www.robots.ox.ac.uk/~vgg/software/via/docs/creating_annotations.html">Creating
                  Annotations : VIA User Guide</a>. Click the <span class="text_button"
                                                                    onclick="annotation_editor_toggle_all_regions_editor()"><code>View &rarr; Toggle attributes editor</code></span>
                  to show attributes editor panel in left sidebar and add the desired file or region attributes (e.g.
                  name). Now click <span class="text_button"
                                         onclick="annotation_editor_toggle_all_regions_editor()"><code>View &rarr; Toggle annotations editor</code></span>
                  to show the annotation editor panel in the bottom side. Update the annotations for each region.
                </li>
                <li><strong>Export Annotations</strong>: To export the annotations in json or csv format, click <span
                    class="text_button" onclick="download_all_region_data('csv')"><code>Annotation &rarr; Export annotations</code></span>
                  in top menubar.
                </li>
                <li><strong>Save Project</strong>: To save the project, click <span class="text_button"
                                                                                    onclick="project_save_with_confirm()"><code>Project &rarr; Save</code></span>
                  in top menubar.
                </li>
              </ol>
            </div>

            <div id="page_load_ongoing" class="display_area_content narrow_page_content" style="display: none">
              <div style="text-align:center">
                <a href="http://www.robots.ox.ac.uk/~vgg/software/via/">
                  <svg height="160" viewbox="0 0 400 160" style="background-color:#212121;">
                    <use xlink:href="#via_logo"></use>
                  </svg>
                </a>
                <div style="margin-top:4rem">Loading ...</div>
              </div>
            </div>

            <div id="page_about" class="display_area_content display_none" style="width:40rem !important">
              <div style="text-align:center">
                <a href="http://www.robots.ox.ac.uk/~vgg/software/via/">
                  <svg height="160" viewbox="0 0 400 160" style="background-color:#212121;">
                    <use xlink:href="#via_logo"></use>
                  </svg>
                </a>
              </div>
              <p style="font-family:mono; font-size:0.8em;text-align:center;"><a
                  href="https://gitlab.com/vgg/via/blob/master/CHANGELOG">Version 2.0.8</a></p>
            </div> <!-- end of page_about -->

            <div id="page_license" class="display_area_content display_none narrow_page_content">
            </div>
          </div> <!-- end of display_area -->
        </div> <!-- end of middle_panel -->

        <!-- this vertical spacer is needed to allow scrollbar to show
             items like Keyboard Shortcut hidden under the attributes panel -->
        <div style="width: 100%;" id="vertical_space"></div>

      </div>
      <div class="index-container"></div>
    </div>
    <div class="right-container" style="width: 190px; background: #FFF">
      <div class="control-menu"><input input type="checkbox" id="toggleRegion"><label class="tip">仅通过区域名切换热区</label>
      </div>
      <!-- layer容器 -->
      <div class="layer-inputs">
      </div>
      <div class="col-md-12 text-center" style="padding-top: 20px;padding-bottom: 20px;">
      <#--<保存按钮在默认情况下是不pageAdd可以点击的>-->
        <button id="saveAndNextButton" style="min-width: 130px" disabled="disabled" type="button"
                class="btn btn-primary">保存书页
        </button>
      </div>
    </div>


    <div id="voiceManager" class="row create-page-form-2" style="width: 1200px;">
      <div class="col-md-12">
        <ul class="nav nav-tabs">
          <li role="presentation" index="0" class="voiceTabItem active"><a href="#">语音</a></li>
          <li class="voiceTabItem" index="1" role="presentation"><a href="#">背景音乐</a></li>
          <li class="voiceTabItem" index="2" role="presentation"><a href="#">音效</a></li>
          <li class="voiceTabItem no-play-bar" index="3" role="presentation"><a href="#">Extra Data</a></li>
          <li class="voiceTabItem no-play-bar" index="4" role="presentation"><a href="#">文本</a></li>
          <@checkPrivilege url="/vitrual/cms/addPageVideo.do">
            <li class="voiceTabItem no-play-bar" index="5" role="presentation"><a href="#">视频链接</a></li>
          </@checkPrivilege>
        </ul>
        <audio id="mp3Player" style="display:none" autoplay="autoplay">
          <source src=""></source>
        </audio>
        <div id="tab_0_content" class="row voice-panel">
          <ul>
            <li class="new-item">
              <div class="row voice-item">
                <div class="col-md-5">
                  <div id="addNewVoiceBtn" class="button" style="display:
                  <@checkPrivilege url = "/virtual/bookEditor/editFinger.do" def="none">block</@checkPrivilege>
                      ;">
                    &nbsp;
                    <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
                    <span> &nbsp;&nbsp;添加新语音...</span>
                  </div>
                </div>
                <div class="col-md-7 time-setup-container">
                  &nbsp;
                </div>
              </div>
            </li>
            <li id="voiceItemTemplate" style="display:none">
              <div class="row voice-item">
                <span class="label label-info" id="voiceType"
                      style="display: inline-block;float: left;width: 65px;margin-top: 8px;margin-left: -3px;margin-right: 16px;font-weight: normal;font-size: 90%;display: none">信息标签</span>
                <div style="display: inline-block" id="rowIndex" class="col-md-1">&nbsp;</div>
                <div class="col-md-5" style="display: inline-block;width: 35%">
                                    <span id="playBtn" class="glyphicon glyphicon-volume-up"
                                          aria-hidden="true">&nbsp;</span>
                  <img id="playingIcon" src="static/images/soundplaying.gif"
                       style="display:none;width: 14px;height: 14px">
                  <span id="fileName"> 编辑中...</span>
                  <span id="editBtn" class="glyphicon glyphicon-edit" aria-hidden="true" style="display:
                  <@checkPrivilege url = "/virtual/bookEditor/editFinger.do" def="none">inline-block</@checkPrivilege>
                      ;"></span>
                </div>
                <div class="col-md-4 time-setup-container0" style="display: inline-block;width: 31%">
                  <h5>与上一条语音的间隔(秒)</h5>
                  <input type="text" class="form-control" style="width:70px" value="0.70"
                          <@checkPrivilege url = "/virtual/bookEditor/editFinger.do" def="disabled='disabled'"></@checkPrivilege>
                         id="intervalTime" placeholder="0.00">
                  <input type="text" style="display: none" value="0.00" id="startAt"
                         placeholder="0.00">
                </div>
                <div id="durationContainer" class="col-md-1" style="display: inline-block">&nbsp;</div>
                <div class="col-md-1  text-right delete-button" style="display: inline-block;width:7%">&nbsp;
                <#--判断有没有书页的编辑权限，如果有权限，才会有删除音频的权限-->
                    <@checkPrivilege url = "/virtual/bookEditor/editFinger.do">
                      <span id="deleteButton" class="glyphicon glyphicon-remove-sign" aria-hidden="true"
                            style="display:none"></span>
                    </@checkPrivilege>
                </div>
              </div>
            </li>
          </ul>


        </div>

        <div id="tab_1_content" class="row voice-panel" style="display:none">
          <ul>
            <li class="new-item">
              <div class="row voice-item">
                <div class="col-md-5">
                  <div id="addNewVoiceBtn"
                       class="button" style="width: 185px;display:
                  <@checkPrivilege url = "/virtual/bookEditor/editFinger.do" def="none">block</@checkPrivilege>
                      ;">
                    &nbsp;
                    <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
                    <span> &nbsp;&nbsp;添加新背景音乐...</span>
                  </div>
                </div>
                <div class="col-md-7 time-setup-container">
                  &nbsp;
                </div>
              </div>
            </li>
            <li id="voiceItemTemplate" style="display:none">
              <div class="row voice-item">
                <div id="rowIndex" class="col-md-1" style="display: inline-block">&nbsp;</div>
                <div style="display: inline-block" class="col-md-4">
                                    <span id="playBtn" class="glyphicon glyphicon-volume-up"
                                          aria-hidden="true">&nbsp;</span>
                  <img id="playingIcon" src="static/images/soundplaying.gif"
                       style="display:none;width: 14px;height: 14px">
                  <span id="fileName"> 编辑中...</span>
                  <span id="editBtn" class="glyphicon glyphicon-edit" aria-hidden="true" style="display:
                  <@checkPrivilege url = "/virtual/bookEditor/editFinger.do" def="none">inline-block</@checkPrivilege>
                      ;"></span>
                </div>
                <div style="display: inline-block" class="col-md-3 time-setup-container">
                  <input type="text" class="form-control" value="0.00" style="width:70px;margin-top: 0px" id="startAt"
                          <@checkPrivilege url = "/virtual/bookEditor/editFinger.do" def="disabled='disabled'"></@checkPrivilege>
                         placeholder="0.00"><h5 style="margin-top: 8px">秒开始播放</h5>
                </div>
                <div style="display: inline-block" class="col-md-2 time-setup-container">
                  <input type="checkbox" id="loop" checked style="margin-top: 8px !important;"><h5
                    style="margin-top: 8px">循环播放</h5>
                </div>
                <div style="display: inline-block" id="durationContainer" class="col-md-1">&nbsp;</div>
                <div style="display: inline-block" class="col-md-1  text-right delete-button">&nbsp;
                <#--判断有没有书页的编辑权限，如果有权限，才会有删除音频的权限-->
                    <@checkPrivilege url = "/virtual/bookEditor/editFinger.do">
                      <span id="deleteButton" class="glyphicon glyphicon-remove-sign" aria-hidden="true"
                            style="display:none"></span>
                    </@checkPrivilege>
                </div>
              </div>
            </li>
          </ul>
        </div>

        <div id="tab_2_content" class="row voice-panel" style="display:none">
          <ul>
            <li class="new-item">
              <div class="row voice-item">
                <div class="col-md-5">
                  <div id="addNewVoiceBtn" class="button" style="display:
                  <@checkPrivilege url = "/virtual/bookEditor/editFinger.do" def="none">block</@checkPrivilege>
                      ;">
                    &nbsp;
                    <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
                    <span> &nbsp;&nbsp;添加新音效...</span>
                  </div>
                </div>
                <div class="col-md-7 time-setup-container">
                  &nbsp;
                </div>
              </div>
            </li>
            <li id="voiceItemTemplate" style="display:none">
              <div class="row voice-item">
                <div style="display: inline-block" id="rowIndex" class="col-md-1">&nbsp;</div>
                <div style="display: inline-block" class="col-md-5">
                                    <span id="playBtn" class="glyphicon glyphicon-volume-up"
                                          aria-hidden="true">&nbsp;</span>
                  <img id="playingIcon" src="static/images/soundplaying.gif"
                       style="display:none;width: 14px;height: 14px">
                  <span id="fileName"> 编辑中...</span>
                  <span id="editBtn" class="glyphicon glyphicon-edit" aria-hidden="true" style="display:
                  <@checkPrivilege url = "/virtual/bookEditor/editFinger.do" def="none">inline-block</@checkPrivilege>
                      ;"></span>
                </div>
                <div style="display: inline-block" class="col-md-4 time-setup-container">
                  <input type="text" class="form-control" style="width:70px" value="0.00" id="startAt"
                         placeholder="0.00"
                          <@checkPrivilege url = "/virtual/bookEditor/editFinger.do" def="disabled='disabled'"></@checkPrivilege>
                  ><h5>秒开始播放</h5>
                </div>
                <div style="display: inline-block" id="durationContainer" class="col-md-1">&nbsp;</div>
                <div style="display: inline-block" class="col-md-1  text-right delete-button">&nbsp;
                <#--判断有没有书页的编辑权限，如果有权限，才会有删除音频的权限-->
                    <@checkPrivilege url = "/virtual/bookEditor/editFinger.do">
                      <span id="deleteButton" class="glyphicon glyphicon-remove-sign" aria-hidden="true"
                            style="display:none"></span>
                    </@checkPrivilege>
                </div>
              </div>
            </li>
          </ul>
        </div>
        <div id="tab_3_content" class="row voice-panel" style="display:none">
        <#--添加extra-data-->
          <div id="extra-data">
          <#--            <div class="extr-data-title">-->
          <#--              Extra Data:-->
          <#--              <button class="control-extra">-->
          <#--                <span id="symbol" class="	glyphicon glyphicon-plus"></span>-->
          <#--              </button>-->
          <#--            </div>-->
            <div class="panel-body">
        <textarea
             <@checkPrivilege url="/virtual/books/editExtraData.do" def = "disabled = 'disabled'">
             </@checkPrivilege>
            id="extraDataText" placeholder="请输入扩展数据" style="overflow-y: auto;resize: none"></textarea>
            </div>
          </div>
        </div>
        <div id="tab_4_content" class="row voice-panel" style="display:none">
            <#--添加extra-data-->
          <div id="extra-data" class="eval-text">
              <#--            <div class="extr-data-title">-->
              <#--              Extra Data:-->
              <#--              <button class="control-extra">-->
              <#--                <span id="symbol" class="	glyphicon glyphicon-plus"></span>-->
              <#--              </button>-->
              <#--            </div>-->
            <div class="panel-body">
        <textarea
<#--             <@checkPrivilege url="/virtual/books/editExtraData.do" def = "disabled = 'disabled'">-->
<#--             </@checkPrivilege>-->
            id="evalText" placeholder="请输入文本" style="overflow-y: auto;resize: none" maxlength="256"></textarea>
            </div>
          </div>
        </div>
        <div id="tab_5_content" class="row voice-panel" style="display:none">
          <#--video-data-->
          <div id="video-data" class="video-text">
            <div class="panel-body">
              <textarea id="videoText" placeholder="请填写视频链接地址" style="overflow-y: auto;resize: none" maxlength="256"></textarea>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="voice-progress-bar row create-page-form-3" style="width: 1200px">
      <div class="col-md-12 text-center">
        <div class="voice-test">
          <div class="voice-test-progress">
            <span>试听</span>
            <span id="voice-test-btn" class="voice-test-btn glyphicon glyphicon-play"></span>
            <span id="voice-test-btn-stop" class="voice-test-btn-stop glyphicon glyphicon-stop"></span>
            <span class="voice-test-start"></span>
            <div class="voice-test-progress-bar">
              <div class="voice-test-now"></div>
            </div>
            <span class="voice-test-end"></span>
          </div>
          <div id="examineBtn" style="display: none">
            <div id="examineSuccess" class="col-md-1" style="height: 66%; margin-left: 67%">
              <button id="examineSuccessBtn"
                      style="bottom:0px;position: absolute;min-width: 130px;margin-left: 3px;padding-top: 7px"
                      type="button"
                      class="btn btn-primary" disabled="true">审核通过
              </button>
            </div>
            <div id="examineFail" class="col-md-1" style=" height: 100%;">
              <button id="examineFailBtn"
                      style="bottom:0px;position: absolute;min-width: 130px ;margin-left: 77px;padding-top: 7px"
                      type="button"
                      class="btn btn-primary" disabled="true">审核不通过
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div style="height: 50px; width: 100%;"></div>


  </div>

</div>

<#include "addPage_voiceEditor.ftl"/>
<#include "batch_finger_upload.ftl"/>

<script>
  $(function () {
    wantong.cms.pageAdd.init({
      bookId: '${bookId}',
      baseBookId: '${baseBookId}',
      examine: '${examine}',
      bookExamine: '${bookExamine}',
      partnerId: '${partnerId}',
      ttsRoles: $.parseJSON('${ttsRole}'),
      moduleValue: '${moduleValue}',
      bookState: '${bookState}',
      repoId: '${repoId}'
    });
  });
</script>
<style>
  .click_disabled{
    pointer-events:none;
  }
  .extr-data-title {
    font-weight: bold;
    margin-top: 10px;
    margin-left: 6px;
  }

  .control-extra {
    background-color: #fff;
    border: 1px solid #42bcef;
    width: 17px;
    border-width: 1px;
    height: 17px;
  }

  #extraDataText {
    overflow-y: auto;
    resize: none;
    height: 70px;
    width: 100%;
    line-height: 1;
    font-size: 14px;
    letter-spacing: 2px;
    padding: 5px;
  }

  #symbol {
    color: #42bcef;
    font-size: 9px;
    margin-left: 1px;
    margin-top: -3px;
  }

  .no-click {
    pointer-events: none;
  }

  .frame-resize-btn .resize {
    float: left;
    height: 100%;
  }

  .frame-resize-btn .resize img {
    margin-top: 10px;
    cursor: pointer;
  }

  .frame-resize-btn .resize-right {
    margin-left: 20px;
  }

  #voiceManager .nav-tabs {
    background: rgba(51, 51, 51, .2);
  }

  #voiceManager {
    background: #FFF;
  }

  .layui-layer-tips {
    left: 170px!important;
    top: 47px!important;
  }

  .noselect {
    -webkit-touch-callout: none; /* iOS Safari */
    -webkit-user-select: none; /* Chrome/Safari/Opera */
    -khtml-user-select: none; /* Konqueror */
    -moz-user-select: none; /* Firefox */
    -ms-user-select: none; /* Internet Explorer/Edge */
    user-select: none; /* Non-prefixed version, currently
    not supported by any browser */
  }

  #videoText {
    line-height: 1;
    font-size: 14px;
    letter-spacing: 2px;
    padding: 5px;
  }

  #evalText {
    line-height: 1;
    font-size: 14px;
    letter-spacing: 2px;
    padding: 5px;
  }
  .switch-btn{
    margin-top: 10px;
    float: left;
    margin-left: 22%;
  }
  .switch-btn li{
    float: left;
    margin-left: 2px;
    line-height: 25px;
  }
  .switch{
    background: #e9f6fe;
    color: #b1b2b3;
    padding: 0 10px;
  }
  #switchFrame{
    float: left;
    margin-left: 22%;
    width: 20%;
    height: 30px;
  }
  .switch-btn .active{
    background: #18b0e7;
    color: #FFF;
  }

  .layer-name{
    padding: 5px 3px;
    border-radius: 5px;
    border: 1px solid;
    width: 100px;
    margin: 10px auto;
  }

  @media screen and (max-width: 1920px) {
    #switchToViewButton {
      margin-left:25%!important;
    }
    .message-class{
      margin-left: 81%!important;
    }
    #switchToEditorButton{
      margin-left: 25%!important;
    }
  }
  @media screen and (max-width: 1600px) {
    #switchToViewButton {
      margin-left:21%!important;
    }
    .message-class{
      margin-left: 78%!important;
    }
    #switchToEditorButton{
      margin-left: 20%!important;
    }
  }

  @media screen and (max-width: 1440px) {
    #switchToViewButton {
      margin-left:16%!important;
    }
    .message-class{
      margin-left: 74%!important;
    }
    #switchToEditorButton{
      margin-left: 15%!important;
    }
  }

  @media screen and (max-width: 1366px) {
    #switchToViewButton {
      margin-left:15%!important;
    }
    #switchToEditorButton{
      margin-left: 14%!important;
    }
  }
</style>