
<nav class="navi">
    <ul class="glo_navi">
        <li><a href="<!--{$smarty.const.TOP_URLPATH}-->"><img
                src="<!--{$TPL_URLPATH}-->img/page/navi/btn_top.png" onmouseover="$(this).attr('src','<!--{$TPL_URLPATH}-->img/page/navi/btn_top_on.png')" onmouseout="$(this).attr('src','<!--{$TPL_URLPATH}-->img/page/navi/btn_top.png')" 
                width="123" height="51" alt="トップ" /> </a></li>
        <li><a
            href="<!--{$smarty.const.TOP_URLPATH}-->order/index.php"><img
                src="<!--{$TPL_URLPATH}-->img/page/navi/btn_guide.png"
                width="122" height="51" alt="ガイド" /> </a></li>
        <li><a href="<!--{$smarty.const.TOP_URLPATH}-->abouts/index.php"><img
                src="<!--{$TPL_URLPATH}-->img/page/navi/btn_company.png"
                width="122" height="51" alt="会社概要" /> </a></li>
        <li><a
            href="<!--{$smarty.const.TOP_URLPATH}-->products/list.php"><img
                src="<!--{$TPL_URLPATH}-->img/page/navi/btn_item.png"
                width="122" height="51" alt="商品一覧" /> </a></li>
        <li><a href="<!--{$smarty.const.TOP_URLPATH}-->mypage/"><img
                src="<!--{$TPL_URLPATH}-->img/page/navi/btn_mypage.png"
                width="122" height="51" alt="マイページ" /> </a></li>
        <li class="regist"><a
            href="<!--{$smarty.const.TOP_URLPATH}-->entry/kiyaku.php"><img
                src="<!--{$TPL_URLPATH}-->img/page/navi/btn_regist.png"
                width="122" height="51" alt="会員登録" /> </a></li>
        <!--{*
        <li class="login"><a
            href="<!--{$smarty.const.TOP_URLPATH}-->mypage/login.php"><img
                src="<!--{$TPL_URLPATH}-->img/page/navi/btn_login.png"
                width="225" height="51" alt="ログイン" /> </a></li>
                *}-->
         <li class="login"><!--{if $smarty.session.customer.customer_id}-->
              <form name="header_login_form" id="header_login_form" method="post" action="<!--{$smarty.const.HTTPS_URL}-->frontparts/login_check.php" onsubmit="return fnCheckLogin('login_form')">
                <input type="hidden" name="mode" value="login" />
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                <input type="hidden" name="url" value="<!--{$smarty.server.PHP_SELF|escape}-->" />
              </form>
              <a href="<!--{$smarty.const.HTTP_URL}-->" onclick="fnFormModeSubmit('header_login_form', 'logout', '', ''); return false;"><img src="<!--{$TPL_URLPATH}-->img/page/navi/btn_logout.png" alt="ログアウト" width="225" height="51" /></a>
            <!--{else}-->
              <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/login.php"><img src="<!--{$TPL_URLPATH}-->img/page/navi/btn_login.png" alt="ログイン" width="225" height="51" /></a>
            <!--{/if}--></li>
    </ul>
</nav>
