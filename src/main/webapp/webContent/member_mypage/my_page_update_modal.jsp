<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
<meta http-equiv="Cache-Control" content="post-check=0, pre-check=0">
<meta http-equiv="Pragma" content="No-Cache">

<title>�������� ���� : ����</title>

<link rel="stylesheet" type="text/css" href="../css/member_update.css.css">
<script type="text/javascript">

</script>
<meta name="decorator" content="NEW_USER_MYINFO">
</head>

<body>
<div id="wrap">
	<!-- ��ŵ�׺���̼� : �����ټ�����-->
	<div id="u_skip">

	</div>
	<!-- //��ŵ�׺���̼� -->


	<div id="container">
		<!-- CONTENTS -->
		<div id="content">
    <div class="c_header">
        <h2>�������� ����</h2>
        <p class="contxt"><strong>chlchlrnsrns</strong>���� ���������Դϴ�.<br>
		ȸ�������� ��������ó����ħ�� ���� �����ϰ� ��ȣ�Ǹ�, ȸ������ ����� ���� ���� ���� �Ǵ� �� 3�ڿ��� �������� �ʽ��ϴ�. <a href="http://policy.naver.com/policy/privacy.html" target="_blank" onclick="clickcr(this,'inf.privacy','','',event);">��������ó����ħ</a></p>
    </div>
    <form name="member">
     

        <fieldset>
            <table border="0" class="tbl_model">
                <caption><span class="blind">����ó ���� �Է�</span></caption>
                <colgroup>
                    <col style="width:22%"><col>
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">
                        <div class="thcell">
						     	  ����� <span class="word_br">�̸�</span>
						     </div>
                    </th>
                    <td>
                        <div class="tdcell">
                            <p class="contxt_tit">�ֺ���</p>
                            <p class="contxt_desc">�̸��̳� �������, ���� ���� ������ ����Ǿ��ٸ� ����Ȯ���� ���� ������ ������ �� �ֽ��ϴ�.</p>
                            <p class="btn_area_btm">
                                <a href="javascript:changeName();" class="btn_model"><b class="btn2">����</b></a>
                            </p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="thcell">�޴���ȭ</div>
                    </th>
                    <td>
                        <div class="tdcell">
                            <p id="p_txt_phoneNo" class="contxt_tit">+82 10-9***-8***</p>
                            <p class="contxt_desc">���̵�, ��й�ȣ ã�� �� ����Ȯ���� �ʿ��� ��� �Ǵ� ���� ���� �� ���̹��κ��� �˸��� ���� �� ����� �޴���ȭ�Դϴ�.</p>
                            <div id="d_phoneNo" style="display:none">
                                <p id="p_txt_phoneNo_changeYn" class="contxt_tit2"><label for="phoneNo">������ �޴���ȭ</label></p>
                              
                                    <a href="#" onclick="sendSmsForChangePhoneNo();return false;" class="btn_model"><span class="btn4">����</span></a>
                                </p>
                                <p id="e_phoneNo" class="contxt_alert"></p>

                                <p class="contxt_tit2"><label for="authNo">������ȣ �Է�</label></p>
                                <p class="contxt_webctrl">
                                    <input type="text" id="authNo" name="authNo" value=""  maxlength="6" onkeydown="check_num_ajax2('authNo', '2', 'e_authNo','e_phoneNo');" disabled class="focus" style="width:254px">
                                </p>
                                <p id="e_authNo"  class="contxt_alert"></p>

                                <p class="btn_area_btm">
                                    <a href="#" onclick="cancelChange('phoneNo');return false;" class="btn_model"><b id="b_txt_phoneNo_cncl"  class="btn2">�������</b></a>
                                    <a href="#" onclick="checkAuthNoForChangePhoneNo();return false;" class="btn_model"><b id="b_txt_phoneNo_reg" class="btn3">�����Ϸ�</b></a>
                                </p>
                            </div>
                            <p id="p_phoneNo" class="btn_area_btm">
                                <a href="#" onclick="display('phoneNo');return false;" class="btn_model"><b class="btn2">����</b></a>
                            </p>
                        </div>
                    </td>
                </tr>

                <tr>
                    <th scope="row">
                        <div class="thcell">
								���̹� ���� <span class="word_br">�̸���</span>
							</span></div>
                    </th>
                    <td>
                        <div class="tdcell">
                            <p class="contxt_tit">chlchlrnsrns@naver.com</p>
                            <p class="contxt_desc">���̹� ������ �̸��� �ּ��Դϴ�.</p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="thcell">
						     	  ����ó <span class="word_br">�̸���</span>
						     </div>
                    </th>
                    <td>
                        <div class="tdcell">
                            <p id="p_txt_myLetterEmail" class="contxt_tit">ch******@n*******.com</p>
                            <p class="contxt_desc">���̹� ������ ����/���� �� ���̹��� ��κ� �ȳ��� ����� �̸��� �ּ��Դϴ�.</p>
                            <div id="i_myLetterEmail" style="display:none">
                                <p class="contxt_tit2"><label for="confirmMyLetterEmail">���� �̸���</label></p>
                                <p class="contxt_webctrl">
                                    <input type="text" name="confirmMyLetterEmail" id="confirmMyLetterEmail"  style="width:254px">
                                    <a href="#" onclick="doConfirmMyLetterEmail();return false;" class="btn_model"><span class="btn4">Ȯ��</span></a>
                                </p>
                                <p id="e_myLetterEmail1" class="contxt_alert"></p>
                                <p class="contxt_desc2">��ϵ� �̸��� �ּҰ� ��ﳪ�� �ʴ´ٸ� �޴���ȭ ���� �� �̸����� ������ �� �ֽ��ϴ�. <a href="#" onclick="userMobile('myLetterEmail');return false;" class="link">�޴���ȭ ����</a></p>
                            </div>
                            <div id="d_myLetterEmail" style="display:none">
                                <p class="contxt_tit2">������ �̸���</p>
                                <p class="contxt_desc">������ �̸��� �ּҸ� �Է��ϼ���.(�� : abc@naver.com)</p>
                                <p class="contxt_webctrl">
                                    <input type="text" name="myLetterEmail" id="myLetterEmail" value="" style="width:254px" disabled>
                                    <label id="label_myLetterEmail" for="myLetterEmail" class="email_change_contxt2">������ �̸��� �Է�</label>
                                    <a href="#" class="btn_model" onclick="sendAuthNoForEmailAuth('myLetterEmail');return false;"><span class="btn4">����</span></a>
                                </p>
                                <p id="e_myLetterEmail2" class="contxt_alert" style="display: none;"></p>
                                <p class="contxt_webctrl_box">
                                    <input type="text" id="myLetterEmailAuthNo" style="width:254px" disabled>
                                    <label id="label_myLetterEmailAuthNo" for="myLetterEmailAuthNo" class="email_change_contxt">������ȣ �Է�</label>
                                </p>
                                <p id="e_myLetterEmail3" class="contxt_alert"></p>
                                <p class="contxt_guide" id="myLetterEmailAuthGuide" >������ȣ�� ���� �ʳ���?</p>
                                <p class="contxt_guide_help" id="myLetterEmailAuthGuideHelp" style="display:none">
								���̹��� �߼��� ������ ���� ���Ϸ� �з��� ���� �ƴ��� Ȯ���� �ּ���.<br>���� �����Կ��� ������ ���ٸ�, �ٽ� �� �� '����'�� �����ּ���.
							</p>
                                <p class="btn_area_btm">
                                    <a href="#" onclick="cancelChange('myLetterEmail');return false;" class="btn_model"><b class="btn2">�������</b></a>
                                    <a href="#" onclick="setEmail();return false;" class="btn_model"><b class="btn3">�����Ϸ�</b></a>
                                </p>
                            </div>
                            <p id="p_myLetterEmail" class="btn_area_btm">
                                <a href="#" onclick="display('myLetterEmail');return false;" class="btn_model"><b class="btn2">����</b></a>
                            </p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="thcell">
						     	  ����� <span class="word_br">�̸�</span>
						     </div>
                    </th>
                    <td>
                        <div class="tdcell">
                            <p class="contxt_tit">�ֺ���</p>
                            <p class="contxt_desc">�̸��̳� �������, ���� ���� ������ ����Ǿ��ٸ� ����Ȯ���� ���� ������ ������ �� �ֽ��ϴ�.</p>
                            <p class="btn_area_btm">
                                <a href="javascript:changeName();" class="btn_model"><b class="btn2">����</b></a>
                            </p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="thcell">
								 ���� <span class="word_br">���� ����</span>
							</div>
                    </th>
                    <td>
                        <div class="tdcell">
                            <div class="ad_wrap">
                                <div class="ad_check" style="padding-top:25px;">
                                        <input type="radio" name="t_info_yn" id="adMobileCheck" class="ad_checkbox" checked>
                                            <span>����</span>
                                        <input type="radio"  name="t_info_yn" style="margin-left:30px;" id="adEmailCheck" class="ad_checkbox" >
                                            <span>�̵���</span>
                                        </label>
                                </div>
                               
                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </fieldset>
    </form>
</div>
<form name="formAuth" method="post" action="/user2/help/changeUserInfo?m=actionUserMobile">
    <input type=hidden name="authRes" value="" />
    <input type=hidden name="token_help" value="bY4HbFi5TDQPTwQ1" />
</form>

	</div>

	<div id="footer">
            ǲ��

	</div>
</div>


</body>
</html>
