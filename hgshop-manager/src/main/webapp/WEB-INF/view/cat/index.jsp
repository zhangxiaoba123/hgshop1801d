<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="./resource/bootstrap-treeview/css/bootstrap-treeview.css" rel="stylesheet">
<script src="./resource/bootstrap-treeview/js/bootstrap-treeview.js"></script>
    
<div class="container">
	<div class="row">
		<div class="col-md=5" id="tree"></div>
		<div class="col-md=5" >
			
			<!-- 用于添加 -->
			<div class="container">
				<form  id="addForm" action="addCat">
					<fieldset>
						<label for="parentNodeName">父类名称:</label>
						<input type="hidden" id="parentId" name="parentId" >
						<input id="parentNodeName" disabled="disabled">
						<br>
						<label for="name">分类名称:</label>
						<input id="name" name="name" >
						<br>
						<input type="button" value="添加"  onclick="addCat()">
					</fieldset>
				</form>
			</div>
			
			<!-- 用于修改和删除 -->
			<div class="container">
				<form  id="updateForm" action="addCat">
					<fieldset>
						<br>
						<input type="hidden" id="currentId" name="id" >
						<label for="name">分类名称:</label>
						<input id="currentName" name="name" >
						<br>
						<input type="button" id="btnUpdate" value="修改"  onclick="updateCat()">
						<input type="button" id="butnDel" value="删除"  onclick="delCat()" disabled="disabled">
					</fieldset>
				</form>
			</div>
			
		</div>
	</div>
	
</div>

<script>
	
	function initTree(){
		$.post('./cat/data',{},function(data){
			$('#tree').treeview({
				  data: data,         // data is not optional
				  levels: 2,
				  onNodeSelected: function(event, data) {
					  // 用于显示添加部分
					  $("#parentNodeName").val(data.text)
					  $("#parentId").val(data.id);
					  $("#name").val("")
					  
					  // 用于显示修改和删除的部分
					  $("#currentName").val(data.text)
					  $("#currentId").val(data.id);
					  $("#butnDel").prop("disabled",data.nodes.length>0)
				  }
				});
		})
	
	}	
	
	//初始化树状图
	initTree();
	
	function addCat(){
		$.post('./cat/add',$("#addForm").serialize(),function(data){
			if(data=="ok"){
				alert('添加成功')
				//刷新数据
				initTree();
			}else{
				alert('添加失败')
			}
		})
	}
	
	// 删除
	function delCat(){
		
		if(!confirm('确认删除该分类么'))
			return;
		
		$.post('./cat/delete',{id:  $("#currentId").val()},function(data){
			if(data=="ok"){
				alert('删除成功')
				//刷新数据
				initTree();
			}else{
				alert('删除失败')
			}
		})
	}
	
	// 修改
	function updateCat(){
		
		$.post('./cat/update',$("#updateForm").serialize(),function(data){
			if(data=="ok"){
				alert('修改成功')
				//刷新数据
				initTree();
			}else{
				alert('修改失败')
			}
		})
	}
	
	
</script>