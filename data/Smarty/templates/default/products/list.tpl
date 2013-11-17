<!--{*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2013 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *}-->

<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/products.js"></script>
<script type="text/javascript">//<![CDATA[
    function fnSetClassCategories(form, classcat_id2_selected) {
        var $form = $(form);
        var product_id = $form.find('input[name=product_id]').val();
        var $sele1 = $form.find('select[name=classcategory_id1]');
        var $sele2 = $form.find('select[name=classcategory_id2]');
        setClassCategories($form, product_id, $sele1, $sele2, classcat_id2_selected);
    }
    // 並び順を変更
    function fnChangeOrderby(orderby) {
        fnSetVal('orderby', orderby);
        fnSetVal('pageno', 1);
        fnSubmit();
    }
    // 表示件数を変更
    function fnChangeDispNumber(dispNumber) {
        fnSetVal('disp_number', dispNumber);
        fnSetVal('pageno', 1);
        fnSubmit();
    }
    // カゴに入れる
    function fnInCart(productForm) {
        var searchForm = $("#form1");
        var cartForm = $(productForm);
        // 検索条件を引き継ぐ
        var hiddenValues = ['mode','category_id','maker_id','name','orderby','disp_number','pageno','rnd'];
        $.each(hiddenValues, function(){
            // 商品別のフォームに検索条件の値があれば上書き
            if (cartForm.has('input[name='+this+']').length != 0) {
                cartForm.find('input[name='+this+']').val(searchForm.find('input[name='+this+']').val());
            }
            // なければ追加
            else {
                cartForm.append($('<input type="hidden" />').attr("name", this).val(searchForm.find('input[name='+this+']').val()));
            }
        });
        // 商品別のフォームを送信
        cartForm.submit();
    }
//]]></script>

