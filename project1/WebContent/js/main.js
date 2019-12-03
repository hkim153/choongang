var draggedEventIsAllDay;
var activeInactiveWeekends = true;

// allday 사항이 true 일 경우 "하루 종일"로 표기
function getDisplayEventDate(event) {
  var displayEventDate;
  if (event.allDay == true) {
	  displayEventDate = "하루종일";
  }

  return displayEventDate;
}

// 필터 - 이벤트의 타입별 보기
function filtering(event) {
  var show_type = true;
  var types = $('#type_filter').val();

  if (types && types.length > 0) {
    if (types[0] == "all") {
      show_type = true;
    } else {
      show_type = types.indexOf(event.type) >= 0;
    }
  }

  return show_type;
}


// api 변경중 남은 부분 - 시간표시 부분 삭제
function calDateWhenResize(event) {

  var newDates = {
    startDate: '',
    endDate: ''
  };

  if (event.allDay) {
    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
    newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
  } 

  return newDates;
}


// 호버 기능
var calendar = $('#calendar').fullCalendar({

  eventRender: function (event, element, view) {

    element.popover({
      title: $('<div />', {
        class: 'popoverTitleCalendar',
        text: event.title
      }).css({
        'background': event.backgroundColor,
        'color': event.textColor
      }),
      content: $('<div />', {
          class: 'popoverInfoCalendar'
        }).append()
        .append('<p><strong>구분:</strong>' + event.type + '</p>')
        .append('<div class="popoverDescCalendar"><strong>설명:</strong> ' + event.description + '</div>')
        .append('<div class="popoverDescCalendar"><strong>지역:</strong> ' + event.rsa + '</div>')
        .append('<div class="popoverDescCalendar"><strong>링크:</strong> <a href="'+event.url+'" target="_parent">클릭</a></div>'),
        
        
      delay: {
        show: "800",
        hide: "2000"
      },
      trigger: 'hover',
      placement: 'top',
      html: true,
      container: 'body'
    });

    return filtering(event);

  },

 

  
  /* ****************
   *  일정 받아옴 
   * ************** */
  events: function (start, end, timezone, callback) {
    $.ajax({
      type: "get",
      url: "data1.json",
      data: {
        // 실제 사용시, 날짜를 전달해 일정기간 데이터만 받아오기를 권장
      },
      success: function (response) {
        var fixedDate = response.map(function (array) {
          if (array.allDay && array.start !== array.end) {
            // 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
            array.end = moment(array.end).add(1, 'days');
          }
          return array;
        })
        callback(fixedDate);
      }
    });
  },

  eventAfterAllRender: function (view) {
    if (view.name == "month") {
      $(".fc-content").css('height', 'auto');
    }
  },

  
});