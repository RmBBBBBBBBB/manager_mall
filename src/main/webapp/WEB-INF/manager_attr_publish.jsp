<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 取得一级分类的json静态数据
		$.getJSON("js/json/class_1.js",function(data){
			// 将json静态数据加载到一级分类下拉列表
			// for(i=0;i<data.length;i++){}
			$(data).each(function(i,json){
				$("#attr_class_1_select").append("<option value="+json.id+">"+json.flmch1+"</option>");
			});
		});
	});

	function attr_select_class_2_by_class_1(class_1_id){
		// 获取一级分类id
		// $("#attr_class_1_select option:selected").value;
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			// 将json静态数据加载到二级分类下拉列表
			// for(i=0;i<data.length;i++){}
			$("#attr_class_2_select").empty(); 
			$(data).each(function(i,json){
				$("#attr_class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>");
			});
		});
	}
	
	function attr_get_attr_list_by_class_2_id(class_2_id){
		// 访问查询分类属性列表的方法，传入二级分类id
		$.post("get_attr_list_by_class_2_id.do",{"class_2_id":class_2_id},function(data){
			$("#attr_attr_inner").html(data);
		});
	}
	
	function attr_open_add_attr(){
		var class_2_id = $("#attr_class_2_select").val();
		var class_2_name = $("#attr_class_2_select option:selected").html();
		window.open("goto_add_attr/"+class_2_id+"/"+class_2_name+".do");
	}
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类属性</title>
</head>
<body>
		一级分类：<select name="flbh1" id="attr_class_1_select" onChange="attr_select_class_2_by_class_1(this.value)"></select><br>
		二级分类：<select name="flbh2" id="attr_class_2_select" onChange="attr_get_attr_list_by_class_2_id(this.value)"></select><br>
		<hr>
		
		<div id="attr_attr_inner">
		
		</div>
		<hr>
		<a href="javascript:attr_open_add_attr();">添加分类属性</a>
</body>
</html>