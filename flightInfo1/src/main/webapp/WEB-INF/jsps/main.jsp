<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>航班信息查询</title>

<%@ include file="common/header.jsp" %>

<style>
.layui-col-md2.layui-col-md-offset5{
   font-size:47px;
   padding-top:70px;
   padding-bottom:70px;
}
.layui-col-md12.layui-form-item{
font-size:20px;
}

td>.layui-table-cell{
height:56px;

}
td>.laytable-cell-1-0-4,td>.laytable-cell-1-0-5{
   line-height: 56px;
}

</style>
</head>
<body>
  
<div class="layui-container">  
  <div class="layui-row">
    <div class="layui-col-md2 layui-col-md-offset5">
           航班信息
    </div>
    
     <div class="layui-col-md12 layui-form layui-form-item"> 
             <label class="layui-form-label">日期：</label>
             <div class="layui-input-inline">
	          <input type="text" class="layui-input" id="flightDate" name="flightDate">
   	         </div>
  	      
  	         <label class="layui-form-label">城市-从:</label>
		     <div class="layui-input-inline">
		      <input type="text" name="takeAirportName"  placeholder="请输入" autocomplete="off" class="layui-input">
		     </div>
	 
     
			 <label class="layui-form-label" style="width:20px;padding-left: 0px;">到:</label>
			 <div class="layui-input-inline">
			     <!-- lay-verify="required" 表单元素的一个属性，有则必填 -->
			     <input type="text" name="ladingAirportName"  placeholder="请输入" autocomplete="off" class="layui-input">
			 </div>
			 
			 <div class="layui-input-inline" style="padding-left: 50px;">
			     <button class="layui-btn" lay-submit lay-filter="LAY-user-front-search"  data-type="reload" >搜索</button>
			 </div>
    </div> 
    
    <div class="layui-col-md12">
       <table  id="flightInfo" lay-filter="flight"></table>
    </div>
    
  </div>
  
</div> 


<%@ include file="common/layui.jsp" %>
<script>
   layui.use(['laydate','table','form'], function(){
	  var laydate = layui.laydate,
	  table = layui.table,
	  form = layui.form,
	  $=layui.$;
	  
	  //执行一个laydate实例
	  laydate.render({
	    elem: '#flightDate' //指定元素
	  });
	  
	  //数据表格
	 var  tableIns=table.render({
		    elem: '#flightInfo'
		    ,url:'${ctx}/main/getFlight'
		    ,cols: [[
		       {field:'id', title: '飞行时间', hide:'true'}
		      ,{field:'cloa', title:'航空公司/航班机型', width:220, align:'center',templet: '<div>{{d.airline}}<br/>{{d.type}}</div>'}
		      ,{field:'clob', title:'起降时间', templet: '<div>{{d.takeTime}}<br/>{{d.landingTime}}</div>',align:'center'}
		      ,{field:'cloc', title:'起降机场',align:'center',templet: '<div>{{d.airport.cityName}}<br/>{{d.landAirport.cityName}}</div>'}
		      ,{field:'flightTime', title: '飞行时间', align:'center'}
		      ,{field:'stopAirport', title:'经停',align:'center',templet:'#titleTpl'}
		      ,{field:'referencePrice', title:'参考报价',toolbar: '#barDemo',align:'center'}
		    ]]
		    ,page: true
		  });
	  
	  //表格重载（条件搜索）
      form.on('submit(LAY-user-front-search)',function(data){
		  tableIns.reload({
			where:data.field,
		  	page:{curr:1}
		  })
	  });
	  
	 
      
	  //表格操作
	  table.on('tool(flight)', function(obj){
		    var data = obj.data;
		    var dom = obj.tr;
		    if(obj.event == 'detail'){
		    	$.ajax({
		    		url:'${ctx}/main/getTickets'
		    		,data:{id:data.id}
		    		,type:"post"
		    		,dataType:'JSON'
		    		,success:function(result){
		    			var tickets= result.data;
		    			if (result.code==0) {
		    				for ( var i in tickets) {
		    					$(dom).after(
						    		    '<tr class="flightTickets" style="background-color:#ccffff"><td colspan="2"> '+tickets[i].sellCompany +'</td> <td colspan="2">￥'+ tickets[i].ticketPrice+' </td></tr>'
						    	);
							}
						}else{
							$(dom).after(
					    		    '<tr class="flightTickets" style="background-color:#ccffff"><td colspan="2"> 暂无信息</td> <td colspan="2">暂无信息 </td></tr>'
					    	);
						}
		    			
		    			
				    /* 	$(dom).after(
				    			'<c:forEach items='+result.data+' var="data"> '
				    		    +'<tr class="flightTickets" style="background-color:#ccffff"><td colspan="2"> data.getSellCompany </td> <td colspan="2"> data.getTicketPrice </td></tr>'
				    			+'</c:forEach> '
				    	); */
				    	
				    	
				    	$(".flightTickets").show();
				     // layer.msg('ID：'+ data.id + ' 的查看操作');
					}
		    	})
		    }  
		  });
	  
	  //清除机票信息
	  $(document).ready(function(){
		  $("table,body").on("click",function(){
			  
			  $(".flightTickets").remove();
			   
		  })
	  });
	  
	});

</script>
 
<script type="text/html" id="barDemo">
    ￥{{d.referencePrice}}<br/>
  <a class="layui-btn layui-btn-primary layui-btn-xs seeTicket" lay-event="detail" >查询机票</a>
</script>

<script type="text/html" id="titleTpl">
  {{#  if(d.stopAirport == null){ }}
	无经停
  {{#  } else { }}
    {{d.stopAirport}}
  {{#  } }}
</script>
</body>
</html>