<div id="undercolumn">
    <form name="form1" id="form1" method="get" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="<!--{$mode|h}-->" />
        <!--{* ▼検索条件 *}-->
        <input type="hidden" name="category_id" value="<!--{$arrSearchData.category_id|h}-->" />
        <input type="hidden" name="maker_id" value="<!--{$arrSearchData.maker_id|h}-->" />
        <input type="hidden" name="name" value="<!--{$arrSearchData.name|h}-->" />
        <!--{* ▲検索条件 *}-->
        <!--{* ▼ページナビ関連 *}-->
        <input type="hidden" name="orderby" value="<!--{$orderby|h}-->" />
        <input type="hidden" name="disp_number" value="<!--{$disp_number|h}-->" />
        <input type="hidden" name="pageno" value="<!--{$tpl_pageno|h}-->" />
        <!--{* ▲ページナビ関連 *}-->
        <input type="hidden" name="rnd" value="<!--{$tpl_rnd|h}-->" />
    </form>

      <!-- ▼一覧画面 -->
      <h2 class="title">食事用品</h2>
      
      <section class="sub_category">
      	<h2>食事用品 カテゴリー</h2>
        <ul>
        	<li><a href="#">介護職・嚥下補助</a></li>
        	<li><a href="#">自助具(薬関係)</a></li>
        	<li><a href="#">食事用エプロン</a></li>
        	<li><a href="#">口</a></li>
        	<li><a href="#">衛生用品</a></li>
        </ul>
      </section>
      
      <section class="osusume_point_box">
      	<div class="img"><img src="<!--{$TPL_URLPATH}-->img/page/list/osusumepoint/img_01.png" width="111" height="111" /></div>
        <h3><img src="<!--{$TPL_URLPATH}-->img/page/list/osusumepoint/title.png" width="293" height="19" alt="オススメポイント" /></h3>
        <p>テキストテキスト</p>
        <div class="clear"></div>
      </section>
      
      <section class="osusume_shouhin_box pure-g">
      	<h2><img src="<!--{$TPL_URLPATH}-->img/page/list/osusumeshouhin/title.png" width="742" height="48" alt="コンシェルジュオオススメ商品" /></h2>
        
        <div class="box">
       	  <div class="pure-u-1-2"><img src="<!--{$TPL_URLPATH}-->img/page/list/osusumeshouhin/main_img.png" width="300" height="300" /></div>
          <div class="pure-u-1-2">
          	<h5>No.B0779</h5>
          	<h3>オススメキャッチコピー</h3>
            <p class="icon"><img src="<!--{$TPL_URLPATH}-->img/page/list/osusumeshouhin/icon_01.png" width="64" height="18" alt="new" /></p>
            <p>スメキスメキ</p>
            <p>スメキスメ \16,500(税込)キスメキ</p>
            <div class="btn">
            <p>お得な価格は会員のみ公開</p>
            <a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/osusumeshouhin/btn_regist.png" width="308" height="44" alt="会員登録" /></a></div>
          </div>
        </div>
      </section>
      
      <div class="product_list_box pure-form pure-form-stacked">
        <div class="paginator_box">
          <section class="sort_box pure-g">
                <span class="count pure-u-2-5">000件の商品がございます。</span>
                <span class="sort pure-u-2-5"><a href="#">価格が安い順</a> | <a href="#">価格が高い順</a> | <a href="#">新着順</a></span>
              <span class="page_max">表示件数<select class=""> </select></span>
          </section>
            <section class="paging pure-paginator pure-g-r">
                <span class="pure-u-1-2">1～50件/1000件中</span>
                <ul class="pure-u-1-2">
                    <li class="prev"><a href="#"><<前へ</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">6</a></li>
                    <li class="next"><a href="#">次へ>></a></li>
                </ul>
            </section>
        </div>
        
        <div class="body pure-g-r">
        	<section class="pure-u-1-4">
                <div class="warp">
                    <h3>No.B0779</h3>
                    <div class="img"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/img_01.png" width="165" height="165" alt="画像" /></div>
                    <p class="icon"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_new.png" width="50" height="14" alt="NEW" /><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_sale.png" width="50" height="14" alt="SALE" /><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_gentei.png" width="50" height="14" alt="限定" /></p>
                    <p class="content">テキストテキスト</p>
                    <p class="price">一般価格　￥16.500(税込)</p>
                    <div class="member_price">
                        <p><em>会員特別価格</em></p>
                        <p><strong>￥16,500</strong><em>(税込)</em></p>
                        <p>ポイント:165pt</p>
                    </div>
                    <div class="count"><span>数量:<input type="text" class="box30"/></span><a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_incart.png" width="98" height="23" alt="カゴへ入れる" /></a></div>
                    <div class="btn_favorite"><a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_favorite.png" width="162" height="23" alt="お気に入り追加" /></a></div>
                    <div class="btn_regist">
                        <p>お得な価格は会員のみ公開</p>
                        <a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_regist.png" width="147" height="34" alt="会員登録" /></a>
                    </div>
                </div>
            </section>
        	<section class="pure-u-1-4">
                <div class="warp">
                    <h3>No.B0779</h3>
                    <div class="img"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/img_01.png" width="165" height="165" alt="画像" /></div>
                    <p class="icon"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_new.png" width="50" height="14" alt="NEW" /><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_sale.png" width="50" height="14" alt="SALE" /><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_gentei.png" width="50" height="14" alt="限定" /></p>
                    <p class="content">テキストテキスト</p>
                    <p class="price">一般価格　￥16.500(税込)</p>
                    <div class="member_price">
                        <p><em>会員特別価格</em></p>
                        <p><strong>￥16,500</strong><em>(税込)</em></p>
                        <p>ポイント:165pt</p>
                    </div>
                    <div class="count"><span>数量:<input type="text" class="box30"/></span><a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_incart.png" width="98" height="23" alt="カゴへ入れる" /></a></div>
                    <div class="btn_favorite"><a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_favorite.png" width="162" height="23" alt="お気に入り追加" /></a></div>
                    <div class="btn_regist">
                        <p>お得な価格は会員のみ公開</p>
                        <a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_regist.png" width="147" height="34" alt="会員登録" /></a>
                    </div>
                </div>
            </section>
        	<section class="pure-u-1-4">
                <div class="warp">
                    <h3>No.B0779</h3>
                    <div class="img"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/img_01.png" width="165" height="165" alt="画像" /></div>
                    <p class="icon"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_new.png" width="50" height="14" alt="NEW" /><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_sale.png" width="50" height="14" alt="SALE" /><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_gentei.png" width="50" height="14" alt="限定" /></p>
                    <p class="content">テキストテキスト</p>
                    <p class="price">一般価格　￥16.500(税込)</p>
                    <div class="member_price">
                        <p><em>会員特別価格</em></p>
                        <p><strong>￥16,500</strong><em>(税込)</em></p>
                        <p>ポイント:165pt</p>
                    </div>
                    <div class="count"><span>数量:<input type="text" class="box30"/></span><a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_incart.png" width="98" height="23" alt="カゴへ入れる" /></a></div>
                    <div class="btn_favorite"><a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_favorite.png" width="162" height="23" alt="お気に入り追加" /></a></div>
                    <div class="btn_regist">
                        <p>お得な価格は会員のみ公開</p>
                        <a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_regist.png" width="147" height="34" alt="会員登録" /></a>
                    </div>
                </div>
            </section>
        	<section class="pure-u-1-4">
                <div class="warp">
                    <h3>No.B0779</h3>
                    <div class="img"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/img_01.png" width="165" height="165" alt="画像" /></div>
                    <p class="icon"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_new.png" width="50" height="14" alt="NEW" /><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_sale.png" width="50" height="14" alt="SALE" /><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_gentei.png" width="50" height="14" alt="限定" /></p>
                    <p class="content">テキストテキスト</p>
                    <p class="price">一般価格　￥16.500(税込)</p>
                    <div class="member_price">
                        <p><em>会員特別価格</em></p>
                        <p><strong>￥16,500</strong><em>(税込)</em></p>
                        <p>ポイント:165pt</p>
                    </div>
                    <div class="count"><span>数量:<input type="text" class="box30"/></span><a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_incart.png" width="98" height="23" alt="カゴへ入れる" /></a></div>
                    <div class="btn_favorite"><a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_favorite.png" width="162" height="23" alt="お気に入り追加" /></a></div>
                    <div class="btn_regist">
                        <p>お得な価格は会員のみ公開</p>
                        <a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_regist.png" width="147" height="34" alt="会員登録" /></a>
                    </div>
                </div>
            </section>
        	<section class="pure-u-1-4">
                <div class="warp">
                    <h3>No.B0779</h3>
                    <div class="img"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/img_01.png" width="165" height="165" alt="画像" /></div>
                    <p class="icon"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_new.png" width="50" height="14" alt="NEW" /><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_sale.png" width="50" height="14" alt="SALE" /><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_gentei.png" width="50" height="14" alt="限定" /></p>
                    <p class="content">テキストテキスト</p>
                    <p class="price">一般価格　￥16.500(税込)</p>
                    <div class="member_price">
                        <p><em>会員特別価格</em></p>
                        <p><strong>￥16,500</strong><em>(税込)</em></p>
                        <p>ポイント:165pt</p>
                    </div>
                    <div class="count"><span>数量:<input type="text" class="box30"/></span><a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_incart.png" width="98" height="23" alt="カゴへ入れる" /></a></div>
                    <div class="btn_favorite"><a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_favorite.png" width="162" height="23" alt="お気に入り追加" /></a></div>
                    <div class="btn_regist">
                        <p>お得な価格は会員のみ公開</p>
                        <a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_regist.png" width="147" height="34" alt="会員登録" /></a>
                    </div>
                </div>
            </section>
        	<section class="pure-u-1-4">
                <div class="warp">
                    <h3>No.B0779</h3>
                    <div class="img"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/img_01.png" width="165" height="165" alt="画像" /></div>
                    <p class="icon"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_new.png" width="50" height="14" alt="NEW" /><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_sale.png" width="50" height="14" alt="SALE" /><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_gentei.png" width="50" height="14" alt="限定" /></p>
                    <p class="content">テキストテキスト</p>
                    <p class="price">一般価格　￥16.500(税込)</p>
                    <div class="member_price">
                        <p><em>会員特別価格</em></p>
                        <p><strong>￥16,500</strong><em>(税込)</em></p>
                        <p>ポイント:165pt</p>
                    </div>
                    <div class="count"><span>数量:<input type="text" class="box30"/></span><a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_incart.png" width="98" height="23" alt="カゴへ入れる" /></a></div>
                    <div class="btn_favorite"><a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_favorite.png" width="162" height="23" alt="お気に入り追加" /></a></div>
                    <div class="btn_regist">
                        <p>お得な価格は会員のみ公開</p>
                        <a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_regist.png" width="147" height="34" alt="会員登録" /></a>
                    </div>
                </div>
            </section>
        	<section class="pure-u-1-4">
                <div class="warp">
                    <h3>No.B0779</h3>
                    <div class="img"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/img_01.png" width="165" height="165" alt="画像" /></div>
                    <p class="icon"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_new.png" width="50" height="14" alt="NEW" /><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_sale.png" width="50" height="14" alt="SALE" /><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_gentei.png" width="50" height="14" alt="限定" /></p>
                    <p class="content">テキストテキスト</p>
                    <p class="price">一般価格　￥16.500(税込)</p>
                    <div class="member_price">
                        <p><em>会員特別価格</em></p>
                        <p><strong>￥16,500</strong><em>(税込)</em></p>
                        <p>ポイント:165pt</p>
                    </div>
                    <div class="count"><span>数量:<input type="text" class="box30"/></span><a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_incart.png" width="98" height="23" alt="カゴへ入れる" /></a></div>
                    <div class="btn_favorite"><a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_favorite.png" width="162" height="23" alt="お気に入り追加" /></a></div>
                    <div class="btn_regist">
                        <p>お得な価格は会員のみ公開</p>
                        <a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_regist.png" width="147" height="34" alt="会員登録" /></a>
                    </div>
                </div>
            </section>
        	<section class="pure-u-1-4">
                <div class="warp">
                    <h3>No.B0779</h3>
                    <div class="img"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/img_01.png" width="165" height="165" alt="画像" /></div>
                    <p class="icon"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_new.png" width="50" height="14" alt="NEW" /><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_sale.png" width="50" height="14" alt="SALE" /><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/icon_gentei.png" width="50" height="14" alt="限定" /></p>
                    <p class="content">テキストテキスト</p>
                    <p class="price">一般価格　￥16.500(税込)</p>
                    <div class="member_price">
                        <p><em>会員特別価格</em></p>
                        <p><strong>￥16,500</strong><em>(税込)</em></p>
                        <p>ポイント:165pt</p>
                    </div>
                    <div class="count"><span>数量:<input type="text" class="box30"/></span><a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_incart.png" width="98" height="23" alt="カゴへ入れる" /></a></div>
                    <div class="btn_favorite"><a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_favorite.png" width="162" height="23" alt="お気に入り追加" /></a></div>
                    <div class="btn_regist">
                        <p>お得な価格は会員のみ公開</p>
                        <a href="#"><img src="<!--{$TPL_URLPATH}-->img/page/list/productlist/btn_regist.png" width="147" height="34" alt="会員登録" /></a>
                    </div>
                </div>
            </section>
        </div>
      </div>
      
    <!--★タイトル★-->
    <h2 class="title"><!--{$tpl_subtitle|h}--></h2>

    <!--▼検索条件-->
    <!--{if $tpl_subtitle == "検索結果"}-->
        <ul class="pagecond_area">
            <li><strong>商品カテゴリ：</strong><!--{$arrSearch.category|h}--></li>
        <!--{if $arrSearch.maker|strlen >= 1}--><li><strong>メーカー：</strong><!--{$arrSearch.maker|h}--></li><!--{/if}-->
            <li><strong>商品名：</strong><!--{$arrSearch.name|h}--></li>
        </ul>
    <!--{/if}-->
    <!--▲検索条件-->

    <!--▼ページナビ(本文)-->
    <!--{capture name=page_navi_body}-->
        <div class="pagenumber_area clearfix">
            <div class="change">
                <!--{if $orderby != 'price'}-->
                    <a href="javascript:fnChangeOrderby('price');">価格順</a>
                <!--{else}-->
                    <strong>価格順</strong>
                <!--{/if}-->&nbsp;
                <!--{if $orderby != "date"}-->
                        <a href="javascript:fnChangeOrderby('date');">新着順</a>
                <!--{else}-->
                    <strong>新着順</strong>
                <!--{/if}-->
                表示件数
                <select name="disp_number" onchange="javascript:fnChangeDispNumber(this.value);">
                    <!--{foreach from=$arrPRODUCTLISTMAX item="dispnum" key="num"}-->
                        <!--{if $num == $disp_number}-->
                            <option value="<!--{$num}-->" selected="selected" ><!--{$dispnum}--></option>
                        <!--{else}-->
                            <option value="<!--{$num}-->" ><!--{$dispnum}--></option>
                        <!--{/if}-->
                    <!--{/foreach}-->
                </select>
            </div>
            <div class="navi"><!--{$tpl_strnavi}--></div>
        </div>
    <!--{/capture}-->
    <!--▲ページナビ(本文)-->

    <!--{foreach from=$arrProducts item=arrProduct name=arrProducts}-->

        <!--{if $smarty.foreach.arrProducts.first}-->
            <!--▼件数-->
            <div>
                <span class="attention"><!--{$tpl_linemax}-->件</span>の商品がございます。
            </div>
            <!--▲件数-->

            <!--▼ページナビ(上部)-->
            <form name="page_navi_top" id="page_navi_top" action="?">
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                <!--{if $tpl_linemax > 0}--><!--{$smarty.capture.page_navi_body|smarty:nodefaults}--><!--{/if}-->
            </form>
            <!--▲ページナビ(上部)-->
        <!--{/if}-->

        <!--{assign var=id value=$arrProduct.product_id}-->
        <!--{assign var=arrErr value=$arrProduct.arrErr}-->
        <!--▼商品-->
        <form name="product_form<!--{$id|h}-->" action="?" onsubmit="return false;">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <div class="list_area clearfix">
            <a name="product<!--{$id|h}-->"></a>
            <div class="listphoto">
                <!--★画像★-->
                <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrProduct.product_id|u}-->">
                    <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.main_list_image|sfNoImageMainList|h}-->" alt="<!--{$arrProduct.name|h}-->" class="picture" /></a>
            </div>

            <div class="listrightbloc">
                <!--▼商品ステータス-->
                <!--{if count($productStatus[$id]) > 0}-->
                    <ul class="status_icon clearfix">
                        <!--{foreach from=$productStatus[$id] item=status}-->
                            <li>
                                <img src="<!--{$TPL_URLPATH}--><!--{$arrSTATUS_IMAGE[$status]}-->" width="60" height="17" alt="<!--{$arrSTATUS[$status]}-->"/>
                            </li>
                        <!--{/foreach}-->
                    </ul>
                <!--{/if}-->
                <!--▲商品ステータス-->

                <!--★商品名★-->
                <h3>
                    <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrProduct.product_id|u}-->"><!--{$arrProduct.name|h}--></a>
                </h3>
                <!--★価格★-->
                <div class="pricebox sale_price">
                    <!--{$smarty.const.SALE_PRICE_TITLE}-->(税込)：
                    <span class="price">
                        <span id="price02_default_<!--{$id}-->"><!--{strip}-->
                            <!--{if $arrProduct.price02_min_inctax == $arrProduct.price02_max_inctax}-->
                                <!--{$arrProduct.price02_min_inctax|number_format}-->
                            <!--{else}-->
                                <!--{$arrProduct.price02_min_inctax|number_format}-->～<!--{$arrProduct.price02_max_inctax|number_format}-->
                            <!--{/if}-->
                        </span><span id="price02_dynamic_<!--{$id}-->"></span><!--{/strip}-->
                        円</span>
                </div>

                <!--★コメント★-->
                <div class="listcomment"><!--{$arrProduct.main_list_comment|h|nl2br}--></div>

                <!--★商品詳細を見る★-->
                <div class="detail_btn">
                    <!--{assign var=name value="detail`$id`"}-->
                    <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrProduct.product_id|u}-->" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_detail_on.jpg','<!--{$name}-->');" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_detail.jpg','<!--{$name}-->');">
                    <img src="<!--{$TPL_URLPATH}-->img/button/btn_detail.jpg" alt="商品詳細を見る" name="<!--{$name}-->" id="<!--{$name}-->" /></a>
                </div>

                <!--▼買い物かご-->
                <input type="hidden" name="product_id" value="<!--{$id|h}-->" />
                <input type="hidden" name="product_class_id" id="product_class_id<!--{$id|h}-->" value="<!--{$tpl_product_class_id[$id]}-->" />

                <div class="cart_area clearfix">
                    <!--{if $tpl_stock_find[$id]}-->
                        <!--{if $tpl_classcat_find1[$id]}-->
                            <div class="classlist">
                                <dl class="size01 clearfix">
                                        <!--▼規格1-->
                                        <dt><!--{$tpl_class_name1[$id]|h}-->：</dt>
                                        <dd>
                                            <select name="classcategory_id1" style="<!--{$arrErr.classcategory_id1|sfGetErrorColor}-->">
                                                <!--{html_options options=$arrClassCat1[$id] selected=$arrProduct.classcategory_id1}-->
                                            </select>
                                            <!--{if $arrErr.classcategory_id1 != ""}-->
                                                <p class="attention">※ <!--{$tpl_class_name1[$id]}-->を入力して下さい。</p>
                                            <!--{/if}-->
                                        </dd>
                                        <!--▲規格1-->
                                </dl>
                                <!--{if $tpl_classcat_find2[$id]}-->
                                    <dl class="size02 clearfix">
                                        <!--▼規格2-->
                                        <dt><!--{$tpl_class_name2[$id]|h}-->：</dt>
                                        <dd>
                                            <select name="classcategory_id2" style="<!--{$arrErr.classcategory_id2|sfGetErrorColor}-->">
                                            </select>
                                            <!--{if $arrErr.classcategory_id2 != ""}-->
                                                <p class="attention">※ <!--{$tpl_class_name2[$id]}-->を入力して下さい。</p>
                                            <!--{/if}-->
                                        </dd>
                                        <!--▲規格2-->
                                    </dl>
                                <!--{/if}-->
                            </div>
                        <!--{/if}-->
                        <div class="cartin clearfix">
                            <div class="quantity">
                                数量：<input type="text" name="quantity" class="box" value="<!--{$arrProduct.quantity|default:1|h}-->" maxlength="<!--{$smarty.const.INT_LEN}-->" style="<!--{$arrErr.quantity|sfGetErrorColor}-->" />
                                <!--{if $arrErr.quantity != ""}-->
                                    <br /><span class="attention"><!--{$arrErr.quantity}--></span>
                                <!--{/if}-->
                            </div>
                            <div class="cartin_btn">
                                <!--★カゴに入れる★-->
                                <div id="cartbtn_default_<!--{$id}-->">
                                    <input type="image" id="cart<!--{$id}-->" src="<!--{$TPL_URLPATH}-->img/button/btn_cartin.jpg" alt="カゴに入れる" onclick="fnInCart(this.form); return false;" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_cartin_on.jpg', this);" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_cartin.jpg', this);" />
                                </div>
                                <div class="attention" id="cartbtn_dynamic_<!--{$id}-->"></div>
                            </div>
                        </div>
                    <!--{else}-->
                        <div class="cartbtn attention">申し訳ございませんが、只今品切れ中です。</div>
                    <!--{/if}-->
                </div>
                <!--▲買い物かご-->
            </div>
        </div>
        </form>
        <!--▲商品-->

        <!--{if $smarty.foreach.arrProducts.last}-->
            <!--▼ページナビ(下部)-->
            <form name="page_navi_bottom" id="page_navi_bottom" action="?">
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                <!--{if $tpl_linemax > 0}--><!--{$smarty.capture.page_navi_body|smarty:nodefaults}--><!--{/if}-->
            </form>
            <!--▲ページナビ(下部)-->
        <!--{/if}-->

    <!--{foreachelse}-->
        <!--{include file="frontparts/search_zero.tpl"}-->
    <!--{/foreach}-->

</div>
