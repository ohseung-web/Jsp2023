/* 변수 설정 */
var cate; // 카테고리

/* 화면 로딩 함수 */
function setPage(){
	if(cate == 2) document.querySelector(".section nav dd:first-of-type>a").style.borderBottomColor = "#aaaaaa";
	else if(cate == 1) document.querySelector(".section nav dd:last-of-type>a").style.borderBottomColor = "#aaaaaa";
}

/* 색상 왼쪽 이동 함수 */
function slideLeft(){
	var con = event.target.parentNode.parentNode;	
    var slidecon = con.getElementsByClassName("slide_con")[0];
	var item1 = slidecon.getElementsByClassName("slide_items")[0];
	var item2 = slidecon.getElementsByClassName("slide_items")[1];
	var item3 = slidecon.getElementsByClassName("slide_items")[2];
	var btn1 = con.getElementsByClassName("color_btn")[0];
    var btn2 = con.getElementsByClassName("color_btn")[1];
    btn1.classList.add("freeze");
    btn2.classList.add("freeze");
	slidecon.removeChild(item1);
    item2.classList.add("leftbox1");
    item3.classList.add("leftbox2");
    setTimeout(function(){
    	slidecon.appendChild(item1);
        item2.classList.remove("leftbox1");
        item3.classList.remove("leftbox2");
        btn1.classList.remove("freeze");
        btn2.classList.remove("freeze");        
    }, 500);
}

/* 색상 오른쪽 이동 함수 */
function slideRight(){
	var con = event.target.parentNode.parentNode;
    var slidecon = con.getElementsByClassName("slide_con")[0];
	var item1 = slidecon.getElementsByClassName("slide_items")[0];
	var item2 = slidecon.getElementsByClassName("slide_items")[1];
	var item3 = slidecon.getElementsByClassName("slide_items")[2];
    var btn1 = con.getElementsByClassName("color_btn")[0];
    var btn2 = con.getElementsByClassName("color_btn")[1];
    btn1.classList.add("freeze");
    btn2.classList.add("freeze");
	slidecon.removeChild(item3);
	item1.classList.add("rightbox1");
	item2.classList.add("rightbox2");
	setTimeout(function(){
		slidecon.insertBefore(item3, item1);
		item1.classList.remove("rightbox1");
		item2.classList.remove("rightbox2");
        btn1.classList.remove("freeze");
        btn2.classList.remove("freeze");        
	}, 500);
}