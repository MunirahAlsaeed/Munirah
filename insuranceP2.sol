pragma solidity >=0.6.0 <0.8.1;


/**
 * @title Tech Insurance tor
 * @dev complete the functions
 */


    
    struct Product {
        uint productId;
        string productName;
        uint price;
        bool offered;
    }
     
    struct Client {
        bool isValid;
        uint time;
    }
    
 
    
    mapping(uint => Product) public productIndex;
    mapping(address => mapping(uint => Client)) public client;
  
   mapping(address => uint256) private _balance;
   mapping(uint256 => address) private _owner;
   
   function _balanceOf(address owner) public view returns(uint256){
       require(owner !=address(0));
       return _balance[owner];
   }
   
    function _ownerOf(uint256 _id) public view returns(address){
       require(owner =address(0));
       return _owner[id];
   }
  
    
    uint productCounter;
    

 
    function addProduct(uint _productId, string memory _productName, uint _price ) public  {
        Product memory newProduct = Product (_productId, _productName, _price, true);
        productIndex[productCounter++] = newProduct;
        _mint(msg.sender, productCounter);

    }
    
    
    function changeFalse(uint _productIndex) public  onlyOwner {
        productIndex[_productIndex].offered = false;
    }
    
    function changeTrue(uint _productIndex) public  onlyOwner{
        productIndex[_productIndex].offered = true;
    }
    
    modifier onlyOwner {
      require(msg.sender == insOwner, "you are not the owner" );
      revert("do not run this function again it cost you some fees");
     }
 
     
    function changePrice(uint _productIndex, uint _price) public  onlyOwner{
        productIndex[_productIndex].price = _price;
    }

    function buyInsurance(uint _productIndex) public  payable {
        require(productIndex[_productIndex].offered == true, "Tha Insurance is not available");
        Client memory newClient = Client (true, block.timestamp);
        client[msg.sender][_productIndex] =   newClient ;
        require(msg.value  == productIndex[_productIndex].price, "check the amount of the Insurance");
        uint256 price = productIndex[_productIndex].price;
        payable(msg.sender).transfer(price);

    } 
   function transferInsurance( address to, uint256 _id) public {
       require(msg.sender != to," You are the owner of this Insurance ");
       require(ownerOf(_id) == msg.sender," Your not the Owner ");
        _transfer(msg.sender, to, _id);
        
    }


    
}
