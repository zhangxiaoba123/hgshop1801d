<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
    
<div class="container-fluid">
	<form action="" id="skuForm">	
		<div class="form-group row">
		    <label for="goodsName" class="col-sm-2 col-form-label">spu名称</label>
		    <div class="col-sm-4">
		    	<input type="hidden" name="spuId" value="${sku.spu.id}">	
		      <input type="text" class="form-control" id="goodsName" disabled="disabled" name="goodsName" value="${sku.spu.goodsName}" >
		    </div>
		 </div>
		 <div class="form-group row">
		    <label for="skutitle" class="col-sm-2 col-form-label">sku名称</label>
		    <div class="col-sm-4">
		     <input type="hidden" class="form-control"  name="id" value="${sku.id}">
		      <input type="text" class="form-control"  name="title" value="${sku.title}">
		    </div>
		 </div>
		 <div class="form-group row">
		    <label for="skutitle" class="col-sm-2 col-form-label">规格</label>
		    <div class="col-sm-4">
		      <table class="table" id="specTable">
		      	<tr>
		      		<th>规格名称</th>
		      		<th>属性值</th>
		      		<th><button type="button" class="btn btn-light" onclick="addLine()">添加</button> </th>
		      		
		      	</tr>
		      	<c:forEach items="${sku.options}" var="opt" varStatus="index">
		      	<tr>
		      		
		      		<td><select  class="specSelect" name="options[${index.index}].specId" data-toggle="${opt.id}" onchange="specChange($(this),${opt.id})">
		      			<c:forEach items="${specList}" var="spec">
		      		 		<option value="${spec.id}" ${opt.specId==spec.id?'selected':''}>${spec.specName}</option>
		      		 		</c:forEach>
		      		 	</select>
		      		 </td>
		      		<td>
		      			<select name="options[${index.index}].id"></select>
		      		</td>
		      		<td>
		      			<button type="button" class="btn btn-danger btn-sm" onclick="removeLine($(this))">移除</button>
		      		</td>
		      	</tr>
		      	</c:forEach>
		      </table>
		    </div>
		 </div>
		 <div class="form-group row">
		    <label for="sellPoint" class="col-sm-2 col-form-label">卖点</label>
		    <div class="col-sm-4">
		      <input type="text" id="sellPoint" class="form-control" value="${sku.sellPoint}"  name="sellPoint" >
		    </div>
		 </div>
		 <div class="form-group row">
		    <label for="price" class="col-sm-2 col-form-label">价格</label>
		    <div class="col-sm-3">
		      <input type="number" id="price" class="form-control"  value="${sku.price}"   name="price" >
		    </div>
		    <label for="price" class="col-sm-2 col-form-label">库存</label>
		    <div class="col-sm-3">
		      <input type="number" id="stockCount" class="form-control" value="${sku.stockCount}"  name="stockCount" >
		    </div>
		 </div>
		 <div class="form-group row">
		    <label for="costPrice" class="col-sm-2 col-form-label">成本</label>
		    <div class="col-sm-3">
		      <input type="number" id="costPrice" class="form-control"  value="${sku.costPrice}"  name="costPrice" >
		    </div>
		    <label for="marketPrice" class="col-sm-2 col-form-label">市价</label>
		    <div class="col-sm-3">
		      <input type="number" id="marketPrice" class="form-control"  value="${sku.marketPrice}"   name="marketPrice" >
		    </div>
		 </div>
		 <div class="form-group row">
		    <label for="barcode" class="col-sm-2 col-form-label">条形码</label>
		    <div class="col-sm-4">
		      <input type="text" id="barcode" class="form-control"  value="${sku.barcode}"  name="barcode" >
		    </div>
		 </div>
		 <div class="form-group row">
		    <label for="imageFile" class="col-sm-2 col-form-label">图片</label>
		    <div class="col-sm-4">
		      <input type="file" id="imageFile" class="form-control"  name="imageFile" >
		    </div>
		 </div>
		 <div class="form-group row">
		    <label for="cartThumbnailFile" class="col-sm-2 col-form-label">购物车图</label>
		    <div class="col-sm-4">
		      <input type="file" id="cartThumbnailFile" class="form-control"  name="cartThumbnailFile" >
		    </div>
		 </div>	
		  <div class="form-group row">
		  	<button type="button" class="btn btn-primary btn-lg btn-block" onclick="commitData()">提交数据</button>
		  </div>	 
		 
	</form>
		 
</div>    

<script>
	// 两个下拉框联动的效果
	// selId 属性值选中的id 回显正确
	function specChange(selObj,selId){
	
		// 得到规格id
		var specId=selObj.val();
		$.post('./sku/getSpecOptions',{specId:specId},function(data){
			var selOption= selObj.parent().next().children(0);
			selOption.empty();
			for(var i=0;i<data.length;i++ ){
				if(selId==data[i].id){
					selOption.append('<option value="'+data[i].id+'" selected >'+data[i].optionName+'</option>')
				}else{
					selOption.append('<option value="'+data[i].id+'">'+data[i].optionName+'</option>')
				}
			}
		})
		
	}
	//移除一行
	function removeLine(btnObj){
		btnObj.parent().parent().remove();
	}
	
	var index=1;
	function addLine(){
		
		$('#specTable').append(`
				<tr>
	      		<td><select name="options[`+index+`].specId" onchange="specChange($(this),0)" >
	      			<c:forEach items="${specList}" var="spec">
	      		 		<option value="${spec.id}">${spec.specName}</option>
	      		 		</c:forEach>
	      		 	</select>
	      		 </td>
	      		<td>
	      			<select name="options[`+index+`].id"></select>
	      		</td>
	      		<td>
	      			<button type="button" class="btn btn-danger btn-sm" onclick="removeLine($(this))">移除</button>
	      		</td>
	      	</tr>		
		`)
		index++;
		
	}
	
	
	
	//提交数据
	function commitData(){
		
		var formData = new FormData($("#skuForm")[0])
		$.ajax({
			url:'./sku/update',
			type:'post',
			data:formData,
			processData:false,
			contentType:false,
			success:function(data){
				if(data=='ok'){
					alert('提交成功')
					$("#workContent").load('./sku/list');
				}else{
					alert('提交失败')
				}
			}
		})
	}
	
	// 触发下拉框的事件
	$(".specSelect").each(function(){
		var optId= $(this).attr('data-toggle')
		specChange($(this),optId)
	})
	
	

</script>