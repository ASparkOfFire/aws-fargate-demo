const express = require('express')
const app = express()
const port = 80

app.get('/', (req, res) => {
  res.send('THIS IS A TEST OF THE PIPELINE')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})