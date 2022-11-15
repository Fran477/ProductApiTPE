<?php

class ProductModel {

    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_product3d;charset=utf8', 'root', '');
    }


    public function getAllProducts() {

        $query = $this->db->prepare("SELECT * FROM product");
        $query->execute();
        $products = $query->fetchAll(PDO::FETCH_OBJ); 
        
        return $products;
    }

    public function getProduct($id) {
        
        $query = $this->db->prepare("SELECT * FROM product WHERE id = ?");
        $query->execute([$id]);
        $product = $query->fetch(PDO::FETCH_OBJ);
        
        return $product;
    }


    public function insertProduct($name, $price, $description, $type_filament, $stock, $id_category) {
        $query = $this->db->prepare("INSERT INTO product (name, price, description, type_filament, stock, id_category) VALUES (?, ?, ?, ?, ?, ?)");
        $query->execute([$name, $price, $description, $type_filament, $stock, $id_category]);

        return $this->db->lastInsertId();
    }



    function deleteProduct($id) {
        $query = $this->db->prepare('DELETE FROM product WHERE id = ?');
        $query->execute([$id]);
    }

    public function updateProductById($name,$price, $type_filament,$stock, $description, $id_category, $id)
    {
        $query = $this->db->prepare("UPDATE product SET name=?,  price=?, type_filament=?, stock=?, description=?, id_category=?  WHERE id=?");
        $query->execute([$name,$price, $type_filament,$stock, $description, $id_category, $id]);
    }
    
    public function productOrder($type,$field){
        $query = $this->db->prepare("SELECT * FROM product ORDER BY $field $type");
        $query->execute();
        $products = $query->fetchAll(PDO::FETCH_OBJ);
        return $products;
    }

    public function filterProduct($filament){
        $query = $this->db->prepare("SELECT * FROM product WHERE type_filament = '$filament' ");
        $query->execute();
        $products = $query->fetchAll(PDO::FETCH_OBJ);
        return $products;
    }


}
