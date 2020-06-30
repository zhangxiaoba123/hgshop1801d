<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="container">
	<form action="" id="specForm">
		
		<div class="form-group row">
			<input type="hidden" id="specId" name="id" value="${spec.id}">
		    <label for="specName" class="col-sm-2 col-form-label">规格名称</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="specName" name="specName" value="${spec.specName}">
		    </div>
		 </div>
		 <div class="form-group row">
			 <div class="col-sm-1">
			 </div>
		 	<div class="col-sm-6">
		 	<table id="table">
		 		<tr>
		 			<td>属性名称</td>
		 			<td>显示顺序</td>
		 			<td><button type="button" onclick="addLine()">添加</button></td>
		 		</tr>
	 			<c:forEach items="${spec.options}" var="op" varStatus="index">
	 			<tr>
	 				<td><input name="options[${index.index}].optionName" value="${op.optionName}"></td>
	 				<td><input type="number" name="options[${index.index}].orders" value="${op.orders}"></td>
	 				<td><button type="button" onclick="removeLine($(this))">删除</button></td>
	 			</tr>
	 			</c:forEach>
		 		
		 	</table>
		 	</div>
		 </div>
		 <div class="form-group row">
		 	<button type="button" onclick="commitData()">提交</button>
		 </div>
	</form>
</div>

<script>
	var index=parseInt("${spec.options.size()}");
	function addLine(){
		$("#table").append(`<tr>
	 			<td><input name="options[`+index+`].optionName"></td>
	 			<td><input type="number" name="options[`+index+`].orders"></td>
	 			<td><button onclick="removeLine($(this))">删除</button></td>
	 		</tr>`)
			index++	
	}
	
	function removeLine(btnObj){
		btnObj.parent().parent().remove();
	}
	
	function commitData(){
		// 得到需要提交的数据
		var formData = new FormData($('#specForm')[0]);
		$.ajax({url:'./spec/update',
			  type:'post',
			  processData:false,
			  contentType:false,
			  data:formData,
			  success:function(data){
				if(data=='ok'){
					alert('修改成功')
					$("#workContent").load('./spec/list');
				}else{
					alert('修改失败')
				}
			  }
	      })//end ajax
	}
	
</script>