$(function(){
	function previewImg(fileInput,imgDiv){
	    if(window.FileReader){//支持FileReader的时候
	        var reader=new FileReader();
	        reader.readAsDataURL(fileInput.files[0]);
	        reader.onload=function(evt){
	            imgDiv.innerHTML="\<img src="+evt.target.result+"\>";
	        }
	    }else{//兼容ie9-
	        imgDiv.innerHTML='<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + fileInput.value + '\)\';"></div>';
	    }
	}
	function selectImg(fileInputs,imgDivs){
	    var checkImg=new RegExp("(.jpg$)|(.png$)|(.bmp$)|(.jpeg$)","i");
	    var i=0;
	    for(;i<fileInputs.length&&i<imgDivs.length;i++){
	        (function(i){//立即执行函数；保存i
	            fileInputs[i].onchange=function(){
	                if(checkImg.test(fileInputs[i].value)){
	                    previewImg(this,imgDivs[i]);
	                }else{
	                    alert("只支持上传.jpg .png .bmp .jpeg;你的选择有误");
	                }
	            };
	        })(i);
	    }

	} 
	var fileInputs=document.getElementsByClassName("img-btn");//文件选择按钮
	var imgDivs=document.getElementsByClassName("img-container");//图片容器
	selectImg(fileInputs,imgDivs);
})