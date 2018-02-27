cart = document.getElementById('cart')
cart.innerHTML = ''

notice = document.createElement('aside')
notice.id = 'notice'
notice.innerHTML = 'Your cart is currently empty.'
article = document.getElementsByTagName('main')[0]
article.prepend(notice)