const express = require("express");
const router = express.Router();
const indexController = require('./../controllers/index');

router.get('/', indexController.index);

router.get('/products', indexController.listofProducts);

router.post('/new-product', indexController.newProduct);

module.exports = router;
