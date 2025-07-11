-- Lakeflow Pipeline: Streaming, Materialised view, view
-- path :s3://jpmctraining/input_files/sales

create streaming table sales_pl as select * from STREAM read_files("s3://jpmctraining/input_files/sales",format=>"csv");

create streaming table products_pl as select * from STREAM read_files("s3://jpmctraining/input_files/products",format=>"csv");

create streaming table customers_pl as select * from STREAM read_files("s3://jpmctraining/input_files/customers",format=>"csv");