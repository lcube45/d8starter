<?php

// get default environment variable
if(getenv('APP_ENVIRONMENT')){
    $environment = getenv('APP_ENVIRONMENT');
} else {
    $environment = 'dev';
}

// generic settings variables
$settings['hash_salt'] = file_get_contents('../salt.txt');
$settings['file_scan_ignore_directories'] = ['node_modules', 'bower_components'];
$settings['entity_update_batch_size'] = 50;
$settings['custom_translations_directory'] = '../translations';
$settings['update_free_access'] = FALSE;
$settings['rebuild_access'] = FALSE;
$settings['skip_permissions_hardening'] = TRUE;
$settings['file_private_path'] = DRUPAL_ROOT . '/sites/default/files/private';

// config folder
$config_directories['sync'] = '../config/sync';

// check if environment settings file is here
if (file_exists($app_root . '/' . $site_path . '/settings.' . $environment . '.php')) {
    include $app_root . '/' . $site_path . '/settings.' . $environment . '.php';
}
