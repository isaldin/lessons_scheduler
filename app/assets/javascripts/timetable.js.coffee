# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('#calendar').fullCalendar
    firstDay: 1,
    defaultView: 'month',
    allDaySlot: false,
    firstHour: 8,
    minTime: '8:00am',
    timeFormat:
      agenda: 'HH:mm{ - HH:mm}',
      '': 'HH:mm{ - HH:mm}',
    selectable: true,
    slotMinutes: 15,
    editable: true,
    header:
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek'
    columnFormat:
      month: 'ddd'
      week: 'dddd dd.MM'
      day: 'dddd dd.MM'

    eventSources: [
      url: '/lessons.json'
    ]

    dayClick: (date, allDay, jsEvent, view) ->
      $('#calendar').fullCalendar('gotoDate', date)
      $('#calendar').fullCalendar('changeView', 'agendaWeek')

    select: (startDate, endDate, allDay, jsEvent, view ) ->
      unless allDay
        start = $.fullCalendar.formatDate(startDate, 'dd.MM.yyyy HH:mm')
        console.log('startDate', startDate)
        console.log('endDate', endDate)
        console.log('allDay', allDay)
        console.log('jsEvent', jsEvent)
        console.log('view', view)
        window.location.href = "lessons/new?start="+start

    eventDrop: (event,dayDelta,minuteDelta,allDay,revertFunc) ->
      console.log(event.title + " was moved " + dayDelta + " days and " + minuteDelta + " minutes.");
      $.ajax 'lessons/update_lesson',
        data:
          minute_delta: minuteDelta,
          day_delta: dayDelta,
          lesson_id: event.lesson_id
        method: 'POST',
        success: (data) ->
          $('#calendar').fullCalendar('refetchEvents');

    eventClick: (calEvent, jsEvent, view) ->
      alert "Event: #{calEvent.lesson_id}"
      $('#calendar').fullCalendar 'updateEvent', calEvent

    eventAfterRender: (event, element, view) ->
      del_div = $ '<i/>',
        css:
          position: 'absolute',
          right: '5px',
          top: '2px',
          zIndex: 8888,
        class: 'icon-remove',
      del_div.bind 'click', () ->
        if confirm('Are you sure?')
          console.log event.lesson_id
          $.ajax 'lessons/'+event.lesson_id,
            method: 'DELETE',
            data:
              lesson_id: event.lesson_id
            success: (data) ->
              $('#calendar').fullCalendar('refetchEvents')
        false
      ok_div = $ '<i/>',
        css:
          position: 'absolute',
          right: '20px',
          top: '2px',
          zIndex: 8888,
        class: 'icon-ok',
      ok_div.bind 'click', (event) ->
        alert 'o'
        false
      $(element).append(ok_div)
      $(element).append(del_div)