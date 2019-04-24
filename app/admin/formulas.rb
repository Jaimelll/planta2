ActiveAdmin.register Formula do

    menu false


    permit_params  :codigo, :product_id,  :cantidad,
       :factor, :unidad, :seccion,
         :obs, :pedido, :admin_user_id, :for1
    
    
    
       member_action :activo, method: :put do
          @num=Formula.where(product_id: 3, cantidad:1).
                 select('id as dd').first.dd
         Formula.where( product_id:3 ).update_all( unidad:0 )
         Formula.where( product_id:3 ,cantidad: 1).update_all( unidad:1 )
         redirect_to admin_grafico_path
       end
 
       member_action :pasivo, method: :put do
          @num=Formula.where(product_id: 3, cantidad:1).
                 select('id as dd').first.dd
         Formula.where( product_id:3 ).update_all( unidad:0 )
         Formula.where( product_id:3 ,cantidad: 2).update_all( unidad:1 )
         redirect_to admin_grafico_path
       end

       member_action :resultado, method: :put do
          @num=Formula.where(product_id: 3, cantidad:1).
                 select('id as dd').first.dd
         Formula.where( product_id:3 ).update_all( unidad:0 )
         Formula.where( product_id:3 ,cantidad: 3).update_all( unidad:1 )
         redirect_to admin_grafico_path
       end
 
 
    
    
    
    
    filter :codigo
    filter :seccion
    filter :obs
    
    
    index :title => "Formulación"  do

            column("Material")do |mat|
               Product.where(id:mat.for1).select('nombre as dd').first.dd
            end  
            column("codigo")
           
            column("cantidad")
            column("factor")
            column("unidad")
            column("seccion")
              actions
          end
    
    
    
    
    
    
              form do |f|
    
    
                   nn=Product.where(id:params[:product_id]).
                            select('nombre as dd').first.dd.capitalize
                  f.inputs "#{nn}" do
                  f.input :product_id, :label => 'Producto' ,
                           :input_html => { :value => params[:product_id]}, :as => :hidden
                  
                  f.input :codigo, :input_html => { :style =>  'width:30%'}
                  f.input :cantidad, :input_html => { :style =>  'width:30%'}
                  f.input :factor, :input_html => { :style =>  'width:30%'}
                  f.input :unidad, :input_html => { :style =>  'width:30%'}
                  f.input :seccion, :input_html => { :style =>  'width:30%'}
                  f.input :obs, :input_html => { :style =>  'width:30%'}
                  f.input :pedido, :input_html => { :style =>  'width:30%'}
                  f.input :admin_user_id, :input_html => 
                           { :value => current_admin_user.id }, :as => :hidden
               end
                  f.actions
            end
    
    
    
    show do
    
    
              attributes_table do
    
                nn=Product.where(id:params[:product_id]).
                         select('nombre as dd').first.dd.capitalize
    
               

              
                row "Material" do |mat|
                  link_to "#{nn}", admin_product_formulas_path(formula.product_id)
                end 
                row :codigo
                row :cantidad
                row :factor
                row :unidad
                row :seccion
                row :acti
                row :obs
                row :pedido
                row "Modificado por" do |prod|
                  AdminUser.where(id:prod.admin_user_id).
                  select('email as dd').first.dd
                end 
              end
    
          end
    
          sidebar "Producto" do
            if params[:product_id] then
              
              nn="ir a."+Product.where(id:params[:product_id]).
              select('nombre as dd').first.dd.capitalize

          
           
              li link_to "#{nn}",  admin_product_formulas_path(params[:product_id])
         
           
          
          
          end# de if
          end # de sider
    
    
    
    
    end
    
