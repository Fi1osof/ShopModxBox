{*
    Базовый шаблон сайта.
    Расширить можно в любом другом шаблоне просто прописав в начале файла {extends file="layout.tpl"}
    Статьи по modxSmarty: http://modxclub.ru/tag/modxSmarty/
*}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    {* bootstrap meta *}
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    {* eof bootstrap meta *}
    
    {* Заголовок специально в блок загнан, чтобы в разных шаблонах его можно было бы переопределить *}
    <title>{block name="title"}{field name=pagetitle} | {config name=site_name}{/block}</title>
    {snippet name="MetaX@MetaX"}
    
    <link href="{$template_url}css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    
    {* bootstrap *}
    <link href="{$template_url}libs/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="{$template_url}libs/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="{$template_url}libs/bootstrap/js/bootstrap.min.js"></script>
    {* eof bootstrap *}
    
    {* less *}
    <link href="{$template_url}css/styles.less" rel="stylesheet/less" type="text/css" />
    <script type="text/javascript" src="{$template_url}libs/less/js/less-1.3.3.min.js"></script>
    {* eof less *}

    {* jGrowl *}
    <link href="{$template_url}libs/jgrowl/jquery.jgrowl.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="{$template_url}libs/jgrowl/jquery.jgrowl.js"></script>
    {* eof jGrowl *}
    
    {* placeholeder.js *}
    <script type="text/javascript" src="{$template_url}libs/placeholder/placeholder.js"></script>
    {* eof placeholeder.js *}
    
    {* custom scripts *}
    <script type="text/javascript" src="{$template_url}js/f.js"></script>
    <script type="text/javascript" src="{$template_url}js/shopmodx.js"></script>
    <script type="text/javascript" src="{$template_url}js/modules/informer.module.js"></script>
    <script type="text/javascript" src="{$template_url}js/modules/callback.module.js"></script>
    <script type="text/javascript" src="{$template_url}js/modules/request.module.js"></script>
    
    <script type="text/javascript" src="{$template_url}js/modules/shopmodx._callback.module.js"></script>
    <script type="text/javascript" src="{$template_url}js/modules/shopmodx.callback.module.js"></script>
    <script type="text/javascript" src="{$template_url}js/modules/shopmodx.request.module.js"></script>
    <script type="text/javascript" src="{$template_url}js/modules/shopmodx.informer.module.js"></script>
    
    <script type="text/javascript" src="{$template_url}js/widgets/shopmodx._product.widget.js"></script>
    <script type="text/javascript" src="{$template_url}js/widgets/shopmodx._basket.widget.js"></script>
    <script type="text/javascript" src="{$template_url}js/widgets/shopmodx._order.widget.js"></script>
    <script type="text/javascript" src="{$template_url}js/widgets/shopmodx.product.widget.js"></script>
    <script type="text/javascript" src="{$template_url}js/widgets/shopmodx.basket.widget.js"></script>
    <script type="text/javascript" src="{$template_url}js/widgets/shopmodx.order.widget.js"></script>
    
    <script type="text/javascript" src="{$template_url}js/events.js"></script>
    <script type="text/javascript" src="{$template_url}js/initialization.js"></script>
    {* eof custom scripts *}
    
    {* fonts *}
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400,300&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
    {* eof fonts *}
    
    {block name=headers}{/block}
    
</head>

{* Разметка сетки отделена от разметки функц. блоков. Тем самым наш контент не привязан к сетке. Добавлены только теги header и footer. *}

<body>
    <div class="container-fluid">
        <header>    
            <div class="row-fluid">
                <div class="span2">
                    
                    {assign var="surl" value='123'}
                    
                    {$url}
                    
                    <div class="logo">
                        <a href="{config name=site_url}" title="{config name=site_name}"></a>
                    </div>
                    
                </div>
                <div class="span2 offset6">
                
                    [[!smarty?tpl=`inc/login/auth.tpl`]]
                    
                </div>
                <div class="span2">
                    
                    [[!smarty?tpl=`shop/basket/entity/index.tpl`]]
                    
                </div>
            </div>
            <div class="row-fluid">
                <div class="span12">
                    
                    <div class="mainmenu">
                        {* 
                            @MainMenu - это набор параметров 
                            Подробная статья: http://modxclub.ru/blog/102.html
                        *}
                        {snippet name="Wayfinder@MainMenu"}
                    </div>   
                    
                </div>            
            </div>
        </header>
        <div class="row-fluid">
            <div class="span12">
                
                <div class="content">
                    {block name=pagetitle}
                        <h1>{if $modx->resource->longtitle}{$modx->resource->longtitle}{else}{$modx->resource->pagetitle}{/if}</h1>
                    {/block}
                    
                    {block name=Breadcrumbs}
                        {snippet name="Breadcrumbs@Breadcrumbs"}
                    {/block}
                    
                    {block name=content}
                        {field name=content}
                    {/block}                
                </div> 
                
            </div>            
        </div>
        <footer>
            <div class="row-fluid">
                <div class="span3 offset9">
                    
                    <div class="copy pull-right">
                        {*
                            Если вы создаете магазин на базе этой сборки или просто на базе shopModx,
                            пожалуйста, сохраняйте эти копирайты на сайте.
                            Наличие активных копирайтов на сайте гарантирует вам приоритетные ответы
                            на ваши вопросы по MODX Revolution и нашим модулям на сайте modxclub.ru,
                            а так же очищает вашу совесть и ставит жирный плюс в карму ;-)
                        *}
                        <a href="http://modxclub.ru" title="Клуб MODX-экспертов"><img src="{config name=assets_url}images/site/logos/modx_h30.jpg" /></a>
                        <a href="http://shopmodx.ru" class="powby" title="ShopModx. Модуль для разработки интернет-магазинов на MODX Revolution"><img src="{$template_url}img/poweredby1.png" /></a></a>
                    </div>
                    
                </div>                
            </div>        
        </footer>
    </div>

{* 
    modals 
    Модальное окно чисто для всплывашки. Проверка авторизации выше.
*}

[[!smarty?tpl=`inc/modals/login.tpl`]]
{block name=bs-modals}{/block}

{literal}
<!-- Yandex.Metrika counter --><script type="text/javascript">(function (d, w, c) { (w[c] = w[c] || []).push(function() { try { w.yaCounter22399783 = new Ya.Metrika({id:22399783, webvisor:true, clickmap:true, trackLinks:true, accurateTrackBounce:true}); } catch(e) { } }); var n = d.getElementsByTagName("script")[0], s = d.createElement("script"), f = function () { n.parentNode.insertBefore(s, n); }; s.type = "text/javascript"; s.async = true; s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js"; if (w.opera == "[object Opera]") { d.addEventListener("DOMContentLoaded", f, false); } else { f(); } })(document, window, "yandex_metrika_callbacks");</script><noscript><div><img src="//mc.yandex.ru/watch/22399783" style="position:absolute; left:-9999px;" alt="" /></div></noscript><!-- /Yandex.Metrika counter -->
{/literal}

{block name=footers}{/block}
</body>
</html>