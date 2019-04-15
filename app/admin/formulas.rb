ActiveAdmin.register Formula do

    menu false


    permit_params  :codigo, :product_id,  :cantidad,
       :factor, :unidad, :seccion,
         :obs, :pedido, :admin_user_id
    
    
    
    
 
    
    
    
    
    filter :codigo
    filter :seccion
    filter :obs
    
    
    index :title => "Formulación"  do
            column("codigo")
            column("product_id")
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
    
                row :product_id do |formula|
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
    
    
    
    
    
    
    end
    
