cart = document.getElementById("cart")

if <%= @cart.empty? %>
  cart.innerHTML = ''
else
  cart.innerHTML = "<%= j render(@cart) %>"
  