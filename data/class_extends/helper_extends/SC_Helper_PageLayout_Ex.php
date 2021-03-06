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

// {{{ requires
require_once CLASS_REALDIR . 'helper/SC_Helper_PageLayout.php';

/**
 * Webページのレイアウト情報を制御するヘルパークラス(拡張).
 *
 * SC_Helper_PageLayout をカスタマイズする場合は, このクラスを編集する.
 *
 * @package Helper
 * @author LOCKON CO.,LTD.
 * @version $Id: SC_Helper_PageLayout_Ex.php 20764 2011-03-22 06:26:40Z nanasess $
 */
class SC_Helper_PageLayout_Ex extends SC_Helper_PageLayout {
	
	/*## SEO管理 ADD BEGIN ##*/
	function sfSetPageInfo(&$page, $arrInfo){
		if(!empty($arrInfo['title'])){
			$page->arrPageLayout['title'] = $arrInfo['title'];
		}
				
		if (empty($page->arrPageLayout['keyword'])){
			$page->arrPageLayout['keyword'] .= $arrInfo['keyword'];
		}else{
			$page->arrPageLayout['keyword'] .= ",".$arrInfo['keyword'];
		}

		if (empty($page->arrPageLayout['description'])){
			$page->arrPageLayout['description'] .= $arrInfo['description'];
		}
		else{
			$page->arrPageLayout['description'] .= ",".$arrInfo['description'];
		}
		
		if (empty($page->arrPageLayout['h1'])){
			$page->arrPageLayout['h1'] .= $arrInfo['h1'];
		}
		else{
			$page->arrPageLayout['h1'] .= ",".$arrInfo['h1'];
		}
	}
	/*## SEO管理 ADD END ##*/

}
?>
