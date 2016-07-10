	var imgIndex = 0;
		var timer = setInterval(fade,2000);
		function fade() {
			imgIndex ++;
			if (imgIndex == $('.bigShow img').length) {
				imgIndex = 0;
			};	
			$('.bigShow img').eq(imgIndex).fadeIn(200).siblings().fadeOut(200);
			$('.control-pic li').eq(imgIndex).css({
				background : '#ffa751'
			})
			$('.control-pic li').eq(imgIndex).siblings().css({
				background: '#eee'
			})
		}
		var timer2 = null;
		$('.control-pic li').on('click',function () {
			var _index = $(this).index();
			var _this = this;
			if (timer) {
				clearInterval(timer);
			};
			if (timer2) {
				clearInterval(timer2);
			};
			function colorChange() {
				$(_this).css({
					background : '#ffa751'
				})
				$(_this).siblings().css({
					background: '#eee'
				})
				$('.bigShow img').eq(_index).fadeIn(200).siblings().fadeOut(200);
			}
			timer2 = setTimeout(colorChange,100);
			imgIndex = _index;
			timer = setInterval(fade,2000);
		})
		// 小滑块
		

		//监理数据 —— 蒙版
		$(".data-main div").eq(0).css({
        "background" : "#df9638"
	    })
	    $(".data-main div").eq(1).css({
	        "background" : "#d1443c"
	    })
	    $(".data-main div").eq(2).css({
	        "background" : "#51b88c"
	    })
	    $(".data-main div").eq(3).css({
	        "background" : "#6ea4d5"
	    })
	    $(".data-main li").hover(function(){
	        $(this).children("div").stop(true).animate({
	            "padding-top" : "112px",
	            "height" : "243px"
	        }, 600)
	    }, function(){
	        $(this).children("div").stop(true).animate({
	            "padding-top" : "20px",
	            "height" : "73px"
	        }, 600)
	    })
		// 手风琴00
		$('.pic_show li').on('mouseover', function () {
			var _this = this;
			$(this).stop(true).animate({
				'width':'21.6%'
			})
			$(this).siblings().stop(true).animate({
				'width':'15.666%'
			})
			$(this).children('div').stop(true).animate({
				bottom : 0
			},function () {
				$(_this).children('div').fadeIn(100);
			})
		})
		$('.pic_show li').on('mouseout', function () {
			var _this = this;
			$('.pic_show li').stop(true).animate({
				'width':'16.666%'
			})
			$(this).children('div').stop(true).animate({
				bottom : '-75px'
			},function () {
				$(_this).children('div').fadeOut(100);
			})
		})

		// Tab切换
		$('.tab_ul li').on('mouseover',function () {
			var _index = $(this).index();
			$(this).addClass('select');
			$(this).siblings().removeClass('select');
			$('.main-cont .main').eq(_index).addClass('main-show');
			$('.main-cont .main').eq(_index).siblings().removeClass('main-show');
		})

		//监理服务介绍侧边的两个按钮 
		var click = true;
		$(window).scroll(function() {
			var scrollVal = $("body").scrollTop();
			if (scrollVal >= 500) {
				click = true;
				$(".tbox").fadeIn(200);
			} else {
				$(".tbox").fadeOut(200);
			}
			$('.scrollTop').on('click',function () {
				if (click) {
					$("body").animate({
						"scrollTop" : 0
					},1000)
					click = false;
				};	
			})
		})
		$('.weixin').on('mouseover',function () {
			$('.weixin img').fadeIn(100);
		})
		$('.weixin').on('mouseout',function () {
			$('.weixin img').fadeOut(100);
		})