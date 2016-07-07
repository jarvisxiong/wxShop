
<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
	<head>
		<title>添加人员</title>
		<%@ include file="/jsp/common/common.jsp"%>
		<%@ include file="/jsp/easyui-validate.jsp"%>
		<link rel="stylesheet" href="${ctx}/jsp/admin/css/base.css" type="text/css" />
	</head>
	<body>

		<form id="userAddForm" method="post" novalidate>
			<input type="hidden" name="userId" value="" required="true" />
			<table class="inputTable" cellpadding="0" cellspacing="1" border="0" align="center">
				<tr>
					<th width="17%">
						登录名称：
					</th>
					<td width="33%">
						<input type="text" name="userName" readonly validType="length[5,20]" class="formText easyui-validatebox"
							value="${userMap.sysUser.userName}" required="true" />
							<input type="hidden" name="password" value="666888" required="true" />
						<label class="requireField">
							*
						</label>
					</td>
					<th width="20%">
						真实姓名：
					</th>
					<td width="30%">
						<input type="text" name="realName" class="formText width1 easyui-validatebox" validType="length[2,20]"
							value="${userMap.sysUser.realName}" required="true" />
						<label class="requireField">
							*
						</label>
					</td>
				</tr>
				<tr>
					<th>
						密码失效日期：
					</th>
					<td>
						<input id="invalidDate" name="invalidDate" require="true" validType="length[10,20]" editable="false"
							value="<fmt:formatDate value="${userMap.sysUser.invalidDate }" pattern="yyyy-MM-dd"/>" />
						<label class="requireField">
							*
						</label>
					</td>
					<th>
						用户状态：
					</th>
					<td>
						<input value="${userMap.sysUser.status}" type="text" id="statusSelect" name="statusSelect" />
						<input type="hidden" id="status" value="${userMap.sysUser.status}" name="status" />
						<label class="requireField">
							*
						</label>
					</td>
				</tr>
				<tr>
					<th>
						邮箱：
					</th>
					<td>
						<input type="text" name="email" class="formText easyui-validatebox" value="${userMap.sysUser.email }"
							required="true" validType="email" />
						<label class="requireField">
							*
						</label>
					</td>
					<th>
						允许登录错误次数：
					</th>
					<td>
						<input type="text" name="maxLoginCount" min="5" max="20" class="formText width1 easyui-numberbox" required="true"
							value="${userMap.sysUser.maxLoginCount}" title="最小值为5,最大值为20" />
						<label class="requireField">
							*
						</label>
					</td>
				</tr>
				<tr>
					<th>
						手机号码：
					</th>
					<td>
						<input type="text" name="mobileNo" class="formText" value="${userMap.sysUser.mobileNo }" />
					</td>
					<th>
						联系电话：
					</th>
					<td>
						<input type="text" name="phoneNo" class="formText" value="${userMap.sysUser.phoneNo }" />
					</td>
				</tr>
				<tr>
					<th>
						错误登录次数：
					</th>
					<td colspan="3">
						<input type="text" readonly name="errLoginCount" class="formText" value="${userMap.sysUser.errLoginCount}" />
					</td>
					<!--<th>
						最后登录ip：
					</th>
					<td>
						<input type="text" readonly name="lastIp" class="formText" value="${userMap.sysUser.lastIp }" />
					</td>  -->
				</tr>
				<!--
				<tr>
					<th>
						最后登录时间：
					</th>
					<td>
						<input type="text" disabled name="lastLogin" readonly class="formText"
							value="" />
					</td>
					<th>
						解锁时间：
					</th>
					<td>
						<input type="text" name="unlockTime" class="formText" value="" />
					</td>
				</tr>
				<tr >
					<th>
						所属机构：
					</th>
					<td>
						<input type="text" name="orgId" class="formText" value="" />
					</td>
					<th>
						所属部门：
					</th>
					<td>
						<input type="text" name="deptId" class="formText" value="" />
					</td>
				</tr>
				  -->
				<tr>
					<th>
						备注：
					</th>
					<td colspan="4">
						<textarea name="remark" rows="3" class="easyui-validatebox" validType="length[0,250]" cols="40">${userMap.sysUser.remark }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<center>
							<button class="liger-button l-button" id="saveBtn" type="button" onclick="updateSysUser()">
								保存
							</button>
							<button class="liger-button l-button" id="closeBtn" type="button" onclick="closeWin()">
								关闭
							</button>
						</center>
					</td>
				</tr>
			</table>

		</form>
		<script type="text/javascript">
   function closeWindow(){
     $('#sysUserWindow').window('close');
   }
   
   
   function err(_d){
	var _e=$(_d);

	var tip=$("<div class=\"validatebox-tip\">"+"<span class=\"validatebox-tip-content\">"+"</span>"+"<span class=\"validatebox-tip-pointer\">"+"</span>"+"</div>").appendTo("body");
	//$.data(_d,"validatebox").tip=tip;
	 
	tip.find(".validatebox-tip-content").html("测试是否正常");
	tip.css({display:"block",left:_e.offset().left+_e.outerWidth(),top:_e.offset().top});
	alert(1);
	
	var tip=$.data(_d,"validatebox").tip;
	tip.remove();
    $.data(_d,"validatebox").tip=null;
};
   
   function saveUser(){
   alert($("#status").val())
   		$('#userName').validatebox({
		   		required:true,
		   		validType:"length[5,20]",invalidMessage:'长度'
   		});
   		
   	//	$('#userName').validatebox({
	//	   		required:true,
	//	   		validType:"remote['${ctx}/sys/checkUserName.do','userName']",
	//	   		invalidMessage:'该用户名已存在！'
   	//	});
   		
   		
   		
       var r = $('#userAddForm').form('validate');
			if(!r) {
			//	return false;
		     }   
      
   	   $.post("${ctx}/sys/addSysUser.do",$("#userAddForm").serializeArray(),function(data){
				$('#sysUserWindow').window('close');
				$('#userTable').datagrid('reload');  
				$.messager.alert('提示',data.msg,'info');
	  });
   }
   
   $("#status").combobox({
    editable:false,
   	valueField:'id',
   	textField:'text'
   });
   
 </script>

	</body>
</html>