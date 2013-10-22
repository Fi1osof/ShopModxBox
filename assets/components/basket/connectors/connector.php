<?php
$_REQUEST['ctx'] = 'web';
    
require_once dirname(dirname(dirname(dirname(dirname(__FILE__))))).'/connectors/index.php';

$_SERVER['HTTP_MODAUTH']= $modx->user->getUserToken($modx->context->get('key'));
 
$location = '';

/* handle request */
if(!$path = $modx->getOption('basket.core_path')){
    $path = $modx->getOption('core_path').'components/basket/';
}
$path .=  'processors/';


$_REQUEST['basket_action'] = $_POST['basket_action'] = (!empty($_REQUEST['action']) ? $_REQUEST['action'] : '');

$modx->request->handleRequest(array(
    'processors_path' => $path,
    'location'  => $location,
    'action'    => 'basket/web/public/action',
));