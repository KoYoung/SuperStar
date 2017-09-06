<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE head PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <jsp:include page="head.jsp"></jsp:include>
</head>
<body class="easyui-layout">

	<div
		data-options="region:'north',title:'欢迎<%=request.getSession().getAttribute("studentName")%>登录',split:false,collapsible:false"
		style="height:100px;">
	</div>
	<div
		data-options="region:'south',title:'south',split:false,collapsible:false"
		style="height:0px;line-height:0px;" align="center"></div>
	<div data-options="region:'west',title:'West',split:true"
		style="width:200px;background-color: #339999;color:#FFFFFF">
		<ul id="tt">
			
		</ul>

	</div>
	<div data-options="region:'center',title:''"
		style="padding:5px;background:#eee;">
		<div id="tabsInfo" class="easyui-tabs" data-options="fit:true">
			<div title="第一个选项卡">内容</div>
		</div>
	</div>
</body>
<script>
		$("#tt").tree({
			url:'tree_data.json',   
			animate:true,//定义节点在展开或折叠的时候是否显示动画效果.
			lines:true,//定义是否显示树控件上的虚线。
			onClick:function(node){
				//alert(node.target);
			    //定义一个变量children获取所有子节点长度
				var childen=$(this).tree('getChildren',node.target);
				//alert(childen.length);
				//alert(childen);
				//判断子节点，如果无子节点，则调用添加选项卡的方法
				  if(childen.length == 0){
				  addTables(node.text,node.attributes.url);//attributes绑定该节点的自定义属性,text显示的节点文本
				}
			}
		});
	//添加选项卡的方法
	function addTables(title,url){
		//tab选项卡面板的标题文本。
		var tab =$('#tabsInfo').tabs('getTab',title);
		//如果选项卡已存在，则选择到该项目
		if(tab){
			$('#tabsInfo').tabs('select',title);
		}else{//如果选项卡不存在，则添加该选项卡面板
	
		$('#tabsInfo').tabs('add',{    
	    title:title, //title选项卡面板的标题文本   
	  	content:"<iframe src="+url+" width='100%' height='100%' frameborder=0>",//选项卡面板的内容。拼接tree里面attributes里的URL链接的页面      
	    closable:true, //closable在设置为true的时候，选项卡面板将显示一个关闭按钮，在点击的时候会关闭选项卡面板   
	    tools:[{    
	        iconCls:'icon-mini-refresh', //iconCls定义了一个图标的CSS类ID显示到选项卡面板标题。刷新图标   
	        handler:function(){    
	            alert('refresh');    
        }    
    }]    
});  
		
	}
	}
</script>
</html>
