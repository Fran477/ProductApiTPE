<?php
require_once './app/models/productModel.php';
require_once './app/views/productApiView.php';

class ProductApiController {
    private $model;
    private $view;
    private $data;

    public function __construct() {
        $this->model = new ProductModel();
        $this->view = new ApiView();
        $this->order = isset($_GET['order']) ?   $_GET['order'] : null;
        $this->field = isset($_GET['field']) ?   $_GET['field'] : null;
        $this->filament = isset($_GET['filament']) ?   $_GET['filament'] : null;
        $this->data = file_get_contents("php://input");

    }

    private function getData() {
        return json_decode($this->data);
    }

    public function getProducts() {

        if (!empty($this->order) && !empty($this->field) && ($this->verifyField())) {    
            $type = $this->order;
            $field = $this->field;
            if(($type == 'desc') || ($type ==  'asc')){
                $products = $this->model->productOrder($type, $field);
                $this->view->response($products, 200);
                die();
            }
            else{
                $this->view->response("No es posible el filtrado y ordenamiento", 404);
                return;
            }
        }
        if (!empty($this->filament) && ($this->verifyTypeFilament())){
            $filament = $this->filament;
            $products = $this->model->filterProduct($filament);
            $this->view->response($products, 200);
            die(); 
        }
        if(!isset($this->order) && !isset($this->field) && !isset($this->filament)){
        
            $products = $this->model->getAllProducts();
            $this->view->response($products, 200);
        
        }
        else{
            $this->view->response("No es posible el filtrado y ordenamiento", 404);
            return;
        }

    }

    public function getProduct($params = null) {

        $id = $params[':ID'];
        $product = $this->model->getProduct($id);
        if ($product)
            $this->view->response($product, 200);
        else 
            $this->view->response("El producto con el id=$id no existe", 404);
    }

    public function deleteProduct($params = null) {
        $id = $params[':ID'];

        $product = $this->model->getProduct($id);
        if ($product) {
            $this->model->deleteProduct($id);
            $this->view->response("Se elimino el producto de forma exitosa", 200);
        } else 
            $this->view->response("El producto con el id=$id no existe", 404);
    }

    public function insertProduct() {
        $product = $this->getData();


        if (is_numeric($product->price) && is_numeric($product->stock) && !empty($product->name) && !empty($product->type_filament)  && !empty($product->description) && !empty($product->id_category)) {

            $id = $this->model->insertProduct($product->name, $product->price, $product->description, $product->type_filament, $product->stock, $product->id_category);
            $product = $this->model->getProduct($id);
            $this->view->response($product, 201);

        } else {

            $this->view->response("Complete los datos", 400);

        }
    }

    public function updateProduct($params = null)
    {
        $id = $params[':ID'];
        $product = $this->getData();
        $productById = $this->model->getProduct($id);

        if (is_numeric($product->price) && is_numeric($product->stock) && !empty($product->name) && !empty($product->type_filament)  && !empty($product->description) && !empty($product->id_category)) {
            $name = $product->name;
            $price = $product->price;
            $stock = $product->stock;
            $type_filament = $product->type_filament;
            $description = $product->description;
            $id_category = $product->id_category;
            if ($productById) {
                $this->model->updateProductById($name,$price, $type_filament,$stock, $description, $id_category, $id);
                $updatePlayer = $this->model->getProduct($id);
                $this->view->response("El producto con el id = $id se ha modificado con exito", 200);
                $this->view->response($updatePlayer, 200);
            } else {
                $this->view->response("El producto con el id = $id no existe", 404);
            }
        } else {
            $this->view->response('Complete todos los datos', 404);
            
        }
    }


        private function verifyField(){
        
            $whiteList = array("id","name","stock","price");
        
         if (in_array($this->field, $whiteList)) {
            return true;
        }
        return false;
    }
    private function verifyTypeFilament(){
        
        $whiteList = array("PLA","PETG","PTG");
    
     if (in_array($this->filament, $whiteList)) {
        return true;
    }
    return false;
}

}