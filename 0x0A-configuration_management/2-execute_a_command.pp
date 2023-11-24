#kill process named killmenow
exec { 'pkill'
  command  => 'pkill killmenow',
  provides => shell,
}

