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
//echo $_SERVER['REMOTE_ADDR'];

HtmlEditorConfig::get('cms')->insertButtonsBefore(
    'styleselect',
    'removeformat'
);


/* Paste as Plain Text By Default */
HtmlEditorConfig::get('cms')->setOption('paste_text_sticky',true);
HtmlEditorConfig::get('cms')->setOption('paste_text_sticky_default',true);
Director::set_environment_type("dev");


FulltextSearchable::enable();