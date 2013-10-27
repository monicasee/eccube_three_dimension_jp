<?php
/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2011 LOCKON CO.,LTD. All Rights Reserved.
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

require_once CLASS_REALDIR . 'SC_Product.php';

class SC_Product_Ex extends SC_Product {
	/*## 追加規格 ADD BEGIN ##*/
    /**
     * 商品の追加規格一覧を取得する.
     *
     * @param integer $productId 商品ID
     * @return array 商品追加規格一覧の配列
     */
    function getExtraClass($productId, &$objQuery = null) {
    	if(empty($objQuery))
        	$objQuery =& SC_Query_Ex::getSingletonInstance();
        $objQuery->setOrder("product_extra_class_id");
        $result = $objQuery->select("*", "dtb_products_extra_class",
                                    "product_id = ?",
                                    array($productId));
        return $result;
    }	
    /*## 追加規格 ADD END ##*/
    
 	/*## 商品支払方法指定 ADD BEGIN ##*/
    /**
     * 商品IDをキーにした, 商品支払方法IDの配列を取得する.
     *
     * @param array 商品ID の配列
     * @return array 商品IDをキーにした商品支払方法IDの配列
     */
    function getProductPayment($productIds) {
        if (empty($productIds)) {
            return array();
        }
        $objQuery =& SC_Query_Ex::getSingletonInstance();
        $cols = 'product_id, payment_id';
        $from = 'dtb_product_payment';
        $where = 'product_id IN (' . implode(', ', array_pad(array(), count($productIds), '?')) . ')';
        $arrRet = $objQuery->select($cols, $from, $where, $productIds);
        $results = array_fill_keys($productIds, array());
        foreach ($arrRet as $row) {
            $results[$row['product_id']][] = $row['payment_id'];
        }
        return $results;
    }
    /*## 商品支払方法指定 ADD END ##*/
    
    /*## 商品配送方法指定 ADD BEGIN ##*/
    /**
     * 商品IDをキーにした, 商品配送方法IDの配列を取得する.
     *
     * @param array 商品ID の配列
     * @return array 商品IDをキーにした商品配送方法IDの配列
     */
    function getProductDeliv($productIds) {
        if (empty($productIds)) {
            return array();
        }
        $objQuery =& SC_Query_Ex::getSingletonInstance();
        $cols = 'product_id, deliv_id';
        $from = 'dtb_product_deliv';
        $where = 'product_id IN (' . implode(', ', array_pad(array(), count($productIds), '?')) . ')';
        $arrRet = $objQuery->select($cols, $from, $where, $productIds);
        $results = array_fill_keys($productIds, array());
        foreach ($arrRet as $row) {
            $results[$row['product_id']][] = $row['deliv_id'];
        }
        return $results;
    }
    /*## 商品配送方法指定 ADD END ##*/
}

?>
