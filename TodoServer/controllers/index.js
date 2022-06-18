const items = [
    {id: 1, name: 'product1'},
    {id: 2, name: 'product2'},
    {id: 3, name: 'product3'},
];

const index = (req, res) =>{
    res.render('index', {
        title: 'My WebStore',
        greeting: "You got here!"
    });
}

const listofProducts = (req, res, next) =>{
    res.render('products', {
        title: 'List of products',
        items: items
    });
}

const newProduct = (req, res, next) =>{
    const {newItem} = req.body;
    items.push({
        id: items.length+1,
        name: newItem
    });
    res.redirect('/products');
}

module.exports = {
    index: index,
    listofProducts: listofProducts,
    newProduct: newProduct
}