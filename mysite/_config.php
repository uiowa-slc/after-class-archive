<?php

global $project;
$project = 'mysite';

global $databaseConfig;
$databaseConfig = array(
	"type" => 'MySQLDatabase',
	"server" => 'localhost:3306',
	"username" => 'root',
	"password" => 'root',
	"database" => 'afterclass_dev',
	"path" => '',
);

MySQLDatabase::set_connection_charset('utf8');

// This line set's the current theme. More themes can be
// downloaded from http://www.silverstripe.org/themes/
SSViewer::set_theme('blackcandy');

// Set the site locale
i18n::set_locale('en_US');

// enable nested URLs for this site (e.g. page/sub-page/)
SiteTree::enable_nested_urls();
Director::set_environment_type("dev");
FulltextSearchable::enable();
ShortcodeParser::get()->register('NewsletterForm',array('Page','NewsletterFormShortCodeHandler'));

RecaptchaField::$public_api_key = '6LccTc0SAAAAAAqBZU-iluU2VJCJQTDRuA4-fu-F';
RecaptchaField::$private_api_key = '6LccTc0SAAAAACK9l57g1HtUwOX6dexh1OP5VjFO';

SpamProtectorManager::set_spam_protector('RecaptchaProtector');

//$recaptchaField = new RecaptchaField('MyCaptcha');
//$recaptchaField->jsOptions = array('theme' => 'clean'); // optional

Object::add_extension('CMSMain', 'CMSActionDecorator');
PixlrEditorField::$use_credentials = true;