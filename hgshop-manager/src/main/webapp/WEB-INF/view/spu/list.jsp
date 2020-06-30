<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<div class="container-fluid">
	<!-- 查询条件 -->
	<div>
		<form action="" id="queryForm">
		<fieldset>
			<label for="key">关键字</label><input id="key" name="key" value="${spuvo.key}"> 
			&nbsp;&nbsp;&nbsp;
			<label for="brand">品牌</label><select id="brand" name="brandId">
				<option value="0">--请选择--</option>
				<c:forEach items="${brandList}" var="brand">
					<option value="${brand.id}">${brand.name}</option>
				</c:forEach>
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<br>
			
			<label for="sortColumn">排序字段</label>
			<select id="sortColumn" name="orderColumn">
				<option value="">--请选择--</option>
				<option value="goods_name" ${spuvo.orderColumn=='goodsName'?"selected":''} >名称</option>
				<option value="caption" ${spuvo.orderColumn=='caption'?"selected":''}>标题</option>
				<option value="category_id" ${spuvo.orderColumn=='category_id'?"selected":''}>分类</option>
				<option value="brand_id" ${spuvo.orderColumn=='brand_id'?"selected":''}>品牌</option>
			</select>	
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label for="sortType">排序方式</label>
			<input type="radio" name="orderType" value="ASC"  ${spuvo.orderType=='ASC'?"checked":''} >升序  &nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="orderType" value="DESC"  ${spuvo.orderType=='DESC'?"checked":''} >降序 
		</fieldset>
		<fieldset>
			<button type="button" class="btn btn-warning" onclick="query(1)">查询</button>
			<button type="button" class="btn btn-warning" onclick="toAdd()">添加</button>
		</fieldset>
		</form>
	</div>
	<!-- 查询结果 -->
	 <div>
	 	<table class="table">
	 		<tr>
	 			<th>id <input type="checkbox"></th>
	 			<th>名称</th>
	 			<th>在售</th>
	 			<th>品牌</th>
	 			<th>标题</th>
	 			<th>分类</th>
	 			<th>图片</th>
	 			<th>操作</th>
	 		</tr>
	 		<c:forEach items="${pageInfo.list}" var="spu">
	 			<tr>
	 				<td>${spu.id}</td>
	 				<td>${spu.goodsName}</td>
	 				<td>${spu.isMarketable==1?'在售':'下架'}</td>
	 				<td>${spu.brand.name}</td>
	 				<td>${spu.caption}</td>
	 				<td>${spu.category.name}</td>
	 				<td><img src="/pic/${spu.smallPic}" width="40" height="40"></td>
	 				<td>
	 					<button type="button" class="btn btn-danger btn-sm" onclick="del(${spu.id})">删除</button>
						<button type="button" class="btn btn-warning btn-sm" onclick="toUpdate(${spu.id})">修改</button>
						<button type="button" class="btn btn-info btn-sm" onclick="toAddSku(${spu.id})">添加SKU</button>
	 				</td>
	 			</tr>
	 		</c:forEach>
	 	</table>
	 </div>
	 <div>
	 	<nav aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item"><a class="page-link" href="#">首页</a></li>
		    <c:forEach begin="1" end="${pageInfo.pages}" var="page">
		    	<c:if test="${page==pageInfo.pageNum}">
		   	 		<li class="page-item"><a class="page-link" href="javascript:void(0)" ><font color="red">${page}</font> </a></li>
		    	</c:if>
		    	<c:if test="${page!=pageInfo.pageNum}">
		   	 		<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="query(${page})">${page}</a></li>
		    	</c:if>
		    
		    </c:forEach>
		    <li class="page-item"><a class="page-link" href="#">尾页</a></li>
		  </ul>
		</nav>
	 </div>
</div>  
<script>

	// 跳转到添加页面
	function toAdd(){
		$("#workContent").load('./spu/toadd');
	}
	
	//删除
	function del(id){
		
		if(!confirm('确认删除么？'))
			return;
		
		var ids=new Array();
		ids.push(id);
		$.post('./spu/del',{ids:ids},function(data){
			if(data=='ok'){
				alert('删除成功')
				//刷新
				query("${pageInfo.pageNum}")
			}else{
				alert('删除失败')
			}
			
		})
	}
	
	//去修改
	function toUpdate(id){
		$("#workContent").load('./spu/toUpdate',{id:id});
	}
	

	//查询
	function query(page){
		var query = $("#queryForm").serialize();
		$("#workContent").load('./spu/list?pageNum='+page,query);
				
	}
	
	function toAddSku(spuid){
		$("#workContent").load('./sku/toAdd',{spuId:spuid});
	}
</script>
  