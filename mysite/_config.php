<?php

use SilverStripe\i18n\i18n;
use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\View\Requirements;
use SilverStripe\ORM\Search\FulltextSearchable;
use SilverStripe\Core\Config\Config;
use SilverStripe\Control\Director;
use SilverStripe\Security\MemberAuthenticator\MemberAuthenticator;
use SilverStripe\Security\Authenticator;
use SilverStripe\Security\PasswordValidator;
use SilverStripe\Security\Member;
use SilverStripe\Admin\LeftAndMain;
// remove PasswordValidator for SilverStripe 5.0
$validator = new PasswordValidator();

$validator->minLength(8);
$validator->checkHistoricalPasswords(6);
Member::set_password_validator($validator);
LeftAndMain::add_extension('CustomLeftAndMain');