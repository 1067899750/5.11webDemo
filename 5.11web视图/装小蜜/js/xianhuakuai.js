$('.nav_list a:eq(0)').css({
			color:'#ffa751'
		})
		$('.nav_list a').on('mouseover',function () {
			_index = $(this).index();
			$(this).css({
				color:'#ffa751'
			})
			$(this).siblings().css({
				color:'#b5b5b5'
			})
			$(this).siblings('div').stop(true).animate({
				'left' : _index * 107 + 'px'
			})
		})
		$('.nav_list a').on('mouseout',function () {
			_index = $(this).index();
			$(this).css({
				color:'#b5b5b5'
			})
			$(this).siblings().css({
				color:'#b5b5b5'
			})
			$(this).siblings('div').stop(true).animate({
				'left' : '0px'
			})
		})