<sample>
  <h3>{ message }</h3>
  <ul>
    <li each={ techs } onclick={ toggleDisable }><span class="item-name">{ name }</span><button onclick= { delete } data-id={ id }>x</button></li>
  </ul>
  <form onsubmit={ add }>
    <input/>
  </form>

  <script>
    this.message = 'Hello, Riot!'
    this.techs = [
      { id: 1, name: 'HTML' },
      { id: 2, name: 'JavaScript' },
      { id: 3, name: 'CSS' }
    ]
    toggleDisable(e) {
      e.currentTarget.classList.toggle('disable')
    }
    add(e) {
      e.preventDefault()
      input = document.querySelector('input')
      if (input) {
        let id = this.techs[this.techs.length - 1].id + 1
        this.techs.push({id: id, name: input.value})
        input.value = ''
      }
    }
    delete(e) {
      id = e.currentTarget.dataset.id
      this.techs = this.techs.filter(function(item) {
        return item.id != id
      })
    }
  </script>

  <style scoped>
    :scope { font-size: 2rem }
    h3 { color: #444 }
    ul { color: #999 }
    li {
      cursor: pointer
    }
    li button {
      background: none;
      color: red;
      border: solid 1px;
      display: none;
    }
    li:hover button { display: inline }
    li.disable .item-name { text-decoration: line-through }
  </style>
</sample>
