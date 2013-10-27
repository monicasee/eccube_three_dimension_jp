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

require_once CLASS_REALDIR . 'SC_Customer.php';

class SC_Customer_Ex extends SC_Customer {
	

    /**
     * 会員の登録住所を取得する.
     *
     * 配列の1番目に会員登録住所, 追加登録住所が存在する場合は2番目以降に
     * 設定される.
     *
     * @param integer $customer_id 顧客ID
     * @return array 会員登録住所, 追加登録住所の配列
     */
    function getCustomerAddress($customer_id) {
        $objQuery =& SC_Query_Ex::getSingletonInstance();

        /*## 顧客法人管理 MDF BEGIN ##*/
        $cols = "customer_id, name01, name02, kana01, kana02, zip01, zip02, pref, addr01, addr02, tel01, tel02, tel03";
    	if(constant("USE_CUSTOMER_COMPANY") === true){
        	$cols .= ", company, company_kana, company_department";
    	}
		$from = <<< __EOS__
            (   SELECT NULL AS other_deliv_id,
                       {$cols},
                       email, email_mobile,
                       fax01, fax02, fax03
                  FROM dtb_customer
                 WHERE customer_id = ?
             UNION ALL
                SELECT other_deliv_id,
					   {$cols},
                       NULL AS email, NULL AS email_mobile,
                       NULL AS fax01, NULL AS fax02, NULL AS fax03
                  FROM dtb_other_deliv
                 WHERE customer_id = ?
            ) AS addrs
__EOS__;
   	
    	/*## 顧客法人管理 MDF END ##*/
        $objQuery->setOrder("other_deliv_id IS NULL DESC, other_deliv_id DESC");
        return $objQuery->select("*", $from, "", array($customer_id, $customer_id));
    }	
}

?>
