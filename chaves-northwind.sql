
ALTER TABLE Orders
ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
ADD FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
ADD FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID);


ALTER TABLE Products
ADD FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
ADD FOREIGN KEY (CategoryID) REFERENCES Categorias(CategoryID);


ALTER TABLE OrderDetails
ADD FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
ADD FOREIGN KEY (ProductID) REFERENCES Products(ProductID);
