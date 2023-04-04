const express = require('express');
const { getAll,addOne,updateOne,deleteOne } = require('../database/model/instagram');
const PORT = 3000;
const app = express();
app.use(express.json())
app.use(express.urlencoded({extended:true}))

app.get('/getAll', (req, res) => {
  getAll((err,result)=>{
    if(err) res.status(500).send(err)
    else res.status(200).send(result)
})
})

app.post('/add',(req,res)=>{
  addOne((err,result)=>{
    if(err) res.status(500).send(err)
    else res.status(200).send(result)
  },req.body)
})

app.put('/:id',(req,res)=>{
  updateOne((err,result)=>{
    if(err) res.status(500).send(err)
    else res.status(200).send(result)
  },[req.body,req.params.id])
})

app.delete('/:id',(req,res)=>{
  deleteOne((err,result)=>{
    if(err) res.status(500).send(err)
    else res.status(200).send(result)
  },[req.params.id])
})

app.listen(PORT, () => {
  console.log(`Server listening at http://localhost:${PORT}`);
});

