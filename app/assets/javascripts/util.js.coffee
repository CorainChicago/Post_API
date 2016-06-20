@timeFormat = (date) ->
  date = new Date(date)
  hours = date.getHours()
  minutes = date.getMinutes()
  ampm = if hours >= 12 then 'pm' else 'am'
  hours = hours % 12
  hours = if hours then hours else 12
  # the hour '0' should be '12'
  minutes = if minutes < 10 then '0' + minutes else minutes
  strTime = hours + ':' + minutes + ' ' + ampm
  date.getMonth() + 1 + '/' + date.getDate() + '/' + date.getFullYear() + '  ' + strTime
