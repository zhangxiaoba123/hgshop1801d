<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link href="./resource/bootstrap-treeview/css/bootstrap-treeview.css" rel="stylesheet">
<script src="./resource/bootstrap-treeview/js/bootstrap-treeview.js"></script>

     
    
<div class="container-fluid">
	<form action="" id="spuForm">	
		<div class="form-group row">
		    <label for="goodsName" class="col-sm-2 col-form-label">名称</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="goodsName" name="goodsName">
		    </div>
		 </div>
		 <div class="form-group row">
		 	<label for="isMarketable" class="col-sm-2 col-form-label">上架</label>
		   <select name="isMarketable" id="isMarketable">
		   	 <option value="1">在售</option>
		   	 <option value="0">下架</option>
		   </select>	 
		 </div>
		 
		 <div class="form-group row">
		    <label for="goodsName" class="col-sm-2 col-form-label">分类</label>
		    
		    <div class="col-sm-4">
		      <input type="hidden" name="categoryId" id="categoryId">	
		      <input type="button" id="catName" class="form-control" onclick="seleCategory()">
		    </div>
		 </div>
		  <div class="form-group row" >
		   <div class="col-sm-10" id="catTree" style="display:none ;position: absolute; z-index: 1000;width: 90%" >
		   </div>
		 </div> 
		 
		
		 
		 <div class="form-group row">
		    <label for="caption" class="col-sm-2 col-form-label">标题</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="caption" name="caption">
		    </div>
		 </div>
		 
		 <div class="form-group row">
		    <label for="brandId" class="col-sm-2 col-form-label">品牌</label>
		    <div class="col-sm-4">
		      <select name="brandId">
		      	<option value="0">--请选择--</option>
				<c:forEach items="${brandList}" var="brand">
					<option value="${brand.id}">${brand.name}</option>
				</c:forEach>
		      </select>
		    </div>
		 </div>
		 
		  <div class="form-group row">
		    <label for="caption" class="col-sm-2 col-form-label">图片</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control"  name="myFile">
		    </div>
		 </div>
		 
		   <div class="form-group row">
		   	<button type="button" class="btn btn-primary btn-lg" onclick="commitData()">修改</button>
		   </div>
		 		 
	</form>
</div>
<script>
	function seleCategory(){
		$("#catTree").show()
	}
	
	function commitData(){
		
		var formData = new FormData($("#spuForm")[0]);
		$.ajax({
			url:'./spu/add',
			 type:'post',
			data:formData,
			contentType:false,
			processData:false,
			success:function(data){
				if(data=='ok'){
					alert('添加成功')
					//刷新
					$("#workContent").load('./spu/list');
				}else{
					alert('添加失败')
				}
			}
			
		})
		
	}
	
	function initTree(){
		$.post('./cat/data',{},function(data){
			$('#catTree').treeview({
				  data: data,         // data is not optional
				  levels: 2,
				  onNodeSelected: function(event, data) {
					  if(data.nodes.length==0){
						  $("#catName").val(data.text)
						  $("#categoryId").val(data.id)
						  $("#catTree").hide()
					  }
				  }
				});
		})
	
	}	
	
	//初始化树状图
	initTree();
	
</script>