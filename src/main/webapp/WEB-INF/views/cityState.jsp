<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
		<script>
       /*   $(document).ready(function() {
            $('#stateId').change(
            	function() {  
            		var id=$(this).val();
              		 $.getJSON('loadCities', {stateId : id,ajax : 'true'},
              	function(data) {
                    var html = '<option value="">----Select City----</option>';
                    var len = data.length;
                   	 for ( var i = 0; i < len; i++) {
                        html += '<option value="' + data[i] + '">' + data[i] + '</option>';
                    }
                    html += '</option>';
                 	 $('#city').html(html);
                });
            });
            
        }); */ 
         $(document).ready(function() {
            $('#stateId').change(function() {  
            	var id=$(this).val();
            	$.ajax({
            		type:'POST',
            		url:'loadCities',
            		data: {"stateId" : id},
            		success : function(response){	
						var options='';
            			if(response.data.length==1){
    						alert(response.message+"!");
            			}else{
						for(i=0; i<response.data.length; i++){	
							options = options + '<option>' +response.data[i] + '</option>';
					//		$("#city").append("<option> "+response.data[i]+"</option>");
						}
            		}$('#city').html(options);
            		}	
            		});
            	});
            });
        
        
    </script>
<form>
    <div class="form-group">
		<label>State Name</label>
		<select id="stateId" name="stateId" class="form-control">
    	    <option value="">Select State</option> 
            <c:forEach items="${stateList}" var="state">
        	 	<option value="${state.stateId}"  >${state.stateName}</option>
            </c:forEach>
        </select>
 </div>   
 <div class="form-group">    
	<div class="data">
		<label>City Name</label>
		<select  id="city" name="city"  class="form-control">
        	<option value="">Select City</option> 
        </select>
	</div>
	</div>
</form>