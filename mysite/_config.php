<?php

global $project;
$project = 'mysite';

global $database;
$database = 'afterclass';
 
// Use _ss_environment.php file for configuration
require_once("conf/ConfigureFromEnv.php");

// This line set's the current theme. More themes can be
// downloaded from http://www.silverstripe.org/themes/
//SSViewer::set_theme('blackcandy');

// Set the site locale
i18n::set_locale('en_US');

// enable nested URLs for this site (e.g. page/sub-page/)
SiteTree::enable_nested_urls();
Object::add_extension("SiteTree", "FilesystemPublisher('cache/', 'html')");

//echo $_SERVER['REMOTE_ADDR'];

HtmlEditorConfig::get('cms')->insertButtonsBefore(
    'styleselect',
    'removeformat'
);

Requirements::set_force_js_to_bottom(true);
/* Paste as Plain Text By Default */
HtmlEditorConfig::get('cms')->setOption('paste_text_sticky',true);
HtmlEditorConfig::get('cms')->setOption('paste_text_sticky_default',true);

FulltextSearchable::enable();

if(Director::isLive()) {

	Director::forceSSL(array('/^Security/'));
	Config::inst()->update('FilesystemPublisher', 'static_base_url', 'https://afterclass.uiowa.edu/');
}elseif(Director::isDev()){
	Config::inst()->update('FilesystemPublisher', 'static_base_url', 'http://localhost:8888/after-class/');
}
