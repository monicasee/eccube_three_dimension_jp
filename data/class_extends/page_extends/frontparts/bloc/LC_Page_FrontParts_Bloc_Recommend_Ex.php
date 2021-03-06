<?php
/*
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
 */

// {{{ requires
require_once CLASS_REALDIR . 'pages/frontparts/bloc/LC_Page_FrontParts_Bloc_Recommend.php';

/**
 * Recommend のページクラス(拡張).
 *
 * LC_Page_FrontParts_Bloc_Recommend をカスタマイズする場合はこのクラスを編集する.
 *
 * @package Page
 * @author LOCKON CO.,LTD.
 * @version $Id: LC_Page_FrontParts_Bloc__Ex.php -1   $
 */
class LC_Page_FrontParts_Bloc_Recommend_Ex extends LC_Page_FrontParts_Bloc_Recommend {

    // }}}
    // {{{ functions

    /**
     * Page を初期化する.
     *
     * @return void
     */
    function init() {
        parent::init();
        
        /*# 商品ステータス表示 ADD BEGIN #*/
        $masterData                 = new SC_DB_MasterData_Ex();
        $this->arrSTATUS            = $masterData->getMasterData('mtb_status');
        $this->arrSTATUS_IMAGE      = $masterData->getMasterData('mtb_status_image');
        /*# 商品ステータス表示 ADD END #*/
    }

    /**
     * Page のプロセス.
     *
     * @return void
     */
    function process() {
    	/*## ログイン情報全ページ使用 ADD BEGIN ##*/
		// ログインチェック
		$objCustomer = new SC_Customer_Ex();
		$this->tpl_is_login = $objCustomer->isLoginSuccess(true);
		/*## ログイン情報全ページ使用 ADD END ##*/
		
        parent::process();
    }

    /**
     * デストラクタ.
     *
     * @return void
     */
    function destroy() {
        parent::destroy();
    }
    
    /**
     * おすすめ商品検索.
     *
     * @return array $arrBestProducts 検索結果配列
     */
    function lfGetRanking() {
        $objQuery =& SC_Query_Ex::getSingletonInstance();
        $objProduct = new SC_Product_Ex();

        // おすすめ商品取得
        $col = 'T1.best_id, T1.category_id, T1.rank, T1.product_id, T1.title, T1.comment, T1.create_date, T1.update_date';
        $table = 'dtb_best_products as T1 INNER JOIN dtb_products as T2 ON T1.product_id = T2.product_id';
        $where = 'T1.del_flg = 0 and T2.status = 1';
        $objQuery->setOrder('T1.rank');
        $objQuery->setLimit(RECOMMEND_NUM);
        $arrBestProducts = $objQuery->select($col, $table, $where);

        $objQuery =& SC_Query_Ex::getSingletonInstance();
        if (count($arrBestProducts) > 0) {
            // 商品一覧を取得
            // where条件生成&セット
            $arrProductId = array();
            $where = 'product_id IN (';
            foreach ($arrBestProducts as $key => $val) {
                $arrProductId[] = $val['product_id'];
            }
            // 取得
            $arrProductList = $objProduct->getListByProductIds($objQuery, $arrProductId);
            /*# 商品ステータス表示 ADD BEGIN #*/
            $this->productStatus = $objProduct->getProductStatus($arrProductId);
            /*# 商品ステータス表示 ADD END #*/
            
            // おすすめ商品情報にマージ
            foreach ($arrBestProducts as $key => $value) {
                $arrRow =& $arrBestProducts[$key];
                if (isset($arrProductList[$arrRow['product_id']])) {
                    $arrRow = array_merge($arrRow, $arrProductList[$arrRow['product_id']]);
                } else {
                    // 削除済み商品は除外
                    unset($arrBestProducts[$key]);
                }
            }
        }
        return $arrBestProducts;
    }
}
